<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/sql.asp" -->

 <%

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")

	
	%> 
<html>
<head>
<title>comment</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">comment</font></div>
<hr>
<form method="post" action="note_add_up.asp" name="un" >

  <table width="453" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">%</td>
      <td width="79%" class="main"> 
      <input type="text" name="CC" value="">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">text</td>
      <td width="79%" class="main"> 
         <textarea name="wenben" rows="10" cols="90"></textarea>
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="save" value="submit" >
          <input type="reset" name="Submit2" value="reset">
         </div>
      </td>
  </table>
</form>
</body>
</html>
