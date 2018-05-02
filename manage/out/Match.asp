<html>
<head>
<title>医生匹配</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">

</style>
</head>

<body bgcolor="#FFFFFF">

<script language="javascript">
//判断有没有输入内容
function checkIn()
{
        
    if( document.un.neirong.value.length <1) {
      alert("必须输入一段文字内容！");
      document.un.neirong.focus();
      return false;
   }
   
   if(confirm("确认提交并匹配医生?"))
      return true
   else
      return false;
}

</script>
<%
IF REQUEST("update") <> "" THEN
	Response.Redirect ("Match_Update.asp")
END IF
IF REQUEST("query") <> "" THEN
	Response.Redirect ("Match_Query.asp")
END IF
%>
<div align="center"><font color="#0000FF" class="main">医生匹配</font></div>
<hr>
<form method="POST" action="Match_Save.asp" name="un">
   <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">需要识别的文章内容：</td>
      <td width="79%" class="main"> 
           <textarea name="neirong" rows="30" cols="120"></textarea>
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
