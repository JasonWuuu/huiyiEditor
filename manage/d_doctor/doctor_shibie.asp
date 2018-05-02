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
	set RSLIB = Server.CreateObject("ADODB.RecordSet")

	%> 
<html>
<head>
<title>医生识别系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）医生抓取信息识别 </font></div>
<hr>
<form method="POST" action="doctor_shibie_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">姓名：</td>
      <td width="79%" class="main"> 
        <input type="text" name="xm" size="50">
       
          </td>
    </tr>
	  
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">识别的内容原文：</td>
      <td width="79%" class="main"> 
           <textarea name="yuanwen" rows="30" cols="80"></textarea>
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
