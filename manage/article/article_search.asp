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
	Response.Redirect ("article_add.asp")
	END IF
	%> 
<%
SQL = "UPDATE A_ARTICLE SET XGNR='' WHERE XGNR IS NULL"
CONN.EXECUTE(SQL)
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
		
	  SQL = "SELECT * FROM A_ARTICLE WHERE INFO_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM A_ARTICLE WHERE INFO_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
				SQL = "INSERT INTO A_ARTICLE_DETE (INFO_NO) VALUES ('" & LK(J) & "')"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF


IF REQUEST("TJ") <> "" THEN
	
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
		
	  SQL = "SELECT * FROM A_ARTICLE WHERE INFO_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "UPDATE  A_ARTICLE SET IF_TJ='是' WHERE INFO_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
				
			END IF
		RS.Close 
	
	NEXT
END IF



IF REQUEST("FTJ") <> "" THEN
	
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
		
	  SQL = "SELECT * FROM A_ARTICLE WHERE INFO_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "UPDATE  A_ARTICLE SET IF_TJ='否' WHERE INFO_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
				
			END IF
		RS.Close 
	
	NEXT
END IF


'查询
	IF REQUEST("CLASS_NO") <> "" THEN
		MYA = " AND CLASS_NO LIKE '%" & REQUEST("CLASS_NO") & "%' "
		ELSE
		MYA = "  "
	
	END IF

	IF REQUEST("INFO_TITLE") <> "" THEN
	MYB = " AND INFO_TITLE  LIKE '%" & REQUEST("INFO_TITLE") & "%' "
	END IF
	IF REQUEST("status") <> "" THEN
	MYC = " AND status = '" & REQUEST("status") & "' "
	END IF
	IF REQUEST("info_source") <> "" THEN
	MYD = " AND info_source LIKE  '%" & REQUEST("info_source") & "%' "
	END IF
IF REQUEST("info_corre") <> "" THEN
	MYE = " AND info_corre LIKE  '%" & REQUEST("info_corre") & "%' "
	END IF
	IF REQUEST("INFO_DESC") <> "" THEN
	MYF = " AND INFO_DESC LIKE  '%" & REQUEST("INFO_DESC") & "%' "
	END IF
	IF REQUEST("username") <> "" THEN
	MYG = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END IF
	IF REQUEST("IF_BW") <> "" THEN
	MYH = " AND IF_BW = '" & REQUEST("IF_BW") & "' "
	END IF
	IF REQUEST("ZHUANTI") <> "" THEN
	MYI = " AND ZHUANTI = '" & REQUEST("ZHUANTI") & "' "
	END IF
	IF REQUEST("IF_TJ") <> "" THEN
	MYJ = " AND IF_TJ = '" & REQUEST("IF_TJ") & "' "
	END IF
	SQL = "SELECT  * FROM A_ARTICLE WHERE INFO_title <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & " ORDER BY ID DESC"
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
	PageNo = Request("PageNo1")
			if PageNo <>"" Then
			else
				PageNo = Request("PageNo")
			
									if PageNo <> "" Then
										
									else
										PageNo=1
									
									End if
		
			end if	
				
%>

