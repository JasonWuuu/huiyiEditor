<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

<%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
%>
<html>
<head>
    <title>文章增加</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
        <!--
        .main {
            font-size: 9pt
        }
        -->
    </style>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>

    <script src="./ueditor/index_ueditor.js"></script>
    <script src="./ueditor/index_135editor.js"></script>
    <script src="./ueditor/index_135editor_styles.js"></script>
    <script src="./ueditor/index_135editor_htmlParsersList.js"></script>
    <script src="./ueditor/index_135editor_systemTemplates.js"></script>
    <script src="./ueditor/index_135editor_draft.js"></script>
    <script src="./js/dom-to-image.js"></script>
    <script src="./js/article_add.js"></script>
    <link href="./article_add.css" rel="stylesheet">
</head>

<body bgcolor="#FFFFFF">

    <script language="javascript">

        var lsdz = "";
        function checkIn() {
            if (document.un.class_no.options[document.un.class_no.selectedIndex].value < 1) {
                alert("类别必须选择");
                document.un.b_id.focus();
                return false;
            }



            if (document.un.info_title.value.length < 1) {
                alert("标题必须填写");
                document.un.info_title.focus();
                return false;
            }
            if (document.un.sub_title.value.length < 1) {
                alert("副标题必须填写");
                document.un.sub_title.focus();
                return false;
            }


            if (document.un.info_file.value.length < 1) {
                alert("小图片必须填写和上传");
                document.un.info_file.focus();
                return false;
            }

            if (confirm("你现在要提交吗?"))
                return true
            else
                return false;
        }
    </script>
    <div align="center">
    <h2>（内部资料系统管理）内容与文章系统增加</h2>
    <hr>
    <form method="POST" action="article_save.asp" name="un">
        <table style="width:953px;" class="table table-bordered">
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">类别：</td>
                <td width="79%" class="main">
                    <select name="class_no" class="form-control" style="width:200px;">
                        <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
                        %>
                        <option value="<%=RS1("CLASS_NO")%>">
                            <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
                            %>
                            <%=RS1("CLASS_NAME")%></option>
                        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
                        %>
                    </select>
                </td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">资料标题：</td>
                <td width="79%" class="main">

                    <textarea name="info_title" rows="10" cols="60" class="form-control"></textarea>标题用#号分开
           <input type="radio" name="colorxz" checked value="">
                    正常
             <input type="radio" name="colorxz" value="标红">
                    标红</td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">副标题（100字以内）：</td>
                <td width="79%" class="main">
                    <textarea name="sub_title" rows="4" cols="60" class="form-control"></textarea>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">简介：<br/><font color="red">(如包含外部图片，则显示文本)</font></td>
                <td width="79%" class="main">
                    <div style="width:735px;">
                    <textarea name="info_desc" rows="20" cols="60" class="form-control"></textarea>
                    </div>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">视频URL：</td>
                <td width="79%" class="main">
                    <input type="text" name="sp_url" size="30" class="form-control">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">视频外-URL：</td>
                <td width="79%" class="main">
                    <input type="text" name="sp_url_out" size="30" class="form-control">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">是否是HTML方式：</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_html" value="是" checked>
                    是 
        <input type="radio" name="if_html" value="否">
                    否 </td>
            </tr>


            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">资料来源：</td>
                <td width="79%" class="main">
                    <input type="text" name="info_source" size="30" class="form-control">
                </td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">手机图片：</td>
                <td width="79%" class="main">
                    <textarea id="info_file_id" name="info_file" rows="10" cols="60" class="form-control"></textarea>
                    <button class="btn" type="button" onclick="mutipleCrop()">批量裁剪图片</button>用#号分开，对应标题
		 <font color="red">制作小的图片200X200的，可以为空</font>
                </td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">相关栏目：</td>
                <td width="79%" class="main">
                    <%
			SQL = "SELECT * FROM A_CLASS WHERE JIBIE=1 ORDER BY NUM "
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
                    %>
                    <input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>"><%=RS1("Class_NAME")%>
                    <%
				'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM "
						RS2.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS2.EOF
                    %>
                    <input type="checkbox" name="class_corre" value="<%=RS2("class_no")%>"><%=RS2("Class_NAME")%>
                    <%
						
							'XIAO LEIBIE
								SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS2("CLASS_NO") & "' AND CLASS_NO <>'" & RS2("CLASS_NO") & "' ORDER BY NUM "
									RS3.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
									DO WHILE NOT RS3.EOF
                    %>
                    <input type="checkbox" name="class_corre" value="<%=RS3("class_no")%>"><%=RS3("Class_NAME")%>
                    <%
									RS3.MoveNext 
									LOOP
									RS3.Close 
						
						RS2.MoveNext 
						LOOP
						RS2.Close 
						
                    %>
                    <br>
                    <%
				RS1.MoveNext 
				LOOP
			RS1.Close 
                    %>
		
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">所属专题：</td>
                <td width="79%" class="main">
                    <%
		 I = 1
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
					IF I = 7 THEN
				Response.Write("<br>")
				I = 1
				END IF
                    %>
                    <input type="checkbox" name="zhuanti" value="<%=RS1("zt_name")%>"><%=RS1("zt_NAME")%>
                    <%
				I = I + 1
					RS1.MoveNext 
				LOOP
			RS1.Close 
                    %>
		 
		 
		 
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">是否备忘：</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_bw" value="是">
                    是 
        <input type="radio" name="if_bw" value="否" checked>
                    否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">是否推荐：</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_tj" value="是">
                    是 
        <input type="radio" name="if_tj" value="否" checked>
                    否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="2">
                    <div align="center">
                        <br>
                        <input type="submit" name="Submit" value="提交申请" onclick="return checkIn();" class="btn btn-primary">
                        <input type="reset" name="Submit2" value="重填信息" class="btn">
                        <input type="button" name="home" value="返    回" onclick="history.back();" class="btn">
                    </div>
                </td>
        </table>
    </form>

    <!-- Show the cropped image in modal -->
    <div class="modal fade docs-cropped" id="myNewStyleEditor" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle"
        role="dialog" tabindex="-1" style="z-index:500;">
        <div class="modal-dialog modal-lg" style="width: 1200px;">
            <div class="modal-content" >
                <div class="modal-header">
                    <h5 class="modal-title" id="getCroppedCanvasTitle">编辑器</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body my-editor-container">
                    <!-- Content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6" style="height: 100%;">
                                <div class="row left-container">
                                    <div class="col-md-3" style="padding: 0px;">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active" style="width: 120px;">
                                                <a href="#styles" aria-controls="styles" role="tab" data-toggle="tab">样式</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#htmlParsersList" aria-controls="htmlParsersList" role="tab" data-toggle="tab">一键排版</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#editor-tpls" aria-controls="editor-tpls" role="tab" data-toggle="tab">模版</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#editor-draft" aria-controls="editor-draft" role="tab" data-toggle="tab">草稿箱</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="styles">
                                                <ul class="nav nav-pills  nav-toolbars">
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">标题
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-229">编号标题</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-237">框线标题</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-233">底色标题</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-232">图片标题</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-284">纯序号</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">正文
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-1089">引用</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-238">段落文字</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-226">边框内容</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-228">底色内容</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-230">序号/轴线</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-231">单页</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-235">竖排</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">引导
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".cate-53">分割线</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-261">引导关注</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-262">引导阅读原文</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-811">引导分享</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-263">引导赞</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-939">二维码</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">图文
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-222">图片样式</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-223">上下图文</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-224">左右图文</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-239">单图</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-240">双图</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-241">三图</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-242">三个以上</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-225">背景/信纸</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-234">音频/视频</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-236">对话</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">布局
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-702">左右留白</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-292">表格样式</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">节日行业
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu" style="right: 0; left: auto; text-align: right;">
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-248">元宵节</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1119">春季</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-288">妇女节</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1122">植树节</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1123">315</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-250">清明节</a>
                                                            </li>

                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-297">教育</a>
                                                            </li>

                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-940">活动</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-257">电商</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-234">视听</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-857">医疗</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-878">母婴</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="style-result pre-scrollable" style="max-height: 800px;">
                                                    样式...
                                                </div>

                                            </div>
                                            <div role="tabpanel" class="tab-pane pre-scrollable" id="htmlParsersList" style="max-height: 700px;">
                                                <div style="background-color: #d9edf7; padding: 10px; border-color: #bce8f1; color: #3a87ad;">
                                                    <p style="font-size: 16px; clear: none;">
                                                        <strong style="color: red;">提示：</strong>① 在编辑器中粘贴或者输入所有内容，② 点击对应的一键排版规则,③ 全文内容实现自动排版
                                                    </p>
                                                </div>


                                                <div id="html-parsers-items">
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="editor-tpls" style="max-height: 700px;">
                                                <ul id="editor-tpls-navtab" class="nav nav-tabs" style="border: 0 none;">
                                                    <li class="nav-item ignore col-sm-4 active" id="personal-tpl-list-li">
                                                        <a class="nav-link" href="#personalTemplates" data-refresh="always" data-url="/user_styles/myStyles" role="tab" data-toggle="tab"
                                                            aria-selected="true">个人模板</a>
                                                    </li>
                                                    <li class="nav-item ignore col-sm-4" id="favorite-tpl-list-li">
                                                        <a class="nav-link" href="#otherColleagueTemplates" data-refresh="always" data-url="/editor_styles/favorTemplates" role="tab"
                                                            data-toggle="tab" aria-selected="false">其他模板</a>
                                                    </li>
                                                    <li class="nav-item ignore  col-sm-4">
                                                        <a class="nav-link" href="#systemTemplates" data-url="/editor_styles/systemTemplates" role="tab" data-toggle="tab" aria-selected="false">系统模板</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content" style="padding: 0px; overflow-x: hidden;" id="tpl-tab-content">
                                                    <div id="personalTemplates" class="tab-pane active  pre-scrollable" style="max-height: 700px;">
                                                    </div>
                                                    <div id="otherColleagueTemplates" class="tab-pane  pre-scrollable" style="max-height: 700px;">
                                                        
                                                    </div>
                                                    <div id="systemTemplates" class="tab-pane  pre-scrollable" style="max-height: 700px;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane pre-scrollable" id="editor-draft" style="max-height: 700px;">
                                                <ul id="editor-tpls-navtab" class="nav nav-tabs" style="border: 0 none;">
                                                    <li class="nav-item ignore col-sm-4 active" id="personal-tpl-list-li">
                                                        <a class="nav-link" href="#personalDraft" data-refresh="always" data-url="" role="tab" data-toggle="tab"
                                                            aria-selected="true">个人草稿</a>
                                                    </li>
                                                    
                                                </ul>
                                                    <div id="personalDraft" class="tab-pane active " style="max-height: 700px;">

                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <div class="right-container">
                                    <div>
                                        <script id="editor" type="text/plain" style="width: 100%; height: 600px;"></script>
                                    </div>
                                    <div class="editorslide" data-step="3" data-position="left">
                                        <ul>
                                            <li>
                                                <button type="button" id="save-as-draft" tabindex="2" class="btn btn-default btn-xs" data-container="body" data-placement="left"
                                                    title="" data-original-title="保存内容">
                                                    保存到草稿</button>
                                            </li>
                                            <li>
                                                <button type="button" id="save-as-template" tabindex="2" class="btn btn-default btn-xs" data-container="body" data-placement="left"
                                                    title="" data-original-title="保存内容">
                                                    保存到模板</button>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- <div id="btns">
                        <div>
                            <button onclick="getAllHtml()">获得整个html的内容</button>
                            <button onclick="getContent()">获得内容</button>
                            <button onclick="setContent()">写入内容</button>
                            <button onclick="setContent(true)">追加内容</button>
                            <button onclick="getContentTxt()">获得纯文本</button>
                            <button onclick="getPlainTxt()">获得带格式的纯文本</button>
                            <button onclick="hasContent()">判断是否有内容</button>
                            <button onclick="setFocus()">使编辑器获得焦点</button>
                            <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
                            <button onmousedown="setblur(event)">编辑器失去焦点</button>

                        </div>
                        <div>
                            <button onclick="getText()">获得当前选中的文本</button>
                            <button onclick="insertHtml()">插入给定的内容</button>
                            <button id="enable" onclick="setEnabled()">可以编辑</button>
                            <button onclick="setDisabled()">不可编辑</button>
                            <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
                            <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
                            <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
                        </div>

                        <div>
                            <button onclick="getLocalData()">获取草稿箱内容</button>
                            <button onclick="clearLocalData()">清空草稿箱</button>
                        </div>

                    </div>
                    <div>
                        <button onclick="createEditor()">
                            创建编辑器</button>
                        <button onclick="deleteEditor()">
                            删除编辑器</button>
                    </div> -->

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <a class="btn btn-primary" id="download" href="javascript:void(0);" onclick="completeEdit()">确定</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->


