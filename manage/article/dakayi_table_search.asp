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
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("dakayi_table_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
response.Write("不允许删除")
response.end 
END IF
'查询

  
				
				
	IF REQUEST("INFO_TITLE") <> "" THEN
	MYA = ""
	CC = Split(REQUEST("INFO_TITLE"), " ")
            For CI = 0 To UBound(CC)
						if CI = 0 THEN
						MYA = MYA & " AND (INFO_TITLE LIKE  '%" & CC(CI) & "%' "
						ELSE
						MYA = MYA & " OR INFO_TITLE LIKE  '%" & CC(CI) & "%' "
						END IF
						NEXT
	MYA = MYA & ") "
	END IF

	IF REQUEST("INFO_FIND") <> "" THEN
	
	MYB = ""
	CC = Split(REQUEST("INFO_FIND"), " ")
            For CI = 0 To UBound(CC)
						if CI = 0 THEN
						MYB = MYB & " AND (INFO_FIND LIKE  '%" & CC(CI) & "%' "
						ELSE
						MYB = MYB & " OR INFO_FIND LIKE  '%" & CC(CI) & "%' "
						END IF
						NEXT
	MYB = MYB & ") "
	
	
	END IF
	
	IF REQUEST("person") <>"" THEN
		MYC = " AND PERSON = '" & REQUEST("PERSON") & "' "
	END IF
	
	SQL = "SELECT  * FROM DAKAYI_TABLE WHERE  INFO_TITLE <>'' " & MYA & MYB & MYC & " ORDER BY ID DESC"

	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'定位页数
				IF REQUEST("PageNo") = "" THEN
				PageNo = Request("PageNo")
				
				if PageNo <> "" Then
					
				else
					PageNo=1
				
				End if
				ELSE
				PageNo = Request("PageNo1")
				END IF
			
				
				
%>

<html>
<head>
<title>标签文章与资料查询系统</title>
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
<script language="javascript">
var lsdz = "";
function checkIn()
{    
   if(confirm("你现在真的要删除您选择的记录吗?"))
      return true
   else
      return false;
}
</script>
<p align="center" class="main">内部资料数据系统内容（每页20条记录） 
<form method="post" action="dakayi_table_search.asp" name="un">
  <input type=hidden name="info_title" value="<%=REQUEST("info_title")%>">
   <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
    <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
     
      <td width="5%"><font color="#0000FF">修改</font></td>
       <td width="21%"> 
        <div align="center"><font color="#0000FF">标题</font></div>
      </td>
      <td width="9%"> 
        <div align="center"><font color="#0000FF">查找字符串</font></div>
      </td>
       <td width="11%"> 
        <div align="center"><font color="#0000FF">输入时间</font></div>
      </td>
       <td width="11%"> 
        <div align="center"><font color="#0000FF">输入人员</font></div>
      </td>
    </tr>
    <%
		'判断显示的总页数
			RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'定位页数
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 20	'每页一10条
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
     
      <td width="5%" height="34"> <a href="dakayi_table_modi.asp?id=<%=RS("id")%>" target="_blank">Go!</a> 
        &nbsp; </td>
        <td width="21%" height="34"> 
        <div align="center"><a href="dakayi_table_detail.asp?id=<%=RS("id")%>" target="_blank"><%=RS("info_title")%></a></div>
      </td>
          <td width="7%" height="34"><%=RS("info_find")%>&nbsp;</td>
      <td width="11%" height="34"> 
        <div align="center"><%=RS("re_date")%></div>
      </td>
		  <td width="11%" height="34"> 
        <div align="center"><%=RS("person")%></div>
      </td>
       </tr>
    <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
  </table>
  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">总计：</font></div>
      </td>
      <td width="11%"><font color="#000000"><font color=red><%=PAGE%></font>页</font></td>
      <td width="11%"> 
        <div align="center">当前<font color=red><%=PageNo%></font>页</div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="主页">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Del" value="删除" onClick="return checkIn();">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="返回" onClick=history.back()>
          </font></div>
      </td>
      <td width="20%"> 
        <div align="center"><font color="#000000">显示 
          <input type="text" name="PageNo" size="4" maxlength="6">
          页 
          <input type="submit" name="Search" value="Go">
          </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) >1 THEN
                %><a href="dakayi_table_search.asp?info_title=<%=request("info_title")%>&info_find=<%=request("info_find")%>&PageNo=<%=PageNo-1%>&person=<%=Request("person")%>&search=all">上一页 
          </a> <%
                ELSE
                %> 上一页 <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %> <a href="dakayi_table_search.asp?info_title=<%=request("info_title")%>&info_find=<%=request("info_find")%>&PageNo=<%=PageNo+1%>&person=<%=Request("person")%>&search=all"> 
          下一页</a> <%
                ELSE
                %> 下一页 <%
                END IF
                %> </font></div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
ELSE
%>
<html>
<head>
<title>没有查询到记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<p>没有查询到记录</p>
<p><input type=button name=back value="返回" onclick=history.back();></p>
</body>
<%
END IF

%>
