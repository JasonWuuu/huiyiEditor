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
	Response.Redirect ("doctor_add.asp")
	END IF
	%> 
<%


	SQL = "SELECT  * FROM D_DOCTOR_DESC WHERE NO ='" & Request("No") & "' ORDER BY ID"
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
<title>医生资料历次查询系统</title>
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

  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
     
      
      <td width="9%"><font color="#0000FF">科室</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">医院</font></div>
      </td>
      <td width="21%"> 
        <div align="center"><font color="#0000FF">姓名</font></div>
      </td>
		<td width="21%"> 
        <div align="center"><font color="#0000FF">方式</font></div>
      </td>
     <td width="21%"> 
        <div align="center"><font color="#0000FF">查看修改记录</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">操作人</font></div>
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
      
         <td width="9%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("D_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "内部"
      END IF
      %> </td>
      <td width="11%" height="34"> 
        <div align="center"><%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")%></div>
      </td>
      <td width="21%" height="34"> 
        <div align="center"><%=RS("xm")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><%=RS("caozuo")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><a href="doctor_lici_detail.asp?id=<%=RS("id")%>" target='blank'>查看修改记录</a></div>
      </td>
      <td width="9%" height="34"> 
        <div align="center"> <%=RS("gx_user")%></font> 
        </div>
      </td>
     
      <td width="11%" height="34"> 
        <div align="center"><%=RS("gx_date")%></div>
      </td>
       </tr>
    <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
			 <tr bgcolor="#FFFFFF"> 
      <td colspan="7"> 
        <div align="center"><br>
           <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
        </div>
      </td>
		</tr>
  </table>
  

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
<p>   <input type="button" name="add" value="关闭窗口" onclick=self.close();> </p>
</body>
<%
END IF

%>
