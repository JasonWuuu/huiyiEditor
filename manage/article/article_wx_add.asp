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
  if( document.un.sub_title.value.length <1) {
      alert("副标题必须填写");
      document.un.sub_title.focus();
      return false;
   }

	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统增加 </font></div>
<hr>
<form method="POST" action="article_wx_save.asp" name="un">
  <table width="953" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">类别：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
           <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("CLASS_NO")%>" >
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
       
         <textarea name="info_title" rows="10" cols="60"></textarea>标题用#号分开
           <input type="radio" name="colorxz" checked value="">
            正常
             <input type="radio" name="colorxz" value="标红">
            标红</td>
    </tr>
	  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">微信文章的URL：</td>
      <td width="79%" class="main"> 
       <input type="text" name="wx_url" size="80">
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">视频URL：</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url" size="30">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否是HTML方式：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="是" checked>
        是 
        <input type="radio" name="if_html" value="否" >
        否 </td>
    </tr>
   
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_source" size="30">
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">手机图片：</td>
      <td width="79%" class="main"> 
		<textarea name="info_file" rows="10" cols="60"></textarea>用#号分开，对应标题
		 <font color=red>制作小的图片200X200的，可以为空</font>
       </td>
    </tr>
    
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">相关栏目：</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_CLASS WHERE JIBIE=1 ORDER BY NUM DESC"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>" ><%=RS1("Class_NAME")%>
				<%
				'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM DESC"
						RS2.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS2.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS2("class_no")%>" ><%=RS2("Class_NAME")%>
						<%
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
				<input type="checkbox" name="zhuanti" value="<%=RS1("zt_name")%>"  ><%=RS1("zt_NAME")%>
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
