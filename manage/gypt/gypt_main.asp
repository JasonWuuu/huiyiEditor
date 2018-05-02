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
	Response.Redirect ("ghpt_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>全国挂号平台信息查询</title>
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

<div align="center"><font color="#0000FF" class="main">全国购药平台信息内容查询 </font></div>
<hr size="1">
<form method="POST" action="gypt_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main">查询说明：</td>
      <td colspan="3" class="main">如果不选择条件，系统默认全部符合</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">类别：</div>
      </td>
      <td width="35%" class="main"> 
       <input type="text" name="class" size="30">
      </td>
    
      <td width="14%" class="main"> 
        <div align="right">名称：</div>
      </td>
      <td width="34%" class="main">
        <input type="text" name="name" size="30">
       </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
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
