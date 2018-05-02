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
	Response.Redirect ("hosptial_add.asp")
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
		
	  SQL = "SELECT * FROM HOSPTIAL WHERE HS_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM HOSPTIAL WHERE HS_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'查询
	IF REQUEST("SCJB") <> "" THEN
		MYA = " AND SCJBO LIKE '%" & REQUEST("SCJB") & "%' "
		ELSE
		MYA = "  "
	
	END IF

	IF REQUEST("HS_NAME") <> "" THEN
	MYB = " AND (HS_NAME LIKE '%" & REQUEST("HS_NAME") & "%' OR ALICE_NAME LIKE '%" & REQUEST("HS_NAME") & "%') "
	END IF
	IF REQUEST("info_find") <> "" THEN
	MYC = " AND info_find  '%" & REQUEST("info_find") & "%' "
	END IF
	IF REQUEST("HS_desc") <> "" THEN
	MYD = " AND HS_desc LIKE  '%" & REQUEST("HS_desc") & "%' "
	END IF

	IF REQUEST("TYPE") <> "" THEN
	MYG = " AND TYPE =  '" & REQUEST("TYPE") & "' "
	END IF
	IF REQUEST("BD_PM2") <> "" THEN
	MYH = " AND BD_PM <  " & REQUEST("BD_PM2") & " "
	END IF
	IF REQUEST("QG_PM1") <> "" THEN
	MYI = " AND QG_PM >=  " & REQUEST("QG_PM1") & " "
	END IF
	IF REQUEST("QG_PM2") <> "" THEN
	MYJ = " AND QG_PM <  " & REQUEST("QG_PM2") & " "
	END IF
	IF REQUEST("username") <> "" THEN
	MYK = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END IF
	IF REQUEST("IMG") <> "" THEN
		IF REQUEST("IMG") = "是" THEN
		MYM = " AND IMG <>'' "
		ELSE
		MYM = " AND IMG = '' "
		END IF
	END IF
	SQL = "SELECT  * FROM HOSPTIAL WHERE HS_NO <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & MYK & MYM &  " ORDER BY ID DESC"
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
<title>医院资料查询系统</title>
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
<form method="post" action="hosptial_search.asp" name="un">
   <input type=hidden name="scjb" value="<%=REQUEST("scjb")%>">
  <input type=hidden name="hs_name" value="<%=REQUEST("hs_name")%>">
 <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
  <input type=hidden name="info_corre" value="<%=REQUEST("info_corre")%>">
  <input type=hidden name="url" value="<%=REQUEST("url")%>">
  <input type=hidden name="hs_desc" value="<%=REQUEST("hs_desc")%>">
 <input type=hidden name="BD_PM1" value="<%=REQUEST("BD_PM1")%>">
  <input type=hidden name="BD_PM2" value="<%=REQUEST("BD_PM2")%>">
  <input type=hidden name="QG_PM1" value="<%=REQUEST("QG_PM1")%>">
  <input type=hidden name="QG_PM2" value="<%=REQUEST("QG_PM2")%>">
    <input type=hidden name="username" value="<%=REQUEST("username")%>">
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">删除</font></div>
      </td>
      <td width="5%"><font color="#0000FF">修改</font></td>
      
      <td width="9%"><font color="#0000FF">网站地址</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">医院名称</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">地区</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">所属高校</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">医院等级</font></div>
      </td>
     
      <td width="11%"> 
        <div align="center"><font color="#0000FF">医种</font></div>
      </td>
		<td width="8%"><font color="#0000FF">日期</font></td>
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
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("hs_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="hosptial_modi.asp?hs_no=<%=RS("hs_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
         <td width="9%" height="34"> <%=RS("URL")
      
      %> </td>
       <td width="21%" height="34"> 
        <div align="center"><a href="hosptial_detail.asp?hs_no=<%=RS("hs_no")%>" target='blank'><%=RS("hs_name")%></a></div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("area")%></font> 
        </div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("yy_fs")%></font> 
        </div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("yy_dj")%></font> 
        </div>
      </td>
     
      <td width="9%" height="34"> 
        <div align="center"> <%=RS("TYPE")%></font> 
        </div>
      </td>
      <td width="11%" height="34"> 
        <div align="center"><%=RS("re_date")%></div>
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
                %><a href="hosptial_search.asp?type=<%request("type")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&scjb=<%=request("scjb")%>&hs_name=<%=request("hs_name")%>&hs_desc=<%=request("hs_desc")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&url=<%=request("url")%>&username=<%=Request("username")%>&img=<%=Request("img")%>&PageNo=<%=PageNo-1%>&search=all">上一页 
          </a> <%
                ELSE
                %> 上一页 <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="hosptial_search.asp?type=<%request("type")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&scjb=<%=request("scjb")%>&hs_name=<%=request("hsb_name")%>&hs_desc=<%=request("hs_desc")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&url=<%=request("url")%>&username=<%=Request("username")%>&img=<%=Request("img")%>&PageNo=<%=PageNo+1%>&search=all"> 
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
