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
    IF REQUEST("search") <> "" THEN
		'Android
		AndroidS = 0
		SQL = "SELECT DISTINCT UID FROM VISITOR WHERE RE_date>='" & request("e_date1") & "' and RE_date<='" & request("e_date2") & "' AND CLASS='Android' AND UID <>'869231027608042,861141038975033' AND UID<>'27D84667-98FA-4601-8030-1C6FD03F18C4' AND UID<>'864821033192646,864821033206131' AND UID<>'44A43011-5EAD-43DE-8CF7-556DF2F06E25' AND UID<>'862630033256349,862630033256356' AND UID<>'863410037486062,863410037486070' AND UID<>'868405022289781,868405021478914' AND UID<>'1BF884D8-D996-4136-BDB5-7FED09E8F755' AND UID<>'355309070681701,355310070681709' AND UID<>'861206039613949,861206039613956'"
			
			RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			AndroidS = RS.RecordCount
			END IF
		RS.Close
		'iOS
		SQL = "SELECT DISTINCT UID FROM VISITOR WHERE RE_date>='" & request("e_date1") & "' and RE_date<='" & request("e_date2") & "' AND CLASS='iOS'  AND UID <>'869231027608042,861141038975033' AND UID<>'27D84667-98FA-4601-8030-1C6FD03F18C4' AND UID<>'864821033192646,864821033206131' AND UID<>'44A43011-5EAD-43DE-8CF7-556DF2F06E25' AND UID<>'862630033256349,862630033256356' AND UID<>'863410037486062,863410037486070' AND UID<>'868405022289781,868405021478914' AND UID<>'1BF884D8-D996-4136-BDB5-7FED09E8F755' AND UID<>'355309070681701,355310070681709' AND UID<>'861206039613949,861206039613956'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount>0 THEN
			iOSS = RS.RecordCount
			END IF
		RS.Close
		'www
		SQL = "SELECT DISTINCT IP FROM VISITOR WHERE RE_date>='" & request("e_date1") & "' and RE_date<='" & request("e_date2") & "' AND CLASS='www'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount>0 THEN
			WWWS = RS.RecordCount
			END IF
		RS.Close
		'www
		SQL = "SELECT DISTINCT IP FROM VISITOR WHERE RE_date>='" & request("e_date1") & "' and RE_date<='" & request("e_date2") & "' AND CLASS='wap'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount>0 THEN
			WAPS = RS.RecordCount
			END IF
		RS.Close
		
END IF

%>

<html>
<head>
<title>点击查询（分客户端使用不重复）</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<p align="center" class="main"><font color="#CC0000">分客户端使用不重复统计（<%=request("e_date1") %>）至（<%=request("e_date2") %>）--真正使用过的人</font>
<hr width="400" size="1">
<br>
<table width="400" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#999999" bordercolorlight="#FFFFFF" class="main">
  <tr> 
    <td width="151"><font color="#0000CC">客户端</font></td>
    <td width="123"><font color="#0000CC">数量</font></td>
    
  </tr>
 
  <tr> 
    <td width="151">&nbsp;Android</td>
    <td width="123">&nbsp;<%=AndroidS %></td>
   
  </tr>
 
	 <tr> 
    <td width="151">&nbsp;iOS</td>
    <td width="123">&nbsp;<%=iOSS %></td>
   
  </tr>
   <tr> 
    <td width="151">&nbsp;www</td>
    <td width="123">&nbsp;<%=wwwS %></td>
   
  </tr>
   <tr> 
    <td width="151">&nbsp;wap</td>
    <td width="123">&nbsp;<%=wapS %></td>
   
  </tr>
</table>

 <p><hr /></p><div align="center"><a href="default.asp">返回主页</a></div>