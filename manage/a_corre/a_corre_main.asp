<!-- #include virtual = "/include/wsql.asp" -->
 <!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->

 <%
 
'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ����
'���������ű��κ��˲���

	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("a_corre_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>�ַ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������������ݲ�ѯ </font></div>
<hr size="1">
<form method="POST" action="a_corre_search.asp" name="un">
  <table width="640" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main">��ѯ˵����</td>
      <td colspan="3" class="main">�����ѡ��������ϵͳĬ��ȫ������</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">�ֶ����ƣ�</div>
      </td>
      <td width="35%" class="main"> 
        <select name="zd" >
		  <option value="" >ȫ��</option>
             <%
        SQL = "SELECT * from GUOLV_ZD"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
		   %>
		 	   <option value="<%=RS1("ZD")%>" ><%=RS1("ZDMC")%></option>
        <%
		    RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
     
      <td width="14%" class="main"> 
        <div align="right">���ַ���</div>
      </td>
      <td width="34%" class="main"><small> 
        <input type="text" name="hzf" size="20">
        <span class="main"> </span></small></td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="submit" name="search" value="���в�ѯ" >
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="submit" name="home" value="������ҳ">
        </div>
      </td>
  </table>
</form>
</body>
</html>
