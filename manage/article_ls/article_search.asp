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
	Response.Redirect ("/manage/admin_default.ASP")
	END IF
	
	%> 
<%

'删除上日的文章

'SQL = "SELECT INFO_NO FROM A_ARTICLE_LS WHERE RE_DATE<'" & date - 7 & "'"
'RS.Open SQL,CONN,1,1
'	DO WHILE NOT RS.EOF 
'			SQL = "INSERT INTO A_ARTICLE_DETE (INFO_NO) VALUES ('" & RS("INFO_NO") & "')"
'				CONN.Execute(SQL)
'				SQL = "DELETE FROM A_ARTICLE_LS WHERE INFO_NO = '" & RS("INFO_NO")  & "'"
'				CONN.Execute(SQL)
				
'	RS.MoveNext
'	LOOP
'RS.CLOSE 
DIM LK(500)

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
		
	  SQL = "SELECT * FROM A_ARTICLE_LS WHERE INFO_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM A_ARTICLE_LS WHERE INFO_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
				SQL = "INSERT INTO A_ARTICLE_DETE (INFO_NO) VALUES ('" & LK(J) & "')"
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
	SQL = "SELECT  * FROM A_ARTICLE_LS WHERE INFO_title <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & " ORDER BY RE_DATE DESC"
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
function selectAll(checked)
{

    if (checked == true)
    {
		if(typeof document.un.caozuo.length!="undefined")
		{
			for(i = 0 ;i < document.un.caozuo.length;i++ )
			{
			   document.un.caozuo[i].checked = true;
			}
		}
		else
		{
			document.un.caozuo.checked = true;
		}

    }
	else
    {
		if(typeof document.un.caozuo.length!="undefined")
		{
			for(i = 0 ;i < document.un.caozuo.length;i++ )
			{
					document.un.caozuo[i].checked = false;
			}
		}
		else
		{
				document.un.caozuo.checked = false;
		}

    }
}
//-->
</SCRIPT>
<p align="center" class="main">内部资料数据系统内容（每页20条记录） 
<form method="post" action="article_search.asp" name="un">

  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">删除</font></div>操作 
      <input type='checkbox' onclick="javascript:selectAll(this.checked)">
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
     
      <td width="11%"> 
        <div align="center"><font color="#0000FF">文章图片</font></div>
      </td>
    
		<td width="8%"><font color="#0000FF">日期</font></td>
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
		  <a href="article_detailn.asp?info_no=<%=RS("info_no")%>" target='blank'><%=RS("info_title")%></a>
		  <%
		  END IF
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
