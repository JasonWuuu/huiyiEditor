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
	
	SQL = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>ҽԺ��Ϣ�޸�</title>
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
    
   
    if( document.un.hs_name.value.length <1) {
      alert("ҽԺ���Ʊ�����д");
      document.un.hs_name.focus();
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
<form method="POST" action="hosptial_save_up.asp" name="un">
<input type="hidden" name="hs_no" value="<%=Request("hs_no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ���ƣ�</td>
      <td width="79%" class="main">
        <input type="text" name="hs_name" size="50" value="<%=rs("hs_name")%>">
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main"> 
        <textarea name="alice_name" rows="3" cols="60"><%=rs("alice_name")%></textarea>
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��飺</td>
      <td width="79%" class="main"> 
        <textarea name="hs_desc" rows="10" cols="60"><%=rs("hs_desc")%></textarea>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�������</td>
      <td width="79%" class="main"> 
        <textarea name="scjb" rows="10" cols="60"><%=rs("scjb")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
       <select name="area" >
		  	<option value="" >ʡ�ݳ���</option>
		  <%
		  SQL = "SELECT M_STATE,M_CITY FROM D_STATE ORDER BY ID"
				RS1.Open SQL,CONN,1,1
					DO WHILE NOT RS1.EOF 
						IF RS1("M_STATE") & RS1("M_CITY") = RS("AREA") THEN
						%>
						<option value="<%=rs1("m_state")%><%=rs1("m_city")%>" selected><%=rs("area")%></option>
						<%
						ELSE
						
					%>
						<option value="<%=rs1("m_state")%><%=rs1("m_city")%>"><%=rs1("m_state")%><%=rs1("m_city")%></option>
					<%
					END IF
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
		  %>
		
       
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������У��</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_fs" size="30" value="<%=rs("yy_fs")%>">
     
       
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ�ȼ���</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_dj" size="30" value="<%=rs("yy_dj")%>">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��Ƭ��</td>
      <td width="79%" class="main"> 
	  <%
	  img = rs("img")
	  pop = 0
	  pop = InStr(img,"yytp")
	  If pop >0 Then
	  img = rs("img")
	  Else
	  imf = "yytp/" & rs("img")
	  End if
	  %>
        <input type="text" name="img" size="30" value="<%=img%>">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӫ���ʣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="PROPERTY" size="30"  value="<%=rs("PROPERTY")%>">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ񲿶ӣ�</td>
      <td width="79%" class="main"> 
	  <%
	  If rs("SF_TROOPS") = "��" then
	  %>
        <input type="radio" name="SF_TROOPS" value="��"  checked>
        �� 
        <input type="radio" name="SF_TROOPS" value="��">
        �� 
	   <%
	   Else
	   %>
	    <input type="radio" name="SF_TROOPS" value="��">
        �� 
        <input type="radio" name="SF_TROOPS" value="��" checked>
        �� 
	   <%
	   End if
	   %>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ۺ�/ר�ƣ�</td>
      <td width="79%" class="main"> 
	   <%
	  If rs("SF_TROOPS") = "�ۺ�" then
	  %>
        <input type="radio" name="ZHMODE" value="�ۺ�"  checked>
        �ۺ�
        <input type="radio" name="ZHMODE" value="ר��">
        ר�� 
	   <%
	   Else
	   %>
	    <input type="radio" name="ZHMODE" value="�ۺ�">
        �ۺ� 
        <input type="radio" name="ZHMODE" value="ר��" checked>
        ר�� 
	   <%
	   End if
	   %>
     
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�֣�</td>
      <td width="79%" class="main"> 
      
       <select name="TYPE" >
     <option value="<%=rs("TYPE")%>" selected><%=rs("TYPE")%></option>
        <option value="��ҽ" > ��ҽ</option>
		   <option value="��ҽ" > ��ҽ</option>
			 <option value="����ҽ���" >����ҽ���</option>
		  </select>
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
		 <input type="text" name="url" size="46" value="<%=rs("url")%>">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�绰��</td>
      <td width="79%" class="main"> 
        <input type="text" name="TEL" size="30"   value="<%=rs("TEL")%>">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Һ����ӣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="SEND_URL" size="50"   value="<%=rs("SEND_URL")%>">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="address" size="50"   value="<%=rs("address")%>">
     
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
     
       
      </td>
    </tr>
    
    
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46"  value="<%=rs("qg_pm")%>">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46"  value="<%=rs("bj_qg_pm")%>">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46"  value="<%=rs("jci_qg_pm")%>">
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
