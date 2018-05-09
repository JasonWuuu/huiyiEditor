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

function splitUrl(urlArr) {
    var result = []; $(urlArr).each(function (index, entity) {
        var item = entity.substr(entity.lastIndexOf('/') + 1);
        result.push(item);
    }); return result;
}

function concatUrl(urlArr) {
    var year = new Date().getFullYear().toString();
    var month = new Date().getMonth() + 1;
    var formatMonth = function (num) {
        if (num < 10) {
            return "0" + num;   //如果时分秒少于10，则在前面加字符串0
        }
        else {
            return "" + num;        //否则，直接返回原有数字
        }
    }
    var preFixUrl = 'http://img.dakayi.cc/pic/' + year + formatMonth(month) + '/';
    var result = [];
    $(urlArr).each(function (index, entity) {
        var item = preFixUrl + entity; result.push(item);
    });
    return result;
}

function stringToList(arrStr, splitChar) {
    var list = [];
    var arr = arrStr.split(splitChar);
    if (arr) {
        $(arr).each(function (index, entity) {
            if (entity && $.trim(entity)) {
                list.push($.trim(entity));
            }
        });
    }
    return list;
}

function getSelectedImageList() {
    var info_file_id = window.opener.document.getElementById("info_file_id").value;
    var selectedImageUrlList = stringToList(info_file_id, '#');
    selectedImageUrlList = concatUrl(selectedImageUrlList);
    return selectedImageUrlList;
}

function getGalleryImageList() {
    var galleryUrlsString = window.opener.document.getElementById("hdn_gallery").value;
    var galleryUrlsList = stringToList(galleryUrlsString, '#');
    galleryUrlsList = concatUrl(galleryUrlsList);
    return galleryUrlsList;
}

function writeUrlListToTextarea(list) {
    var splitedUrlList = splitUrl(list);
    var selectedImageUrlsString = splitedUrlList.join('#');
    window.opener.document.getElementById("info_file_id").value = selectedImageUrlsString;
}

function writeUrlListToGallery(list) {
    var splitedUrlList = splitUrl(list);
    var galleryUrlsString = splitedUrlList.join('#');
    window.opener.document.getElementById("hdn_gallery").value = galleryUrlsString;
}
function writeUrlListToImageSortable(list) {
    var liList = [];
    if (list) {
        $(list).each(function (index, entity) {
            liList.push('<li class="ui-state-default"><img src="' + entity + '" width="160px" height="90px"/></li>');
        });
    }
    var modile_image_sortable = window.opener.document.getElementById("modile_image_sortable");
    modile_image_sortable.innerHTML = liList.join('');
}

$(function () {
    //将图片加载到图片集中
    var selectedImageList = getSelectedImageList();
    $(selectedImageList).each(function (index, entity) {
        addImage(entity, true);
    });
    var galleryImageList = getGalleryImageList();
    $(galleryImageList).each(function (index, entity) {
        addImage(entity, false);
    });

    //删除图片集合中的图片
    $("#croppingImages").on("click", "button", function () {
        $(this).parent().remove();
        calcSelectedImageCount();
    });

    // 图片选择事件
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

    //上传新图片时，清空裁剪按钮上的data-id的值
    $(".fa.fa-upload").on("click", function () {
        $("#startToCrop").removeAttr("data-id");
    });

    //将选中的图片移动到编辑区域
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
            $("#croppingImages").find("[data-id=" + dataId + "]").find("span > i").removeClass("imageUnselected").addClass("imageSelected");
            calcSelectedImageCount();
        } else {
            addImage(croppedImageUrl, true);
        }
    }
}

function addImage(croppedImageUrl, isSelected) {
    var imageTemplate$ = null;
    if (isSelected) {
        imageTemplate$ = $('<div class="imageContainer"><img class="img-responsive center-block" style="width:220px;height:124px;" /><span><i class="fa fa-check-circle imageSelected" /></span><button type="button" class="close imageClose"><span aria-hidden="true">&times;</span></button></div>');
    }
    else {
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
    var selectedImageList = [];
    var galleryImageList = [];
    $("#uploadLoading").show();
    //将所有图片批量上传
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
        $("#uploadLoading").hide();
        $("#croppingImages").find(".imageContainer").each(function (index, entity) {
            var myImage$ = $(this).find("img");
            var url = myImage$.attr("data-src");
            if ($(this).find("span > i.imageSelected").length > 0) {
                selectedImageList.push(url);
            }
            else {
                galleryImageList.push(url);
            }
        });

        if (window.opener != null && !window.opener.closed) {
            writeUrlListToTextarea(selectedImageList);
            writeUrlListToGallery(galleryImageList);
            writeUrlListToImageSortable(selectedImageList);
        }
        window.close();
    });
}

