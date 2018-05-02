<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
 Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	SQL = "SELECT TOP 1 * FROM A_CLASS WHERE CLASS_NO = '" & REQUEST("CLASS_NO") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount >0 THEN
		N_CLASS_NAME = RS("CLASS_NAME")
		N_NUM = RS("NUM")
		N_ICON = RS("ICON")
		N_TUIJIAN = RS("TUIJIAN")
		END IF
	RS.CLOSE 
	%> 
<html>
<head>
<title>文章类别修改</title>
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
   
    if( document.un.class_name.value.length <1) {
      alert("标题必须填写");
      document.un.class_name.focus();
      return false;
   }

	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="a_class_save_up.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <input type=hidden name="class_no" value="<%=Request("class_no")%>">
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">名称：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="class_name" value="<%=N_CLASS_NAME%>" size="40">
        </font></small></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">显示顺序：</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="40" value="<%=N_NUM%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">类别图标：</td>
      <td width="79%" class="main"> 
        <input type="text" name="icon" size="40" value="<%=N_ICON%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">订阅项目：</td>
      <td width="79%" class="main"> 
       <input type="radio" name="tuijian" value="1"  <%=check_op(N_TUIJIAN,"1")%>>
        是 
        <input type="radio" name="tuijian" value="0"  <%=check_op(N_TUIJIAN,"0")%>>
        否
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
