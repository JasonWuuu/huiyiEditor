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

function calcSelectedImageCount() {
    var totalCount = $("#croppingImages").find(".imageContainer").length;
    var selectedCount = $("#croppingImages").find(".imageContainer").find(".imageSelected").length;
    $(".selected-area .selectedCount").text(selectedCount);
    $(".selected-area .totalCount").text(totalCount);
}

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
        imageUrlList = concatUrl(imageUrlList);
        return imageUrlList;
    }
    var dataFlag = window.opener.document.getElementById("btn_crop").getAttribute("data-flag");
    console.log(dataFlag);
    //��ͼƬ���ص�ͼƬ����
    var imageUrlList = getInitImageList();
    $(imageUrlList).each(function (index, entity) {
        addImage(entity, "unselected");
    });

    //ɾ��ͼƬ�����е�ͼƬ
    $("#croppingImages").on("click", "button", function () {
        $(this).parent().remove();
        calcSelectedImageCount();
    });

    // ͼƬѡ���¼�
    $("#croppingImages").on("click", "i.fa-check-circle", function () {
        if ($(this).hasClass("imageUnselected")) {
            $(this).removeClass("imageUnselected");
            $(this).addClass("imageSelected");
        } else {
            $(this).removeClass("imageSelected");
            $(this).addClass("imageUnselected");
        }
        calcSelectedImageCount();
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
        var options = {
            aspectRatio: 16 / 9,
            preview: '.img-preview',
            crop: function (e) {
                $dataX.val(Math.round(e.detail.x));
                $dataY.val(Math.round(e.detail.y));
                $dataHeight.val(Math.round(e.detail.height));
                $dataWidth.val(Math.round(e.detail.width));
                $dataRotate.val(e.detail.rotate);
                $dataScaleX.val(e.detail.scaleX);
                $dataScaleY.val(e.detail.scaleY);
            }
        };
        $image.cropper('destroy').attr('src', imgurl).cropper(options);
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
            addImage(croppedImageUrl,"selected");
        }
    }
}

function addImage(croppedImageUrl, isSelected) {
    var imageTemplate$ = null;
    if (isSelected  == "selected" ) {
        console.log("image is selected");
        imageTemplate$ = $('<div class="imageContainer"><img class="img-responsive center-block" style="width:220px;height:124px;" /><span><i class="fa fa-check-circle imageSelected" /></span><button type="button" class="close imageClose"><span aria-hidden="true">&times;</span></button></div>');
    }
    else {
        console.log("image is unselected");
        imageTemplate$ = $('<div class="imageContainer"><img class="img-responsive center-block" style="width:220px;height:124px;" /><span><i class="fa fa-check-circle imageUnselected" /></span><button type="button" class="close imageClose"><span aria-hidden="true">&times;</span></button></div>');
    }
    var clone$ = imageTemplate$.clone(true);
    clone$.attr("data-id", getImageId());
    clone$.find("img").attr("src", croppedImageUrl);
    $("#croppingImages").append(clone$);
    calcSelectedImageCount();
}

function complete() {
    var listPromise = [];
    var imageUrlsList = [];
    $("#croppingImages").find(".imageContainer").each(function (index, entity) {
        //�ж�ͼƬ�Ƿ�ѡ��
        if (!$(this).find("span > i.imageSelected")[0]) {
            return;
        }
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
            if ($(this).find("span > i.imageSelected")[0]) {
                var myImage$ = $(this).find("img");
                var url = myImage$.attr("data-src");
                imageUrlsList.push(url);
            }
        });
        var splitedImageUrlsList = splitUrl(imageUrlsList);
        console.log(imageUrlsList);
        var croppedImageUrls = splitedImageUrlsList.join("#");

        if (window.opener != null && !window.opener.closed) {
            var info_file_id = window.opener.document.getElementById("info_file_id");//��ȡ��������Ԫ�أ�Ҳ���Ի�ȡ�������е�ֵ
            info_file_id.value = croppedImageUrls;//���Ӵ����е�ֵ���ݵ���������ȥ

            var modile_image_sortable = window.opener.document.getElementById("modile_image_sortable");//��ȡ��������Ԫ�أ�Ҳ���Ի�ȡ�������е�ֵ

            console.log(modile_image_sortable);
            var liList = [];
            $(imageUrlsList).each(function (index, entity) {
                liList.push('<li class="ui-state-default"><img src="' + entity + '" width="160px" height="90px"/></li>');
            });

            modile_image_sortable.innerHTML = liList.join('');
        }

        window.close();
    });
}

function splitUrl(urlArr) {
    var result = []; $(urlArr).each(function (index, entity) {
        var item = entity.substr(entity.lastIndexOf('/')
            + 1); result.push(item);
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
    var preFixUrl = 'http://img.dakayi.cc/pic/' + year + formatMonth(month) + '/';
    var result = [];
    $(urlArr).each(function (index, entity) {
        var item = preFixUrl + entity; result.push(item);
    });
    return result;
}