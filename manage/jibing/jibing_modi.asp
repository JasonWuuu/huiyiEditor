<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	SQL = "SELECT TOP 1 * FROM JIBING WHERE JB_NO = '" & REQUEST("JB_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>������Ϣ�޸�</title>
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
     if( document.un.fd_no.options[document.un.fd_no.selectedIndex].value <1) {
      alert("���ұ���ѡ��");
      document.un.fd_no.focus();
      return false;
   }
    
   
   
    if( document.un.jb_name.value.length <1) {
      alert("����������д");
      document.un.jb_name.focus();
      return false;
   }


	if( document.un.info_find.value.length <1) {
      alert("�����ַ�һ��Ҫ�У���ѯʲô�ܲ鵽������");
      document.un.info_find.focus();
      return false;
   }
  
	
	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="jibing_save_up.asp" name="un">
<input type="hidden" name="jb_no" value="<%=Request("jb_no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ң�</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
          <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF RS1("FD_NO") = RS("FD_NO") THEN
        %>
        <option value="<%=RS1("FD_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("FD_NO")%>" >
				<%
				END IF
				%>
		  
		  <%=RS1("FD_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����һ�����ң�</td>
      <td width="79%" class="main">
        <input type="text" name="p_class_no" size="50" value="<%=rs("p_class_no")%>">
      
          </td>
    </tr>
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������ң�</td>
      <td width="79%" class="main">
        <input type="text" name="class_no" size="50" value="<%=rs("class_no")%>">
      
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ƣ�</td>
      <td width="79%" class="main">
        <input type="text" name="jb_name" size="50" value="<%=rs("jb_name")%>">
       
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��λ��</td>
      <td width="79%" class="main">
        <input type="text" name="bw" size="50" value="<%=rs("bw")%>">
       
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������</td>
      <td width="79%" class="main">
        <input type="text" name="jb_bm" size="50" value="<%=rs("jb_bm")%>">
       
          </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">֢״�б�</td>
      <td width="79%" class="main"> 
        <textarea name="zzlb" rows="10" cols="60"><%=rs("zzlb")%></textarea>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����֢״��</td>
      <td width="79%" class="main"> 
        <textarea name="cjzz" rows="10" cols="60"><%=rs("cjzz")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������</td>
      <td width="79%" class="main"> 
        <textarea name="cjby" rows="10" cols="60"><%=rs("cjby")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����жϣ�</td>
      <td width="79%" class="main"> 
        <textarea name="fzpd" rows="10" cols="60"><%=rs("fzpd")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ�Ⱦ��</td>
      <td width="79%" class="main">
        <input type="text" name="sfcr" size="10" value="<%=rs("sfcr")%>">
       
          </td>
    </tr>
	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ񳣼�������</td>
      <td width="79%" class="main">
        <select name="cjjb" >
	       
        <option value="��" >��</option>
		 <option value="��" >��</option>
		 <option value="<%=rs("cjjb")%>" selected><%=rs("cjjb")%></option>
		 
        </select>
          </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
     
       
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ʾ˳��</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="30" value="<%=rs("num")%>">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������棺</td>
      <td width="79%" class="main"> 
        <textarea name="jbbg" rows="10" cols="60"><%=rs("jbbg")%></textarea>
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
