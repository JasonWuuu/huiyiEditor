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
        var categoryContainer = $("<ul></ul>").addClass("list-group");
        $.each(templateCategory, function(index, data){
            var categoryDiv = $("<li></li>").addClass("list-group-item").text(data);
            var btn = $('<button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>');
            categoryDiv.append(btn);
            categoryContainer.append(categoryDiv);

        });

        categoryContainer.append($("<button class='btn btn-default'></button>")
                                    .attr("data-target", "#addTemplateCategory")
                                    .text("添加"));
        $("#templateCategoryList").html(categoryContainer.html());
    });

    $("#templateCategoryList").on("click", "button", addTemplateCategory);

    function addTemplateCategory(){
        
    }

})