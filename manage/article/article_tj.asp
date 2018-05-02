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
	
	SQL = "SELECT TOP 1 INFO_TITLE,IF_TJ FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "' and user_name = '" & lcase(Request.Cookies("user_name")) & "' "
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
<form method="POST" action="article_tj_up.asp" name="un"  >
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
      <td width="74">目前推荐状态：</td>
      <td colspan="3"><%=rs("IF_TJ")
      %></td>
    </tr>
    
    
    <tr> 
      <td width="74">结果：</td>
        <td colspan="3">
        <select name="if_tj">
          <option value="是" selected>是</option>
            <option value="否" >否</option>
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
else
Response.Write("不是自己的文章")
Response.end 
END IF
%>