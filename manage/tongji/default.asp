<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->
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

	DIM LK(10)
	LK(1) = "tom"
	LK(2) = "iris"
	LK(3) = "leon"
	LK(4) = "Jessie"
	LK(5) = "lele"
	LK(6) = "ann"
	
If Request("rd")<>"" Then
	If request("ls") = "t" then
	mrd = " re_date >= '" & Request("rd") & "'"
	Else
	mrd = " re_date = '" & request("rd") & " :00:00:00'  and re_date <'"  & request("rd") & " :23:00:00' "
	End if
Else
	If request("ls") = "t" then
	mrd = " re_date >= '" & date & "'"
	Else
	mrd = " re_date >= '" & date & "'"
	End if
End if
	%> 

<html>
<head>
<title>内部文章与资料-类别查询系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

<p align="center" class="main">内部资料数据系统内容（统计） 

 <table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
 <tr> 
    <td colspan="2"><font color=red>总计</font></td>
  </tr>
  <%
  SQL = "SELECT COUNT(*) AS TOTAL FROM A_ARTICLE"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			TOTAL = RS("TOTAL")
			ELSE
			TOTAL = 0
			END IF
		RS.CLOSE 
  %>
  <tr> 
    <td width="223">新闻</td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
   <%
  SQL = "SELECT COUNT(*) AS TOTAL FROM HOSPTIAL"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			TOTAL = RS("TOTAL")
			ELSE
			TOTAL = 0
			END IF
		RS.CLOSE 
  %>
  <tr> 
    <td width="223">医院</td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
   <%
  SQL = "SELECT COUNT(*) AS TOTAL FROM D_CLASS"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			TOTAL = RS("TOTAL")
			ELSE
			TOTAL = 0
			END IF
		RS.CLOSE 
  %>
  <tr> 
    <td width="223">科室</td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  
   <%
  SQL = "SELECT COUNT(*) AS TOTAL FROM D_DOCTOR"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			TOTAL = RS("TOTAL")
			ELSE
			TOTAL = 0
			END IF
		RS.CLOSE 
  %>
  <tr> 
    <td width="223">医生</td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
   <%
  SQL = "SELECT COUNT(*) AS TOTAL FROM JIBING"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			TOTAL = RS("TOTAL")
			ELSE
			TOTAL = 0
			END IF
		RS.CLOSE 
  %>
  <tr> 
    <td width="223">疾病</td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
   <tr> 
    <td colspan="2"><font color=red>当日统计</font></td>
  </tr>
  <tr> 
    <td colspan="2"><font color=red>新闻资讯</font></td>
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT COUNT(*) AS TOTAL FROM A_ARTICLE WHERE USER_NAME = '" & LK(I) & "' AND " & mrd & ""
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS("TOTAL")
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="article_search_tongji.asp?us=<%=lk(i)%>" target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
  <tr> 
    <td colspan="2"><font color=red>大医生(新增)</font></td>
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT COUNT(*) AS TOTAL FROM D_DOCTOR_DESC WHERE USER_NAME = '" & LK(I) & "' AND " & mrd & " AND CAOZUO ='增加'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS("TOTAL")
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="doctor_add_tongji.asp?us=<%=lk(i)%>" target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
  <tr> 
    <td colspan="2"><font color=red>大医生(修改)</font></td>
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT distinct no FROM D_DOCTOR_DESC WHERE USER_NAME = '" & LK(I) & "' AND  " & mrd & " AND CAOZUO ='修改'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS.RecordCount
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="doctor_modi_tongji.asp?us=<%=lk(i)%>"  target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
  <tr> 
   <td colspan="2"><font color=red>医院</font></td>
   
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT COUNT(*) AS TOTAL FROM HOSPTIAL WHERE USER_NAME = '" & LK(I) & "' AND  " & mrd & ""
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS("TOTAL")
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="hosptial_search_tongji.asp?us=<%=lk(i)%>"  target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
  <tr> 
   <td colspan="2"><font color=red>科室</font></td>
   
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT COUNT(*) AS TOTAL FROM D_CLASS WHERE USER_NAME = '" & LK(I) & "' AND  " & mrd & ""
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS("TOTAL")
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="d_class_search_tongji.asp?us=<%=lk(i)%>" target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
  <tr> 
   <td colspan="2"><font color=red>疾病</font></td>
  
  </tr>
  <%
	FOR I = 1 TO 6 
		SQL = "SELECT COUNT(*) AS TOTAL FROM JIBING WHERE USER_NAME = '" & LK(I) & "' AND  " & mrd & ""
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount >0 THEN
				TOTAL = RS("TOTAL")
				ELSE
				TOTAL = 0
				END IF
			RS.CLOSE 
  %>
  <tr> 
    <td width="223"><a href="jibing_search_tongji.asp?us=<%=lk(i)%>" target="_blank"><%=LK(I)%>&nbsp;</a></td>
    <td width="271"><%=TOTAL%>&nbsp;</td>
  </tr>
  <%
  NEXT
  %>
</table>
</form>
</body>
</html>

