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
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	%> 
<html>
<head>
<title>�Զ������Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>
<script language="javascript">

var lsdz = "";
function checkIn()
{
   
   
    if( document.un.mc.value.length <1) {
      alert("������д");
      document.un.mc.focus();
      return false;
   }


  
	if( document.un.url.value.length <1) {
      alert("URL������д");
      document.un.url.focus();
      return false;
   }
	

	
	if( document.un.note.value.length <1) {
      alert("���ݱ�����д");
      document.un.note.focus();
      return false;
   }
	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">��ȫ���Һ�ƽ̨��Ϣ������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="pipei_save.asp" name="un">
 
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƣ�</td>
      <td width="79%" class="main">
        <input type="text" name="mc" size="50">
      
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">URL��</td>
      <td width="79%" class="main">
        <input type="text" name="url" size="50">
      
          </td>
    </tr>
	  
    
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ݣ�</td>
      <td width="79%" class="main">
        <input type="text" name="note" size="50">��#�ŷָ��ַ�
      
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
