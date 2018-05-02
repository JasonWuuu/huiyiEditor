// var imageIndex = 0;
// function startCrop() {
//     var uploadedImageType = 'image/jpeg';
//     var option = { "maxWidth": 4096, "maxHeight": 4096 };
//     if (uploadedImageType === 'image/jpeg') {
//         if (!option) {
//             option = {};
//         }

//         option.fillColor = '#fff';
//     }
//     var $image = $('#image');
//     var result = $image.cropper('getCroppedCanvas', option, null);
//     if (result) {
//         var croppedImageUrl = result.toDataURL(uploadedImageType);
//         console.log('croppedImageUrl', croppedImageUrl);
//         var targetImage = $("[targetImage]").attr("targetImage");
//         var replaceTarget = "[dummyLoc=" + targetImage + "]";
//         // 如果dummyLoc是empty的话，就是用户上传的文件
//         // alert(targetImage);
//         if ($.trim(targetImage) == "") {
//             addImage(croppedImageUrl, imageIndex++);
//         } else {
//             $(replaceTarget).attr('src', croppedImageUrl);
//         }

//     }
// }

// function moveImageToCroppingArea() {
//     imgurl = $(this).attr('src');
//     dummyLoc = $(this).attr('dummyLoc');
//     var $image = $('#image');
//     $image.cropper('destroy').attr('src', imgurl).cropper({});

//     $("[targetImage]").attr("targetImage", dummyLoc);
// }


// function addssDummLoc() {
//     $("[targetImage]").attr("targetImage", "");// empty dummLoc 
//     console.log("user upload the file, need add its Dummloc");
// }


// $(".fa.fa-upload").on("click", addssDummLoc);
// $("#croppingImages").on("click", "img", moveImageToCroppingArea);
// $("#croppingImages").on("click", "button", removeImage);

// function addImage(src, index) {
//     // <div class="imageContainer">
//     //                         <div><img class="img-responsive center-block" src="1.jpg" dummyLoc='1' /></div>
//     //                         <div><button class="btn btn-primary">删除</button></div>
//     // 
//     var dummLoc = "user_" + index;
//     var userUpImg = $("<img class='img-responsive center-block' ></img>").attr("src", src).attr("dummyLoc", dummLoc);
//     var imageDiv = $("<div></div>").append(userUpImg);
//     var delBtn = $("<div><button class='btn btn-primary'>删除</button></div>");
//     var imageContainer = $("<div class='imageContainer'></div>");
//     imageContainer.append(imageDiv).append(delBtn);
//     console.log(userUpImg);
//     $("#croppingImages").append(imageContainer);
// }

// function removeImage() {
//     $(this).parent().parent().remove();
// }


var getImageId = (function () {
    var imageId = 1;
    return function () {
        imageId++;
        return imageId;
    };
})();

$(function () {
    function getInitImageList() {
        var info_file_id = window.opener.document.getElementById("info_file_id").value;
        var imageUrlList = [];
        if (info_file_id) {
            var arr = info_file_id.split("#");
            $(arr).each(function (index, entity) {
                if ($.trim(entity)) {
                    imageUrlList.push(entity);
                }
            });
        }
        return imageUrlList;
    }
    //将图片加载到图片集中
    var imageUrlList = getInitImageList();
    $(imageUrlList).each(function (index, entity) {
        addImage(entity);
    });

    //删除图片集合中的图片
    $("#croppingImages").on("click", "button", function () {
        $(this).parent().remove();
    });

    //上传新图片时，清空裁剪按钮上的data-id的值
    $(".fa.fa-upload").on("click", function () {
        $("#startToCrop").removeAttr("data-id");
    });

    //将选中的图片移动到编辑区域
    $("#croppingImages").on("click", "img", function () {
        imgurl = $(this).attr('src');
        dataId = $(this).parent().attr("data-id");
        var $image = $('#image');
        $image.cropper('destroy').attr('src', imgurl).cropper({});
        $("#startToCrop").attr("data-id", dataId);
    });
});

function startCrop() {
    var uploadedImageType = 'image/jpeg';
    var option = { "maxWidth": 4096, "maxHeight": 4096 };
    if (uploadedImageType === 'image/jpeg') {
        if (!option) {
            option = {};
        }

        option.fillColor = '#fff';
    }
    var $image = $('#image');
    var result = $image.cropper('getCroppedCanvas', option, null);
    if (result) {
        var croppedImageUrl = result.toDataURL(uploadedImageType);
        var dataId = $("#startToCrop").attr("data-id");
        if (dataId) {
            $("#croppingImages").find("[data-id=" + dataId + "]").find("img").attr("src", croppedImageUrl);
        } else {
            addImage(croppedImageUrl);
        }
    }
}

function addImage(croppedImageUrl) {
    var imageTemplate$ = $('<div class="imageContainer"><img class="img-responsive center-block" style="width:220px;"/><button type="button" class="close"><span aria-hidden="true">&times;</span></button></div>');
    var clone$ = imageTemplate$.clone(true);
    clone$.attr("data-id", getImageId());
    clone$.find("img").attr("src", croppedImageUrl);
    $("#croppingImages").append(clone$);
}

function complete() {
    var listPromise = [];
    var imageUrlsList = [];
    $("#croppingImages").find(".imageContainer").each(function (index, entity) {
        var myImage$ = $(this).find("img");
        var url = myImage$.attr("src");
        if (!/^http/.test(url)) {
            var pro = sumitImageFile(url).then(function (link) {
                myImage$.attr("data-src", link);
            });
            listPromise.push(pro);
        } else {
            myImage$.attr("data-src", url);
        }
    });

    Promise.all(listPromise).then(function () {
        $("#croppingImages").find(".imageContainer").each(function (index, entity) {
            var myImage$ = $(this).find("img");
            var url = myImage$.attr("data-src");
            imageUrlsList.push(url);
        });

        console.log(imageUrlsList);
        var croppedImageUrls = imageUrlsList.join("#");

        if (window.opener != null && !window.opener.closed) {
            var info_file_id = window.opener.document.getElementById("info_file_id");//获取父窗口中元素，也可以获取父窗体中的值
            info_file_id.value = croppedImageUrls;//将子窗体中的值传递到父窗体中去
        }

        window.close();
    });



}
