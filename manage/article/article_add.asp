<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

<%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
%>
<html>
<head>
    <title>��������</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
        <!--
        .main {
            font-size: 9pt
        }
        -->
    </style>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link href="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"> </script>
    <!--�����ֶ��������ԣ�������ie����ʱ��Ϊ��������ʧ�ܵ��±༭������ʧ��-->
    <!--������ص������ļ��Ḳ������������Ŀ����ӵ��������ͣ���������������Ŀ�����õ���Ӣ�ģ�������ص����ģ�������������-->
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>

    <script src="./ueditor/index_ueditor.js"></script>
    <script src="./ueditor/index_135editor.js"></script>
    <script src="./ueditor/index_135editor_styles.js"></script>
    <script src="./ueditor/index_135editor_htmlParsersList.js"></script>
    <script src="./ueditor/index_135editor_systemTemplates.js"></script>
    <script src="./ueditor/templateCategory.js"></script>
    <script src="./ueditor/index_135editor_draft.js"></script>
    <script src="./js/dom-to-image.js"></script>
    <script src="./js/article_add.js"></script>
    <link href="./article_add.css" rel="stylesheet">

    
</head>

<body bgcolor="#FFFFFF">

    <script language="javascript">
        $.fn.modal.Constructor.prototype.hideModal = function () {
                var that = this
                this.$element.hide()
                this.backdrop(function () {
                    //�жϵ�ǰҳ�����е�ģ̬���Ѿ�������֮��body�Ƴ�.modal-open����body���ֹ�������
                    $('.modal.fade.in').length === 0 && that.$body.removeClass('modal-open')
                    that.resetAdjustments()
                    that.resetScrollbar()
                    that.$element.trigger('hidden.bs.modal')
                })
            }

    $.fn.modal.Constructor.prototype.hideModal = function () {
            var that = this
            this.$element.hide()
            this.backdrop(function () {
                //�жϵ�ǰҳ�����е�ģ̬���Ѿ�������֮��body�Ƴ�.modal-open����body���ֹ�������
                $('.modal.fade.in').length === 0 && that.$body.removeClass('modal-open')
                that.resetAdjustments()
                that.resetScrollbar()
                that.$element.trigger('hidden.bs.modal')
            })
        }

        var lsdz = "";
        function checkIn() {
            if (document.un.class_no.options[document.un.class_no.selectedIndex].value < 1) {
                alert("������ѡ��");
                document.un.b_id.focus();
                return false;
            }



            if (document.un.info_title.value.length < 1) {
                alert("���������д");
                document.un.info_title.focus();
                return false;
            }
            if (document.un.sub_title.value.length < 1) {
                alert("�����������д");
                document.un.sub_title.focus();
                return false;
            }


            if (document.un.info_file.value.length < 1) {
                alert("СͼƬ������д���ϴ�");
                document.un.info_file.focus();
                return false;
            }

            if (confirm("������Ҫ�ύ��?"))
                return true
            else
                return false;
        }
    </script>
    <div align="center">
    <h2>���ڲ�����ϵͳ��������������ϵͳ����</h2>
    <hr>
    <form method="POST" action="article_save.asp" name="un">
        <table style="width:953px;" class="table table-bordered">
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">���</td>
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
                <td width="21%" class="main">���ϱ��⣺</td>
                <td width="79%" class="main">

                    <textarea name="info_title" rows="10" cols="60" class="form-control"></textarea>������#�ŷֿ�
           <input type="radio" name="colorxz" checked value="">
                    ����
             <input type="radio" name="colorxz" value="���">
                    ���</td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">�����⣨100�����ڣ���</td>
                <td width="79%" class="main">
                    <textarea name="sub_title" rows="4" cols="60" class="form-control"></textarea>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">��飺<br/><font color="red">(������ⲿͼƬ������ʾ�ı�)</font></td>
                <td width="79%" class="main">
                    <div style="width:735px;">
                    <textarea name="info_desc" rows="20" cols="60" class="form-control"></textarea>
                    </div>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">��ƵURL��</td>
                <td width="79%" class="main">
                    <input type="text" name="sp_url" size="30" class="form-control">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">��Ƶ��-URL��</td>
                <td width="79%" class="main">
                    <input type="text" name="sp_url_out" size="30" class="form-control">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">�Ƿ���HTML��ʽ��</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_html" value="��" checked>
                    �� 
        <input type="radio" name="if_html" value="��">
                    �� </td>
            </tr>


            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">������Դ��</td>
                <td width="79%" class="main">
                    <input type="text" name="info_source" size="30" class="form-control">
                </td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">�ֻ�ͼƬ��</td>
                <td width="79%" class="main">
                    <ul id="modile_image_sortable">
                    </ul>
                    <textarea id="info_file_id" style="height:15px;opacity:0;" name="info_file" rows="1" cols="60" class="form-control" style="display:block;"></textarea>
                    <br>
                    <button class="btn" type="button" onclick="mutipleCrop()">�����ü�ͼƬ</button>
                    <font color="red" style="display:none;">��#�ŷֿ�����Ӧ���� ����С��ͼƬ200X200�ģ�����Ϊ��</font>
                </td>
            </tr>

            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">�����Ŀ��</td>
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
                <td width="21%" class="main">����ר�⣺</td>
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
                <td width="21%" class="main">�Ƿ�����</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_bw" value="��">
                    �� 
        <input type="radio" name="if_bw" value="��" checked>
                    �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="21%" class="main">�Ƿ��Ƽ���</td>
                <td width="79%" class="main">
                    <input type="radio" name="if_tj" value="��">
                    �� 
        <input type="radio" name="if_tj" value="��" checked>
                    �� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td colspan="2">
                    <div align="center">
                        <br>
                        <input type="submit" name="Submit" value="�ύ����" onclick="return checkIn();" class="btn btn-primary">
                        <input type="reset" name="Submit2" value="������Ϣ" class="btn">
                        <input type="button" name="home" value="��    ��" onclick="history.back();" class="btn">
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
                    <h5 class="modal-title" id="getCroppedCanvasTitle">�༭��</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body my-editor-container">
                    <!-- Content -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6" style="height: 100%;">
                                <div class="row left-container" style="height: 778px;">
                                    <div class="col-md-3" style="padding: 0px;">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active" style="width: 120px;">
                                                <a href="#styles" aria-controls="styles" role="tab" data-toggle="tab">��ʽ</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#htmlParsersList" aria-controls="htmlParsersList" role="tab" data-toggle="tab">һ���Ű�</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#editor-tpls" aria-controls="editor-tpls" role="tab" data-toggle="tab">ģ��</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#templateCategory" aria-controls="editor-draft" role="tab" data-toggle="tab">ģ�����</a>
                                            </li>
                                            <li role="presentation" style="width: 120px;">
                                                <a href="#editor-draft" aria-controls="editor-draft" role="tab" data-toggle="tab">�ݸ���</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-9">
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="styles">
                                                <ul class="nav nav-pills  nav-toolbars">
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-229">��ű���</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-237">���߱���</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-233">��ɫ����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-232">ͼƬ����</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-284">�����</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-1089">����</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-238">��������</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-226">�߿�����</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-228">��ɫ����</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-230">���/����</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-231">��ҳ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-235">����</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">����
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".cate-53">�ָ���</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-261">������ע</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-262">�����Ķ�ԭ��</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-811">��������</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-263">������</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-939">��ά��</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">ͼ��
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-222">ͼƬ��ʽ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-223">����ͼ��</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-224">����ͼ��</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-239">��ͼ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-240">˫ͼ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-241">��ͼ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-242">��������</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-225">����/��ֽ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-234">��Ƶ/��Ƶ</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-236">�Ի�</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">����
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-702">��������</a>
                                                            </li>
                                                            <li role="presentation">
                                                                <a class="filter" data-filter=".tagtpl-292">�����ʽ</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li style="width: 1px">|</li>
                                                    <li role="presentation" class="dropdown">
                                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">������ҵ
                                            <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu" style="right: 0; left: auto; text-align: right;">
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-248">Ԫ����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1119">����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-288">��Ů��</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1122">ֲ����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-1123">315</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-250">������</a>
                                                            </li>

                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-297">����</a>
                                                            </li>

                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-940">�</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-257">����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-234">����</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-857">ҽ��</a>
                                                            </li>
                                                            <li>
                                                                <a class="filter" data-filter=".tagtpl-878">ĸӤ</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <div class="style-result pre-scrollable" style="max-height: 726px;">
                                                    ��ʽ...
                                                </div>

                                            </div>
                                            <div role="tabpanel" class="tab-pane pre-scrollable" id="htmlParsersList" style="max-height: 700px;">
                                                <div style="background-color: #d9edf7; padding: 10px; border-color: #bce8f1; color: #3a87ad;">
                                                    <p style="font-size: 16px; clear: none;">
                                                        <strong style="color: red;">��ʾ��</strong>�� �ڱ༭����ճ�����������������ݣ��� �����Ӧ��һ���Ű����,�� ȫ������ʵ���Զ��Ű�
                                                    </p>
                                                </div>


                                                <div id="html-parsers-items">
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="editor-tpls" style="max-height: 700px;">
                                                <ul id="editor-tpls-navtab" class="nav nav-tabs" style="border: 0 none;">
                                                    <li class="nav-item ignore col-sm-4 active" id="personal-tpl-list-li">
                                                        <a class="nav-link" href="#personalTemplates" data-refresh="always" data-url="/user_styles/myStyles" role="tab" data-toggle="tab"
                                                            aria-selected="true">����ģ��</a>
                                                    </li>
                                                    <li class="nav-item ignore col-sm-4" id="favorite-tpl-list-li">
                                                        <a class="nav-link" href="#otherColleagueTemplates" data-refresh="always" data-url="/editor_styles/favorTemplates" role="tab"
                                                            data-toggle="tab" aria-selected="false">����ģ��</a>
                                                    </li>
                                                    <li class="nav-item ignore  col-sm-4">
                                                        <a class="nav-link" href="#systemTemplates" data-url="/editor_styles/systemTemplates" role="tab" data-toggle="tab" aria-selected="false">ϵͳģ��</a>
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
                                            <div role="tabpanel" class="tab-pane pre-scrollable" id="templateCategory" style="max-height: 700px;">
                                                <ul id="editor-tpls-navtab" class="nav nav-tabs" style="border: 0 none;">
                                                    <li class="nav-item ignore col-sm-4 active" id="personal-tpl-list-li">
                                                        <a class="nav-link" href="#templateCategoryList" data-refresh="always" data-url="" role="tab" data-toggle="tab"
                                                            aria-selected="true">����ģ�����</a>
                                                    </li>
                                                    
                                                </ul>
                                                    <div id="templateCategoryList" class="tab-pane active " style="max-height: 700px;">

                                                    </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane pre-scrollable" id="editor-draft" style="max-height: 700px;">
                                                <ul id="editor-tpls-navtab" class="nav nav-tabs" style="border: 0 none;">
                                                    <li class="nav-item ignore col-sm-4 active" id="personal-tpl-list-li">
                                                        <a class="nav-link" href="#personalDraft" data-refresh="always" data-url="" role="tab" data-toggle="tab"
                                                            aria-selected="true">���˲ݸ�</a>
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
                                        
                                                <button  id="save-as-draft" tabindex="2" class="btn btn-default btn-xs" data-container="body" data-placement="left"
                                                    title="" data-original-title="��������">
                                                    ���浽�ݸ�</button>
                                 
                                          
                                                <button  data-target="#saveTemplateCategoryforArticle"  data-toggle="modal" id="save-as-template" tabindex="2" class="btn btn-default btn-xs" data-container="body" data-placement="left"
                                                    title="" data-original-title="��������">
                                                    ���浽ģ��</button>
                                            
                                    </div>
                                    <!-- <div id="btns">
                        <div>
                            <button onclick="getAllHtml()">�������html������</button>
                            <button onclick="getContent()">�������</button>
                            <button onclick="setContent()">д������</button>
                            <button onclick="setContent(true)">׷������</button>
                            <button onclick="getContentTxt()">��ô��ı�</button>
                            <button onclick="getPlainTxt()">��ô���ʽ�Ĵ��ı�</button>
                            <button onclick="hasContent()">�ж��Ƿ�������</button>
                            <button onclick="setFocus()">ʹ�༭����ý���</button>
                            <button onmousedown="isFocus(event)">�༭���Ƿ��ý���</button>
                            <button onmousedown="setblur(event)">�༭��ʧȥ����</button>

                        </div>
                        <div>
                            <button onclick="getText()">��õ�ǰѡ�е��ı�</button>
                            <button onclick="insertHtml()">�������������</button>
                            <button id="enable" onclick="setEnabled()">���Ա༭</button>
                            <button onclick="setDisabled()">���ɱ༭</button>
                            <button onclick=" UE.getEditor('editor').setHide()">���ر༭��</button>
                            <button onclick=" UE.getEditor('editor').setShow()">��ʾ�༭��</button>
                            <button onclick=" UE.getEditor('editor').setHeight(300)">���ø߶�Ϊ300Ĭ�Ϲر����Զ�����</button>
                        </div>

                        <div>
                            <button onclick="getLocalData()">��ȡ�ݸ�������</button>
                            <button onclick="clearLocalData()">��ղݸ���</button>
                        </div>

                    </div>
                    <div>
                        <button onclick="createEditor()">
                            �����༭��</button>
                        <button onclick="deleteEditor()">
                            ɾ���༭��</button>
                    </div> -->

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">ȡ��</button>
                    <a class="btn btn-primary" id="download" href="javascript:void(0);" onclick="completeEdit()">ȷ��</a>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->

<!--����ģ������ -->
<div class="modal fade" id="saveTemplateCategoryforArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">����Ϊģ��</h4>
            </div>
            <div id="templateCategoryforSave" class="pre-scrollable" style="max-height: 300px;">
            </div>
            
            
            <div class="modal-footer">
                <select class="span3" id="categorySelect">
                    <option>1</option>
                    
                </select>
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveTemplateCategoryforArticleBtn">�ύ����</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--���ģ����� -->
<div class="modal fade" id="addTemplateCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">����µ�ģ�����</h4>
            </div>
            
            <input type="text" class="form-control" placeholder="ģ���������" id="newTemplateCategory">
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">�ر�</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="addTemplateCategoryBtn">�ύ����</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>

<script>
    $(function(){
        $("[name='info_desc']").on("click",function(){
            $("#myNewStyleEditor").modal({
                backdrop: false,
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
            alert("�༭���б����������");
            $("#myNewStyleEditor").modal("hide");
        }
    }
</script>
