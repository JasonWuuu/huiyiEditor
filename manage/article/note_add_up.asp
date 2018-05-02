<!-- #include virtual = "/include/mylib.asp" -->

<%
MY_TEXT = REQUEST.Form("wenben")
MY_TEXT = REPLACE(MY_TEXT,"。"," ")
MY_TEXT = REPLACE(MY_TEXT,"？"," ")
MY_TEXT = REPLACE(MY_TEXT,"！"," ")
MY_TEXT = REPLACE(MY_TEXT,"；"," ")
MY_TEXT = REPLACE(MY_TEXT,"，"," ")
MY_TEXT = REPLACE(MY_TEXT,","," ")
MY_TEXT = REPLACE(MY_TEXT,"!"," ")
MY_TEXT = REPLACE(MY_TEXT,";"," ")
MY_TEXT = REPLACE(MY_TEXT,"?"," ")
MY_TEXT = REPLACE(MY_TEXT,"."," ")
I = 0
CC = Split(MY_TEXT, " ")
            For CI = 0 To UBound(CC)
						I = I + 1
						NEXT
SL = INT(I * CDBL(REQUEST("CC")))

MY_TEXT = REPLACE(MY_TEXT,"? ","")


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
<form method="POST" action="http://nlpapi.datagrand.com/summary" name="un" accept-charset="utf-8" onsubmit="document.charset='utf-8';">
<input type="hidden" name="appid" value="200101">

  <input type="hidden" name="cnt" value="<%=SL%>">


  <table width="453" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">text</td>
      <td width="79%" class="main"> 
         <textarea name="text" rows="10" cols="90"><%=Request("wenben")%></textarea>
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="submit" >
          <input type="reset" name="Submit2" value="reset">
         </div>
      </td>
  </table>
</form>
</body>
</html>

