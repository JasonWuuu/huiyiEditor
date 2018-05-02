<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
 
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
	
	
	SQL = "SELECT TOP 1 * FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	
	
	%> 
<html>
<head>
<title>文章修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<script language="javascript">

var lsdz = "";
function checkIn()
{
     if( document.un.class_no.options[document.un.class_no.selectedIndex].value <1) {
      alert("类别必须选择");
      document.un.b_id.focus();
      return false;
   }
    
   
   
    if( document.un.info_title.value.length <1) {
      alert("标题必须填写");
      document.un.info_title.focus();
      return false;
   }


	
	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统修改 </font></div>
<hr>
<form method="POST" action="article_save_up.asp" name="un">
<input type="hidden" name="info_no" value="<%=Request("info_no")%>">
  <table width="953" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">类别：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
           <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF RS1("CLASS_NO") = RS("CLASS_NO") THEN
        %>
        <option value="<%=RS1("CLASS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("CLASS_NO")%>" >
				<%
				END IF
				%>
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
        <input type="text" name="info_title" size="50" value="<%=RS("INFO_TITLE")%>">
      
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">副标题：</td>
      <td width="79%" class="main">
        <input type="text" name="sub_title" size="50" value="<%=RS("SUB_TITLE")%>">
      
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">简介：</td>
      <td width="79%" class="main"> 
		<%
		INFO_DESC=RS("INFO_DESC")
		INFO_DESC = REPLACE(INFO_DESC,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>",chr(13))
		INFO_DESC = REPLACE(INFO_DESC,"</span></p>",chr(13))
				
		%>
        <textarea name="info_desc" rows="10" cols="60"><%=INFO_DESC%></textarea>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">视频URL：</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url" size="30" value="<%=rs("sp_url")%>">
     
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">视频外URL：</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url_out" size="30" value="<%=rs("sp_url_out")%>">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_source" size="30" value="<%=rs("info_source")%>">
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">手机图片：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="info_file" size="16" value="<%=rs("info_file")%>"><font color=red>制作小的图片100X100的，可以为空</font>
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
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS1("CLASS_NO"))%>><%=RS1("Class_NAME")%>
				<%
				'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM "
						RS2.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS2.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS2("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS2("CLASS_NO"))%>><%=RS2("Class_NAME")%>
						<%
						'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS2("CLASS_NO") & "' AND CLASS_NO <>'" & RS2("CLASS_NO") & "' ORDER BY NUM "
						RS3.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS3.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS3("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS3("CLASS_NO"))%>><%=RS3("Class_NAME")%>
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
      <td width="21%" class="main">相关栏目：</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="zt_name" value="<%=RS1("zt_name")%>"  <%=IF_OPA(RS("ZHUANTI"),RS1("zt_name"))%>><%=RS1("zt_NAME")%>
				<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
		 </tr>
		   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否HTML：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="是" <%=check_op("是",rs("if_html"))%>>
        是 
        <input type="radio" name="if_html" value="否" <%=check_op("否",rs("if_html"))%>>
        否 </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否备忘：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_bw" value="是" <%=check_op("是",rs("if_bw"))%>>
        是 
        <input type="radio" name="if_bw" value="否" <%=check_op("否",rs("if_bw"))%>>
        否 </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否推荐：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_tj" value="是" <%=check_op("是",rs("if_tj"))%>>
        是 
        <input type="radio" name="if_tj" value="否" <%=check_op("否",rs("if_tj"))%>>
        否 </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">上载日期：</td>
      <td width="79%" class="main"> 
        <input type="text" name="re_date" size="30" value="<%=rs("re_date")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="提交申请" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="重填信息">
          <input type="button" name="home" value="返    回" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
