/**  
 * ͨ��ueditor��base64ͼƬ�ύ��������,����jquery.
 * var base64str = "data:image/png;base64,/9j/4AAQSkZJRg................ABAQAAAQABAAD/2wBDAAMCAgICOK//Z";
 * sumitImageFile(base64str).then(function (data) {
 *     console.log(data);
 * });
 */
function sumitImageFile(base64Codes) {

    var convertBase64UrlToBlob = function (urlData) {
        var arr = urlData.split(',');
        var mime = arr[0].match(/:(.*?);/)[1];
        var bytes = window.atob(urlData.split(',')[1]);        //ȥ��url��ͷ����ת��Ϊbyte  

        //�����쳣,��ascii��С��0��ת��Ϊ����0  
        var ab = new ArrayBuffer(bytes.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }

        return new Blob([ab], { type: mime });
    };

    var getFileExt = function (urlData) {
        var arr = urlData.split(',');
        var mime = arr[0].match(/:(.*?);/)[1];
        return mime.replace("image/", "");
    };

    var deferred = $.Deferred();

    var form = document.forms[0];

    //var formData = new FormData(form);   //��������form�����������Ҳһ���ύ��,�������Ҫ�ύ������������ֱ��FormData�޲����Ĺ��캯��  
    var formData = new FormData();

    var fileExt = getFileExt(base64Codes);

    //convertBase64UrlToBlob�����ǽ�base64����ת��ΪBlob  
    formData.append("upfile", convertBase64UrlToBlob(base64Codes), "file_" + Date.parse(new Date()) + "." + fileExt);  //append�����ĵ�һ�������Ǻ�̨��ȡ���ݵĲ�����,��html��ǩ��input��name���Թ�����ͬ  

    //ajax �ύform  
    $.ajax({
        url: window.location.origin + '/article/ueditor/asp/controller.asp?action=uploadimage',
        type: "POST",
        data: formData,
        //dataType: "text",
        processData: false,         // ����jQuery��Ҫȥ�����͵�����  
        contentType: false,        // ����jQuery��Ҫȥ����Content-Type����ͷ  

        success: function (data) {
            //console.log(data);
            if (data) {
                data = JSON.parse(data);
                if (data.state == "SUCCESS") {
                    deferred.resolve(window.location.origin + data.url);
                }
                else {
                    deferred.reject("error");
                }
            }

            else {
                deferred.reject("error");
            }

            //window.location.href = "${ctx}" + data;
        },
        xhr: function () {            //��jquery������ֱ��ʹ��ajax��XMLHttpRequest����  
            var xhr = new XMLHttpRequest();

            xhr.upload.addEventListener("progress", function (evt) {
                if (evt.lengthComputable) {
                    var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                    console.log("�����ύ." + percentComplete.toString() + '%');        //�ڿ���̨��ӡ�ϴ�����  
                }
            }, false);

            return xhr;
        }

    });

    return deferred.promise();
}


// UE.getEditor('editor').addListener("contentChange",function(){
//     var oriHtml = UE.getEditor('editor').getContent();
//     $("<div>" + oriHtml + "</div>").find("img").each(function(){
//         var width = $(this).css("width");
//         if(width.indexOf("px")>=0  && parseInt(width.substring(0, width.indexOf("px"))) > 500 ){
//             $(this).css("width", "100%");
//         }
        
//     });
// });