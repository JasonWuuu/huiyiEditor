function convertTableToImage(html) {
    var deferred = $.Deferred();
    var list = [];
    var container$ = $("<div></div>").append(html);

    container$.find("table").each(function (index, entity) {
        console.log("���ڱ���,��ת��ΪͼƬ");
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
    }).catch(function(){
        console.log('����תͼƬʧ��');
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
            console.error('ת��ͼƬ����������������������,���Կɼ�������!', error);
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