<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

<%

'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询结果
'操作：本脚本任何人操作，原则上是自己删除自己的记录

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")

	%> 
<%
DIM LK(100,100)
'查询
	IF REQUEST("e_date1") <> "" and request("e_date2") <> "" THEN
	ELSE
	response.Write "时间段不明朗，拒绝查询"
	response.End 
	END IF
IF REQUEST("SEARCH") <> "" THEN

	SQL = "SELECT CLASS_NO,READ_NUM ,INFO_TITLE FROM A_ARTICLE where RE_date>='" & request("e_date1") & "' and RE_date<='" & request("e_date2") & "'   ORDER BY read_num DESC"

	RS.Open SQL,CONN,1,1	
%>

<html>
<head>
<title>点击查询（分条）</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<p align="center" class="main"><font color="#CC0000">分条点击统计（<%=request("e_date1") %>）至（<%=request("e_date2") %>）</font>
<hr width="800" size="1">
<br>
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#999999" bordercolorlight="#FFFFFF" class="main">
  <tr> 
  <td width="123"><font color="#0000CC">栏目</font></td>
    <td width="651"><font color="#0000CC">标题名称</font></td>
    <td width="123"><font color="#0000CC">点击</font></td>
    
  </tr>
  <%
  total = 0
  do while not rs.EOF 
   %>
  <tr> 
  <td width="123">&nbsp;<%=display_name("A_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")%></td>
    <td width="151">&nbsp;<%=RS("INFO_TITLE") %></td>
    <td width="123">&nbsp;<%=RS("READ_NUM") %></td>
   
  </tr>
  <%
 
    RS.MoveNext 
    LOOP
    RS.Close   
   %>
	
</table>

<%

end if


 %>


   <p><hr /></p><div align="center"><a href="default.asp">返回主页</a></div>