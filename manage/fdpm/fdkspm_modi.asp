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
	SQL = "SELECT TOP 1 * FROM fdkspm WHERE id = '" & REQUEST("id") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount >0 THEN
		S_HS_no = RS("HS_no")
		S_HS_NAME = RS("HS_NAME")
		S_PM = RS("PM")
		S_FD_NAME = RS("FD_NAME")
		END IF
	RS.CLOSE 
	%> 
<html>
<head>
<title>���������޸�</title>
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


	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="fdkspm_save_up.asp" name="un">
<input type=hidden name="id" value="<%=Request("id")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main"> 
        <select name="hs_no" >
     
          <%
        SQL = "SELECT * FROM HOSPTIAL ORDER BY hs_name"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
		  
		  IF RS1("HS_no") = S_HS_no THEN
        %>
		  
        <option value="<%=RS1("hs_no")%>" selected>	  <%=RS1("hs_NAME")%></option>
        <%
		  
		  ELSE
		  %>
		   <option value="<%=RS1("hs_no")%>" >	  <%=RS1("hs_NAME")%></option>
		  <%
		  END IF
		  
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <input type="text" name="pm" size="40" value="<%=s_pm%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ�������ң�</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
         IF RS1("fd_NAME") = S_fd_NAME THEN
        %>
		  
        <option value="<%=RS1("fd_no")%>" selected>	  <%=RS1("fd_NAME")%></option>
        <%
		  
		  ELSE
		  %>
		   <option value="<%=RS1("fd_no")%>" >	  <%=RS1("fd_NAME")%></option>
		  <%
		  END IF
		  
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
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
