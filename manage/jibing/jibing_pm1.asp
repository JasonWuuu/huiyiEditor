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
	Response.Redirect ("jibing_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>������ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����ó�XXX������ҽ�� </font></div>
<hr size="1">
<form method="POST" action="jibing_pm_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main">��ѯ˵����</td>
    <td width="78%" class="main">�����ѡ��������ϵͳĬ��ȫ������</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main"> 
      <div align="right">���뼲����</div>
    </td>
    <td width="78%" class="main"> 
      <input type="text" name="info_find" size="20">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="22%" class="main"> 
      <div align="right">��Ҫƥ����ֶΣ�</div>
    </td>
    <td width="78%" class="main">
      
        <input type="checkbox" name="cxzd" value="ZLTC" checked>
        �����س� 
        <input type="checkbox" name="cxzd" value="XSZW_GJA">
        ѧ��ְ�� 
		 <input type="checkbox" name="cxzd" value="GJLY_RZ">
        ������ְ
        <input type="checkbox" name="cxzd" value="RWGS">
        ������� 
        <input type="checkbox" name="cxzd" value="JCIPS">
        JCI���� 
      
      
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2"> 
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
