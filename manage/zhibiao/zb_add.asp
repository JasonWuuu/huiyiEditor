<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ�������  �� 2002-4-21 ��д
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
<title>���ָ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="zb_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ƣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbmc" size="50">
       
          </td>
    </tr>
	  
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�굥λ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbdw" size="50">
       
          </td>
    </tr>
	  
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbsx" size="50" value="">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbxx" size="50" value="">
        
          </td>
    </tr>
	  
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�������</td>
      <td width="79%" class="main"> 
            <textarea name="zbgs" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
           <textarea name="zbpgyy" rows="10" cols="60"></textarea>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
        <textarea name="zbpdyy" rows="10" cols="60"></textarea>
      </td>
    </tr>
	  
	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�겹��˵����</td>
      <td width="79%" class="main"> 
        <textarea name="ZBBCSM" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ��������-�ֿ�����</td>
      <td width="79%" class="main"> 
        <textarea name="dyjb" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ��ǳ���ָ�꣺</td>
      <td width="79%" class="main"> 
        <input type="radio" name="cjzb" value="��">
        �� 
        <input type="radio" name="cjzb" value="��" checked>
        �� </td>
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