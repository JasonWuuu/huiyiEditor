<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 
'作者：马洪岩  于 2002-4-21 编写
'功能：文章的确认
'操作：本脚本由部门经理以上操作

 '判断级别
 	set CONN = Server.CreateObject("ADODB.Connection")
	CONN.open CONNSTR,"",""  
    set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'判断权限
IF lcase(Request.Cookies("user_name")) <> "leon" THEN
		Response.Write "对不起，您目前没有审核的权利，请努力工作，谢谢"
		Response.End 
	END IF
sql = "update a_article set status='" & request("status") & "' where info_no = '" & request("info_no") & "'"
conn.Execute(sql)
	%> 
<html>
<head>
<title>内容与文章审核结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统审核结果</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un" >
  <table width="400" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="0" class="main">
    <tr> 
      <td colspan="2"><font color="#0000FF">审核记录，请确信您已经仔细的阅读了该篇文章</font></td>
    </tr>
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td width="98">目前状态：</td>
      <td width="296">
      <%=request("status")
      %></td>
    </tr>
   
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="2">
        <div align="center">
          <input type="button" name="Button" value="关闭窗口" onclick=self.close();>
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
