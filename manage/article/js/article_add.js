function convertTableToImage(html) {
    var deferred = $.Deferred();
    var list = [];
    var container$ = $("<div></div>").append(html);

    container$.find("table").each(function (index, entity) {
        console.log("存在表格,将转化为图片");
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
        console.log('表格转图片失败');
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
            console.error('转换图片出错，可能遇到跨域问题,但仍可继续操作!', error);
            deferred.reject(error);
        });
    return deferred.promise();
}

//传入图片路径，返回base64
function getBase64(img) {
    function getBase64Image(img, width, height) {//width、height调用时传入具体像素值，控制大小 ,不传则默认图像大小
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
            deferred.resolve(getBase64Image(image));//将base64传给done上传处理
        };
        return deferred.promise();//问题要让onload完成后再return sessionStorage['imgTest']
    }
}

function splitUrl(urlArr) {
    var result = [];
    $(urlArr).each(function (index, entity) {
        var item = entity.substr(entity.indexOf('/') + 1);
        result.push(item);
    });
    return result;
}

function concatUrl(urlArr) {
    var year = new Date().getFullYear().toString();
    var month = (new Date().getMonth() + 1).toString();
    var preFixUrl = 'http://img.dakayi.cc/pic/' + year + month + '/';
    var result = [];
    $(urlArr).each(function (index, entity) {
        var item = preFixUrl + entity;
        result.push(item);
    });
    return result;
}

function mutipleCrop() {
    var imageUrls = $.trim($("[name='info_file']").val());
    var imageUrlList = [];
    if (imageUrls) {
        var arr = imageUrls.split("#");
        $(arr).each(function (index, entity) {
            if ($.trim(entity)) {
                imageUrlList.push(entity);
            }
        });
    }

    if (imageUrlList.length === 0) {
        var html$ = $("<div></div>").append($("[name='info_desc']").val());
        html$.find("img").each(function (index, entity) {
            var url = $.trim($(entity).attr("src"));
            //只有内网的图片才可以放进去
            if (new RegExp(window.location.origin).test(url)) {
                imageUrlList.push(url);
            }

        });
    }
    imageUrlList = splitUrl(imageUrlList);
    var croppedImageUrls = imageUrlList.join("#");
    $("[name='info_file']").val(croppedImageUrls);

    window.open("./crop/home.html", "批量裁剪图片", "width=1200,height=600");

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
        console.log($.trim($(this).val()));
        var imageStr = $.trim($(this).val());
        if (imageStr) {
            $("#modile_image_sortable").html('');
            var list = imageStr.split('#');
            $(list).each(function (index, entity) {
                var url = $.trim(entity);
                if (url) {
                    var template$ = $('<li class="ui-state-default"><img src="' + url + '" width="160px" height="90px"/></li>');
                    template$.appendTo("#modile_image_sortable");
                }
            });
        }
    });
});

