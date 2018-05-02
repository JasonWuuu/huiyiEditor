<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/wsql.asp" -->


<%

'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询结果
'操作：本脚本任何人操作，原则上是自己删除自己的记录

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("/manage/admin_default.asp")
	END IF


	
If Request("rd")<>"" Then
	myd = Request("rd")
	else
	myd = "2017-01-01"
End if
	%> 

<html>
<head>
<title>云栖慧医工作量统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>

<p align="center" class="main"><b><font color="#FF0000">云栖慧医工作统计</font></b> <%
	DIM LK(10)
	LK(1) = "tom"
	LK(2) = "iris"
	LK(3) = "leon"
	LK(4) = "Jessie"
	LK(5) = "lele"
	LK(6) = "ann"
	%> <% FOR J = 1 TO 6%> 
<hr size="1">
<p align="center" class="main"><%=LK(J)%>

<table width="75%" border="1" cellpadding="0" cellspacing="0" class="main">
  <tr bgcolor="#0000FF"> 
    <td width="12%"><font color="#FFFF00">日期</font></td>
    <td width="10%"><font color="#FFFF00">新闻资讯</font></td>
    <td width="15%"><font color="#FFFF00">大医生(新增)</font></td>
    <td width="18%"><font color="#FFFF00">大医生(修改)</font></td>
    <td width="12%"><font color="#FFFF00">医院</font></td>
    <td width="9%"><font color="#FFFF00">科室</font></td>
    <td width="13%"><font color="#FFFF00">疾病</font></td>
    <td width="11%"><font color="#FFFF00">推广</font></td>
  </tr>
  <tr> <%
	  TOTAL1Z=0
	  TOTAL2Z=0
	  TOTAL3Z=0
	  TOTAL4Z=0
	  TOTAL5Z=0
	  TOTAL6Z=0
  dd= DateDiff("d",myd,date())
  
  For I = dd To 1 Step -1
  	SQL = "SELECT COUNT(*) AS TOTAL FROM A_ARTICLE WHERE USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL1 = RS("TOTAL")
				ELSE
				TOTAL1 = 0
				END IF
			RS.CLOSE 
			TOTAL1Z = CDBL(TOTAL1Z) + CDBL(TOTAL1)
				SQL = "SELECT COUNT(*) AS TOTAL FROM D_DOCTOR_DESC WHERE USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00' AND CAOZUO ='增加'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL2 = RS("TOTAL")
				ELSE
				TOTAL2 = 0
				END IF
			RS.CLOSE 
			
			TOTAL2Z = CDBL(TOTAL2Z) + CDBL(TOTAL2)
			
			SQL = "SELECT distinct no FROM D_DOCTOR_DESC WHERE USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00'  AND CAOZUO ='修改'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL3 = RS.RecordCount
				ELSE
				TOTAL3 = 0
				END IF
			RS.CLOSE 
			TOTAL3Z = CDBL(TOTAL3Z) + CDBL(TOTAL3)
			
				SQL = "SELECT COUNT(*) AS TOTAL FROM HOSPTIAL WHERE  USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00' "
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL4 = RS("TOTAL")
				ELSE
				TOTAL4 = 0
				END IF
			RS.CLOSE 
			TOTAL4Z = CDBL(TOTAL4Z) + CDBL(TOTAL4)
			
			SQL = "SELECT COUNT(*) AS TOTAL FROM D_CLASS WHERE USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00' "
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL5 = RS("TOTAL")
				ELSE
				TOTAL5 = 0
				END IF
			RS.CLOSE 
			TOTAL5Z = CDBL(TOTAL5Z) + CDBL(TOTAL5)
			
			SQL = "SELECT COUNT(*) AS TOTAL FROM JIBING WHERE USER_NAME = '" & LK(J) & "' AND RE_DATE>='" & DATE() - I & " 00:00:00' AND RE_DATE<'" & DATE() - I & " 23:00:00' "
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL6 = RS("TOTAL")
				ELSE
				TOTAL6 = 0
				END IF
			RS.CLOSE 
			TOTAL6Z = CDBL(TOTAL6Z) + CDBL(TOTAL6)
  %> 
    <td width="12%"><%=DATE() - I%>&nbsp;</td>
    <td width="10%"><%=TOTAL1%>&nbsp;</td>
    <td width="15%"><%=TOTAL2%>&nbsp;</td>
    <td width="18%"><%=TOTAL3%>&nbsp;</td>
    <td width="12%"><%=TOTAL4%>&nbsp;</td>
    <td width="9%"><%=TOTAL5%>&nbsp;</td>
    <td width="13%"><%=TOTAL6%>&nbsp;</td>
    <td width="11%">0&nbsp;</td>
  </tr>
  <%
  NEXT
  %> 
  <tr bgcolor="#CCCCFF"> 
    <td width="12%"><font color="#FF0000">合计：&nbsp;</font></td>
    <td width="10%"><font color="#FF0000"><%=TOTAL1Z%>&nbsp;</font></td>
    <td width="15%"><font color="#FF0000"><%=TOTAL2Z%>&nbsp;</font></td>
    <td width="18%"><font color="#FF0000"><%=TOTAL3Z%>&nbsp;</font></td>
    <td width="12%"><font color="#FF0000"><%=TOTAL4Z%>&nbsp;</font></td>
    <td width="9%"><font color="#FF0000"><%=TOTAL5Z%>&nbsp;</font></td>
    <td width="13%"><font color="#FF0000"><%=TOTAL6Z%>&nbsp;</font></td>
    <td width="11%"><font color="#FF0000">0&nbsp;</font></td>
  </tr>
</table>
<hr size="1">
<%
  NEXT
  %> <br>
</body>
</html>

