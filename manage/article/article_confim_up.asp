<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 
'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µ�ȷ��
'���������ű��ɲ��ž������ϲ���

 '�жϼ���
 	set CONN = Server.CreateObject("ADODB.Connection")
	CONN.open CONNSTR,"",""  
    set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'�ж�Ȩ��
IF lcase(Request.Cookies("user_name")) <> "leon" THEN
		Response.Write "�Բ�����Ŀǰû����˵�Ȩ������Ŭ��������лл"
		Response.End 
	END IF
sql = "update a_article set status='" & request("status") & "' where info_no = '" & request("info_no") & "'"
conn.Execute(sql)
	%> 
<html>
<head>
<title>������������˽��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ��˽��</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un" >
  <table width="400" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="0" class="main">
    <tr> 
      <td colspan="2"><font color="#0000FF">��˼�¼����ȷ�����Ѿ���ϸ���Ķ��˸�ƪ����</font></td>
    </tr>
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td width="98">Ŀǰ״̬��</td>
      <td width="296">
      <%=request("status")
      %></td>
    </tr>
   
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="2">
        <div align="center">
          <input type="button" name="Button" value="�رմ���" onclick=self.close();>
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
