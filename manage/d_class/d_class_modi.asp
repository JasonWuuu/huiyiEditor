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
	SQL = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & REQUEST("CLASS_NO") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount >0 THEN
		N_P_CLASS_NO = RS("P_CLASS_NO")
					N_CLASS_NO = RS("CLASS_NO")
					N_CLASS_NAME = RS("CLASS_NAME")
					N_NUM = RS("NUM")
					N_FD_NO = RS("FD_NO")
					N_CLASS_DESC = RS("CLASS_DESC")
					'N_BD_PM = RS("BD_PM")
					N_QG_PM = RS("QG_PM")
					'N_bj_BD_PM = RS("bj_BD_PM")
					N_bj_QG_PM = RS("bj_QG_PM")
					'N_jci_BD_PM = RS("jci_BD_PM")
					N_jci_QG_PM = RS("jci_QG_PM")
					N_URL = RS("URL")
		END IF
	RS.CLOSE 
	%> 
<html>
<head>
<title>��������޸�</title>
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
   
    if( document.un.class_name.value.length <1) {
      alert("���������д");
      document.un.class_name.focus();
      return false;
   }

	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="d_class_save_up.asp" name="un">
  <table width="1053" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <input type=hidden name="class_no" value="<%=Request("class_no")%>">
   <input type=hidden name="hs_no" value="<%=N_HS_NO%>">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƣ������޸ģ���</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="class_name" value="<%=N_CLASS_NAME%>" size="90">
        </font></small></td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���Ҽ�飺</td>
      <td width="79%" class="main"> 
		<%
		N_class_desc = REPLACE(N_class_desc,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>",chr(13))
		N_class_desc = REPLACE(N_class_desc,"</span></p>",chr(13))
		%>	
        <textarea name="class_desc" rows="10" cols="60"><%=N_class_desc%></textarea>
      </td>
    </tr>

	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46" value="<%=N_qg_pm%>">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46" value="<%=N_jci_qg_pm%>">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46" value="<%=N_bj_qg_pm%>">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ҹҺ�����URL��</td>
      <td width="79%" class="main"> 
		 <input type="text" name="url" size="46" value="<%=N_url%>">
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ʾ˳��</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="40" value="<%=N_NUM%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ�������ң������޸ģ���</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
			
				IF RS1("FD_NO") = N_FD_NO THEN
        %>
		   
        <option value="<%=RS1("FD_NO")%>" selected><%
		
		  %><%=RS1("FD_NAME")%></option>
        <%
		  ELSE
		  %>
		    
        <option value="<%=RS1("FD_NO")%>" ><%
		
		  %><%=RS1("FD_NAME")%></option>
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
           <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
