$(function () {
    $("[href='#templateCategory']").click(function () {

        // if (!$.trim($("#templateCategory").html())) {
        //     var url = 'http://www.135editor.com/editor_styles/systemTemplates';
        //     $.get(url).then(function (data) {
        //         templateCache = cacheTemplatesInfo(data); //?????????template????????
        //         var templateHtml = $(data).find("#system-template-list").html();
        //         $("#templateCategoryList").html(templateHtml);
        //     });
        // }
        var templateCategory=["金银牌VIP", "独家视点", "市场快报", "国际热点", "上市公司", "其他"];
        listTemplateCategory();
    });

    $("#addTemplateCategoryBtn").on("click", addTemplateCategory);
    $("#templateCategoryList").on("click", "span", removeTemplateCategory);

    function removeTemplateCategory(){
        var dataId = $(this).parent().parent().attr("data-id");
        var url = './article_category_delete?id='+dataId;
        $.get(url).then(function (data) {
            console.log("delete the category:" + data);
            listTemplateCategory();
        });
        
    }

    function addTemplateCategory(){
        var newCategoryName = $("#newTemplateCategory").val();
        var url = './article_category_add.asp';
        $.post(url, { cname: newCategoryName }, function (data) {
            listTemplateCategory();
        });

    }

    //
    function listTemplateCategory(){
        var categoryList = [];
        var url = './article_category_list.asp';
        var categoryContainer = $("<ul></ul>").addClass("list-group");
        $.get(url).then(function (data) {
            var ulData = "<div>" + data + "</div>";
            $(ulData).find("div").each(function(index, entity){
                var categoryDiv = $("<li></li>").addClass("list-group-item").attr("data-id", $(entity).attr("data-id")).text($(entity).text());
                var btn = $('<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
                categoryDiv.append(btn);
                categoryContainer.append(categoryDiv);
            });
            categoryContainer.append($("<button class='btn btn-primary'></button>")
                                    .attr("data-target", "#addTemplateCategory")
                                    .attr("data-toggle", "modal")
                                    .text("添加"));
            $("#templateCategoryList").html(categoryContainer.html());

        });
    }

})