<html>
<head>
<title>内部文章与资料查询系统</title>
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
<script language="javascript">
var lsdz = "";
function checkIna()
{    
   if(confirm("你现在真的要推荐您选择的记录吗?"))
      return true
   else
      return false;
}
</script>
<script language="javascript">
var lsdz = "";
function checkInb()
{    
   if(confirm("你现在真的要取消您选择的记录吗，不推荐?"))
      return true
   else
      return false;
}
</script>
<p align="center" class="main">内部资料数据系统内容（每页20条记录） 
<form method="post" action="article_search.asp" name="un">
   <input type=hidden name="class_no" value="<%=REQUEST("class_no")%>">
  <input type=hidden name="info_title" value="<%=REQUEST("info_title")%>">
 <input type=hidden name="status" value="<%=REQUEST("status")%>">
  <input type=hidden name="info_corre" value="<%=REQUEST("info_corre")%>">
  <input type=hidden name="info_source" value="<%=REQUEST("info_source")%>">
  <input type=hidden name="username" value="<%=REQUEST("username")%>">
  <input type=hidden name="if_bw" value="<%=REQUEST("if_bw")%>">
   <input type=hidden name="zhuanti" value="<%=REQUEST("zhuanti")%>">
	 <input type=hidden name="PageNo1" value="<%=PageNo%>">
  <table width="998" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">删除</font></div>
      </td>
      <td width="5%"><font color="#0000FF">修改</font></td>
      <td width="5%"><font color="#0000FF">审核</font></td>
      <td width="5%"><font color="#0000FF">推荐</font></td>
      <td width="9%"><font color="#0000FF">栏目名称</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">文章编号</font></div>
      </td>
      <td width="21%"> 
        <div align="center"><font color="#0000FF">标题</font></div>
      </td>
      <td width="21%"> 
        <div align="center"><font color="#0000FF">已经转码</font></div>
      </td>
		<td width="21%"> 
        <div align="center"><font color="#0000FF">相关医生</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">文章图片</font></div>
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
			
			RS.PageSize = 20	'每页一10条
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("info_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="article_modi.asp?info_no=<%=RS("info_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
		   <td width="5%" height="34"> <a href="article_confim.asp?info_no=<%=RS("info_no")%>" target="_blank"><%=rs("status")%></a> 
        &nbsp; </td>
          <td width="5%" height="34"> <a href="article_tj.asp?info_no=<%=RS("info_no")%>" target="_blank"><%=rs("if_tj")%></a> 
        &nbsp; </td>
         <td width="9%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("A_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "内部"
      END IF
      %> </td>
		
      <td width="11%" height="34"> 
        <div align="center"><a href="article_detail.asp?info_no=<%=RS("info_no")%>" target='blank'><%=RS("INFO_no")%></a></div>
      </td>
      <td width="21%" height="34"> 
        <div align="center">
		  <%
		  IF RS("SP_URL_OUT") <> "" THEN
		  %>
		  <a href="<%=RS("SP_URL_OUT")%>" target='_blank'><%=RS("info_title")%> 【视频】</a>
		  <%
		  ELSE
		  %>
		  <%=RS("info_title")%>
		  <%
		  END IF
		  %>
		  </div>
      </td>
		<td width="11%" height="34"> 
        <div align="center"><a href="article_detailn.asp?info_no=<%=RS("info_no")%>" target='blank'>转码内容</a></div>
      </td>
		<td width="11%" height="34"> 
        <div align="center">
		  <%
		  '查询相关内容
		  mystr=rs("xgnr")
		  mystr=split(mystr,"-") 
			for i=0 to ubound(mystr) 
			if mid(mystr(i),1,1) = "D" then
			%>
			<a href="/manage/d_doctor/doctor_detail.asp?no=<%=mystr(i)%>" target="_blank"><%=display_name("D_DOCTOR",mystr(i),"NO","XM")%></a>
			<%
			end if
			next
		  %>
		  </div>
      </td>
		
      <td width="9%" height="34"> 
        <div align="center"><a href="http://img.huiyi.net/pic/<%=RS("INFO_FILE")%>" target="_blank"> <%=RS("INFO_FILE")%></a></font> 
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
  <table width="990" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="1" bgcolor="#000000" class="main">
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
          <input type="submit" name="tj" value="推荐" onClick="return checkIna();">
          </font></div>
      </td>
		<td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="ftj" value="取消推荐" onClick="return checkInb();">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="返回" onClick=history.back()>
          </font></div>
      </td>
      <td width="10%"> 
        <div align="center"><font color="#000000">显示 
          <input type="text" name="PageNo" size="4" maxlength="6">
          页 
          <input type="submit" name="Search" value="Go">
          </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) >1 THEN
                %><a href="article_search.asp?class_no=<%=request("class_no")%>&info_title=<%=request("info_title")%>&status=<%=request("status")%>&info_corre=<%=request("info_corre")%>&info_source=<%=request("info_source")%>&info_desc=<%=request("info_desc")%>&username=<%=Request("username")%>&if_bw=<%=Request("if_bw")%>&zhuanti=<%=Request("zhuanti")%>&if_tj=<%Request("if_tj")%>&PageNo=<%=PageNo-1%>&search=all">上一页 
          </a> <%
                ELSE
                %> 上一页 <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="article_search.asp?class_no=<%=request("class_no")%>&info_title=<%=request("info_title")%>&status=<%=request("status")%>&info_corre=<%=request("info_corre")%>&info_source=<%=request("info_source")%>&info_desc=<%=request("info_desc")%>&username=<%=Request("username")%>&if_bw=<%=Request("if_bw")%>&zhuanti=<%=Request("zhuanti")%>&if_tj=<%Request("if_tj")%>&PageNo=<%=PageNo+1%>&search=all"> 
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
