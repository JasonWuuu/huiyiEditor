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
<title>ר����������</title>
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
   
    if( document.un.corre_name.value.length <1) {
      alert("���������д");
      document.un.corre_name.focus();
      return false;
   }

	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������ַ�ϵͳ���� </font></div>
<hr>
<form method="POST" action="a_zhuanti_save.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ר�����ƣ�</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="zt_name" value="" size="40">
        </font></small></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ʾ˳��</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="40" value="0"> 
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
