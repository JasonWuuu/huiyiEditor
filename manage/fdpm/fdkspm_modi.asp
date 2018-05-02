<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	SQL = "SELECT TOP 1 * FROM fdkspm WHERE id = '" & REQUEST("id") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount >0 THEN
		S_HS_no = RS("HS_no")
		S_HS_NAME = RS("HS_NAME")
		S_PM = RS("PM")
		S_FD_NAME = RS("FD_NAME")
		END IF
	RS.CLOSE 
	%> 
<html>
<head>
<title>科室排名修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<script language="javascript">

var lsdz = "";
function checkIn()
{


	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="fdkspm_save_up.asp" name="un">
<input type=hidden name="id" value="<%=Request("id")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"> 
        <select name="hs_no" >
     
          <%
        SQL = "SELECT * FROM HOSPTIAL ORDER BY hs_name"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
		  
		  IF RS1("HS_no") = S_HS_no THEN
        %>
		  
        <option value="<%=RS1("hs_no")%>" selected>	  <%=RS1("hs_NAME")%></option>
        <%
		  
		  ELSE
		  %>
		   <option value="<%=RS1("hs_no")%>" >	  <%=RS1("hs_NAME")%></option>
		  <%
		  END IF
		  
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">排名：</td>
      <td width="79%" class="main"> 
        <input type="text" name="pm" size="40" value="<%=s_pm%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">对应复旦科室：</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
         IF RS1("fd_NAME") = S_fd_NAME THEN
        %>
		  
        <option value="<%=RS1("fd_no")%>" selected>	  <%=RS1("fd_NAME")%></option>
        <%
		  
		  ELSE
		  %>
		   <option value="<%=RS1("fd_no")%>" >	  <%=RS1("fd_NAME")%></option>
		  <%
		  END IF
		  
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="提交申请" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="重填信息">
          <input type="button" name="home" value="返    回" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
