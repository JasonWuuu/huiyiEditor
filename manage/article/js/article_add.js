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
    }).catch(function(){
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