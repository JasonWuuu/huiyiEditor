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
	SQL = "SELECT TOP 1 INFO_TITLE,STATUS,user_name FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount>0 THEN
		
	%> 

<html>
<head>
<title>����������ϵͳ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"> 
  <p><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un"  >
  <input type=hidden name=info_no value="<%=request("info_no")%>">
 
  <table width="506" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="5" class="main">
    <tr> 
      <td colspan="4"><font color="#0000FF">��˼�¼����ȷ�����Ѿ���ϸ���Ķ��˸�ƪ����</font></td>
    </tr>
    <tr> 
      <td width="74">���±��⣺</td>
      <td colspan="3"><%=rs("info_title")%></td>
    </tr>
    <tr> 
      <td width="74">������Ա��</td>
      <td colspan="3"><%=rs("USER_NAME")%></td>
    </tr>
    <tr> 
      <td width="74">Ŀǰ״̬��</td>
      <td colspan="3"><%=rs("status")
      %></td>
    </tr>
    
    
    <tr> 
      <td width="74">�����</td>
        <td colspan="3">
        <select name="status">
          <option value="��" selected>ͨ��</option>
          <option value="δ">�޸�</option>
         
        </select>
      </td>
     </tr>
    <td colspan="4"> 
      <div align="center"> 
        <input type="submit" name="send" value="����ȷ��" onClick="return checkIn();">
        <input type="button" name="Button" value="�رմ���" onClick=self.close();>
      </div>
    </td>
    </tr>
  </table>
</form>
</body>
</html>
<%
END IF
%>