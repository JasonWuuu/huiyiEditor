<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")

	%> 
<html>
<head>
<title>ҽ��ʶ��ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����ҽ��ץȡ��Ϣʶ�� </font></div>
<hr>
<form method="POST" action="doctor_shibie_add_e.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
       <select name="no" >
		 <%
		 sql = "select no,xm from d_doctor order by xm"
		 rs.Open sql,conn,1,1
			do while not rs.eof 
		 %>
        <option value="<%=rs("no")%>" ><%=rs("xm")%></option>
		 <%
		 rs.MoveNext
		 loop
		 rs.close 
		 %> 
		  </select>
       
          </td>
    </tr>
	  
	 
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="�ύ����" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="button" name="home" value="��    ��" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
