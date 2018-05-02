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
//         // ���dummyLoc��empty�Ļ��������û��ϴ����ļ�
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
//     //                         <div><button class="btn btn-primary">ɾ��</button></div>
//     // 
//     var dummLoc = "user_" + index;
//     var userUpImg = $("<img class='img-responsive center-block' ></img>").attr("src", src).attr("dummyLoc", dummLoc);
//     var imageDiv = $("<div></div>").append(userUpImg);
//     var delBtn = $("<div><button class='btn btn-primary'>ɾ��</button></div>");
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
    //��ͼƬ���ص�ͼƬ����
    var imageUrlList = getInitImageList();
    $(imageUrlList).each(function (index, entity) {
        addImage(entity);
    });

    //ɾ��ͼƬ�����е�ͼƬ
    $("#croppingImages").on("click", "button", function () {
        $(this).parent().remove();
    });

    //�ϴ���ͼƬʱ����ղü���ť�ϵ�data-id��ֵ
    $(".fa.fa-upload").on("click", function () {
        $("#startToCrop").removeAttr("data-id");
    });

    //��ѡ�е�ͼƬ�ƶ����༭����
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
            var info_file_id = window.opener.document.getElementById("info_file_id");//��ȡ��������Ԫ�أ�Ҳ���Ի�ȡ�������е�ֵ
            info_file_id.value = croppedImageUrls;//���Ӵ����е�ֵ���ݵ���������ȥ
        }

        window.close();
    });



}
