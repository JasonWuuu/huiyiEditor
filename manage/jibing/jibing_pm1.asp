<!-- #include virtual = "/include/wsql.asp" -->
 <!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->

 <%
 
'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询条件
'操作：本脚本任何人操作

	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("jibing_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>疾病查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）擅长XXX疾病的医生 </font></div>
<hr size="1">
<form method="POST" action="jibing_pm_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main">查询说明：</td>
    <td width="78%" class="main">如果不选择条件，系统默认全部符合</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main"> 
      <div align="right">输入疾病：</div>
    </td>
    <td width="78%" class="main"> 
      <input type="text" name="info_find" size="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main"> 
      <div align="right">想要匹配的字段：</div>
    </td>
    <td width="78%" class="main">
      
        <input type="checkbox" name="cxzd" value="ZLTC" checked>
        诊疗特长 
        <input type="checkbox" name="cxzd" value="XSZW_GJA">
        学术职务 
		 <input type="checkbox" name="cxzd" value="GJLY_RZ">
        国际任职
        <input type="checkbox" name="cxzd" value="RWGS">
        人物概述 
        <input type="checkbox" name="cxzd" value="JCIPS">
        JCI述评 
      
      
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2"> 
      <div align="center"><br>
        <input type="submit" name="search" value="进行查询" >
        <input type="reset" name="Submit2" value="重填信息">
        <input type="submit" name="home" value="返回主页">
      </div>
    </td>
</table>
</form>
</body>
</html>
