<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

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
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	%> 
<html>
<head>
<title>�ַ�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">


<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������ַ�ϵͳ���� </font></div>
<hr>
<form method="POST" action="a_corre_save.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ֶ����ƣ�</td>
      <td width="79%" class="main"> 
        <select name="zd"  onChange="GoToURL()">
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
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ǰ�ַ���</td>
      <td width="79%" class="main">
        <input type="TEXT" name="qzf" value="" size="30">��������ͬʱ����Ϊ�գ�
        </td>
    </tr>
    
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ַ���</td>
      <td width="79%" class="main">
        <input type="TEXT" name="hzf" value="" size="30">��������ͬʱ����Ϊ�գ�
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
