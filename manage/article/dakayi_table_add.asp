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
    
   
    if( document.un.info_title.value.length <1) {
      alert("标题必须填写");
      document.un.info_title.focus();
      return false;
   }


	 if( document.un.info_find.value.length <1) {
      alert("查找标签必须填写");
      document.un.info_find.focus();
      return false;
   }
	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）标签增加 </font></div>
<hr>
<form method="POST" action="dakayi_table_save.asp" name="un">
  <table width="1053" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料标题：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="text" name="info_title" size="100">
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">简介：</td>
      <td width="79%" class="main"> 
        <textarea name="info_desc" rows="20" cols="80"></textarea>
      </td>
    </tr>
   
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="100">
      
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
