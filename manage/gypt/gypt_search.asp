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
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("gypt_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
	
	CAOZUO = TRIM(REQUEST("CAOZUO"))
	POP = INSTR(CAOZUO,",")
		I = 0
		WHILE POP >0
			LK(I) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			I = I + 1
		WEND
		LK(I)=TRIM(MID(CAOZUO,1))
	FOR J = 0 TO I
		
	  SQL = "SELECT * FROM D_gypt WHERE id = " & LK(J) & " "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM D_gypt WHERE id = " & LK(J) & ""
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'查询
	IF REQUEST("CLASS") <> "" THEN
		MYA = " AND CLASS LIKE '%" & REQUEST("CLASS") & "%' "
		ELSE
		MYA = "  "
	
	END IF

	IF REQUEST("NAME") <> "" THEN
	MYB = " AND NAME like  '%" & REQUEST("NAME") & "%' "
	END IF

	SQL = "SELECT  * FROM D_GyPT WHERE NAME <> ''  " & MYA & MYB  & " ORDER BY NUM DESC"
	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 200
			IF AA = 0 THEN
			PAGE = INT(RECO/200)
			ELSE
			PAGE = INT(RECO/200)+1
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
<title>全国购药平台信息资料查询系统</title>
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
<form method="post" action="gypt_search.asp" name="un">
   <input type=hidden name="class" value="<%=REQUEST("class")%>">
  <input type=hidden name="name" value="<%=REQUEST("name")%>">

  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">删除</font></div>
      </td>
      <td width="5%"><font color="#0000FF">修改</font></td>
      
 
      <td width="11%"> 
        <div align="center"><font color="#0000FF">名称</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">类别</font></div>
      </td>
    
   <td width="11%"> 
        <div align="center"><font color="#0000FF">URL</font></div>
      </td>
		 <td width="11%"> 
        <div align="center"><font color="#0000FF">IMG</font></div>
      </td>
	   <td width="11%"> 
        <div align="center"><font color="#0000FF">显示顺序</font></div>
      </td>
		
    </tr>
    <%
		'判断显示的总页数
			RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 200
			IF AA = 0 THEN
			PAGE = INT(RECO/200)
			ELSE
			PAGE = INT(RECO/200)+1
			END IF
			RS.MoveFirst 
				'定位页数
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 200	'每页一10条
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("id")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="gypt_modi.asp?id=<%=RS("id")%>" target="_blank">Go!</a> 
        &nbsp; </td>
        
       <td width="21%" height="34"> 
        <div align="center"><%=RS("name")%></div>
      </td>
		<td width="21%" height="34"> 
        <div align="center"><%=RS("class")%></div>
      </td>
     <td width="21%" height="34"> 
        <div align="center"><%=RS("url")%></div>
      </td>
		 <td width="11%" height="34"> 
        <div align="center"><img src="http://img.dakayi.cc/pic/<%=RS("img")%>" width="50px;"></div>
      </td>
	   <td width="21%" height="34"> 
        <div align="center"><%=RS("num")%></div>
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
                %><a href="gypt_search.asp?class=<%=request("class")%>&name=<%=request("name")%>&PageNo=<%=PageNo-1%>&search=all">上一页 
          </a> <%
                ELSE
                %> 上一页 <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="gypt_search.asp?class=<%=request("class")%>&name=<%=request("name")%>&PageNo=<%=PageNo+1%>&search=all"> 
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