</body>
</html>

<script>
    $(function(){
        $("[name='info_desc']").on("click",function(){
            $("#myNewStyleEditor").modal({
                backdrop: "static",
                show: true
            });
        });
        $("[name='info_desc']").focus(function(){
            $(this).trigger("click");
        });
    });

    function completeEdit(){
        if($.trim(UE.getEditor("editor").getContentTxt())){
            var html = UE.getEditor("editor").getContent();
            
            convertTableToImage(html).then(function(data){
                $("[name='info_desc']").html(data);
                return data;
                }).then(function(data){
                   var htmlImag$= $("<div></div>").css({width:"735px"}).append(data);
                    return domToimage(htmlImag$[0]);
                }).then(function(data){
                    var src=$(data).find("img").attr("src");
                    $("[name='info_desc']").parent().css({backgroundImage:"url("+ src+")",backgroundRepeat:"no-repeat"});
                    $("[name='info_desc']").css({opacity:0,cursor:"hand"});
                    $("#myNewStyleEditor").modal("hide");
                }).catch(function(){
                    $("[name='info_desc']").parent().removeAttr("style").css({width:"735px"});
                    $("[name='info_desc']").css({opacity:1,cursor:"text"});
                    $("#myNewStyleEditor").modal("hide");
                });
            }
        else{
            alert("编辑器中必须包含文字");
            $("#myNewStyleEditor").modal("hide");
        }
    }

    function mutipleCrop(){
       var imageUrls= $.trim($("[name='info_file']").val());
       var imageUrlList=[];
       if(imageUrls){
          var arr= imageUrls.split("#");
          $(arr).each(function(index,entity){
              if($.trim(entity)){
                imageUrlList.push(entity);
              }
          });
       }

       if(imageUrlList.length===0){
            var html$=$("<div></div>").append($("[name='info_desc']").val());
            html$.find("img").each(function(index,entity){
                var url=$.trim($(entity).attr("src"));
                //只有内网的图片才可以放进去
                if(new RegExp(window.location.origin).test(url)){
                    imageUrlList.push(url);
                }
                
            });
       }

        var croppedImageUrls=imageUrlList.join("#");
           $("[name='info_file']").val(croppedImageUrls);

        window.open("./crop/home.html","批量裁剪图片","width=1200,height=600");
    
    }
</script>
