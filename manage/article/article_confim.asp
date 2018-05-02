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
	SQL = "SELECT TOP 1 INFO_TITLE,STATUS,user_name FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount>0 THEN
		
	%> 

<html>
<head>
<title>内容与文章系统审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"> 
  <p><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统审核</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un"  >
  <input type=hidden name=info_no value="<%=request("info_no")%>">
 
  <table width="506" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="5" class="main">
    <tr> 
      <td colspan="4"><font color="#0000FF">审核记录，请确信您已经仔细的阅读了该篇文章</font></td>
    </tr>
    <tr> 
      <td width="74">文章标题：</td>
      <td colspan="3"><%=rs("info_title")%></td>
    </tr>
    <tr> 
      <td width="74">操作人员：</td>
      <td colspan="3"><%=rs("USER_NAME")%></td>
    </tr>
    <tr> 
      <td width="74">目前状态：</td>
      <td colspan="3"><%=rs("status")
      %></td>
    </tr>
    
    
    <tr> 
      <td width="74">结果：</td>
        <td colspan="3">
        <select name="status">
          <option value="已" selected>通过</option>
          <option value="未">修改</option>
         
        </select>
      </td>
     </tr>
    <td colspan="4"> 
      <div align="center"> 
        <input type="submit" name="send" value="进行确定" onClick="return checkIn();">
        <input type="button" name="Button" value="关闭窗口" onClick=self.close();>
      </div>
    </td>
    </tr>
  </table>
</form>
</body>
</html>
<%
END IF
%>