function convertTableToImage(html) {
    var deferred = $.Deferred();
    var list = [];
    var container$ = $("<div></div>").append(html);

    container$.find("table").each(function (index, entity) {
        console.log("���ڱ��,��ת��ΪͼƬ");
        var flag$ = $('<span class="htmlToImageFlag"></span>');
        flag$.insertBefore(entity);
        var p = domToimage(entity).then(function (img) {
            $(img).insertAfter(flag$);
            flag$.remove();
        });
        list.push(p);
    });

    return Promise.all(list).then(function () {
        var convertedHtml = container$.html();
        return convertedHtml;
    }).catch(function () {
        console.log('���תͼƬʧ��');
    });
}

function domToimage(table) {
    var deferred = $.Deferred();
    var parent1$ = $("<div></div>");
    var node$ = $('<div></div>').append(table);
    node$.appendTo('body');
    var node = node$[0];
    domtoimage.toPng(node)
        .then(function (dataUrl) {
            return sumitImageFile(dataUrl);
        }).then(function (src) {
            // console.log(src);
            var img = new Image();
            img.src = src;
            var parent2$ = $("<div></div>");
            parent2$.append(img);
            parent1$.append(parent2$);
        })
        .then(function () {
            node$.remove();
            deferred.resolve(parent1$.html());
        })
        .catch(function (error) {
            node$.remove();
            console.error('ת��ͼƬ��������������������,���Կɼ�������!', error);
            deferred.reject(error);
        });
    return deferred.promise();
}

//����ͼƬ·��������base64
function getBase64(img) {
    function getBase64Image(img, width, height) {//width��height����ʱ�����������ֵ�����ƴ�С ,������Ĭ��ͼ���С
        var canvas = document.createElement("canvas");
        canvas.width = width ? width : img.width;
        canvas.height = height ? height : img.height;

        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        var dataURL = canvas.toDataURL();
        return dataURL;
    }
    var image = new Image();
    image.crossOrigin = '';
    image.src = img;
    var deferred = $.Deferred();
    if (img) {
        image.onload = function () {
            deferred.resolve(getBase64Image(image));//��base64����done�ϴ�����
        };
        return deferred.promise();//����Ҫ��onload��ɺ���return sessionStorage['imgTest']
    }
}

function splitUrl(urlArr) {
    var result = []; $(urlArr).each(function (index, entity) {
        var item = entity.replace("http://img.dakayi.cc/pic/","");
         result.push(item);
    }); return result;
}

function concatUrl(urlArr) {
    var year = new Date().getFullYear().toString();
    var month = new Date().getMonth() + 1;
    var formatMonth = function (num) {
        if (num < 10) {
            return "0" + num;   //���ʱ��������10������ǰ����ַ���0
        }
        else {
            return "" + num;        //����ֱ�ӷ���ԭ������
        }
    }
    var preFixUrl = 'http://img.dakayi.cc/pic/';
    var result = [];
    $(urlArr).each(function (index, entity) {
        var item = preFixUrl + entity; result.push(item);
    });
    return result;
}

function mutipleCrop() {
    var imageUrlList = [];
    if (!$.trim($("#hdn_gallery").val())){
        var html$ = $("<div></div>").append($("[name='info_desc']").val());
        html$.find("img").each(function (index, entity) {
            var url = $.trim($(entity).attr("src"));
            //ֻ��������ͼƬ�ſ��ԷŽ�ȥ
            if (new RegExp(window.location.origin).test(url)) {
                imageUrlList.push(url);
            }

        });
        imageUrlList = splitUrl(imageUrlList);
        var galleryUrls = imageUrlList.join("#");
        $("#hdn_gallery").val(galleryUrls);
    }
    
    window.open("./crop_modi/home.html", "�����ü�ͼƬ", "width=1200,height=600");

}

function clearImageBuffer(){
    $("#hdn_gallery").val("");
    $("[name='info_file']").val("");
    $("#modile_image_sortable").html("");
    alert("���»�ȡ����ͼƬ�ɹ��������²ü��ֻ�ͼƬ��");
}

$(function () {
    $("#modile_image_sortable").sortable({
        placeholder: "ui-state-highlight"
    });
    $("#modile_image_sortable").disableSelection();
    $("#modile_image_sortable").on("sortstop", function (event, ui) { 
        var srcList = [];
        $("#modile_image_sortable").find("li img").each(function (index, entity) {
            srcList.push($(entity).attr("src"));
        });
        srcList = splitUrl(srcList);
        $("#info_file_id").val(srcList.join('#'));
    });
    $("#info_file_id").on('change', function () {
       
        var imageStr = $.trim($(this).val());
        if (imageStr) {
            $("#modile_image_sortable").html('');
            var list = imageStr.split('#');
            list = concatUrl(list);
            $(list).each(function (index, entity) {
                var url = $.trim(entity);
                if (url) {
                    var template$ = $('<li class="ui-state-default"><img src="' + url + '" width="160px" height="90px"/></li>');
                    template$.appendTo("#modile_image_sortable");
                }
            });
        }
    }).trigger("change");
});

