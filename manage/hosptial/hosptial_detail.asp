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
<title>ҽԺ��Ϣ��ϸ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����ҽԺϵͳ-��ϸ���� </font></div>
<hr>
<form method="POST" action="hosptial_save_up.asp" name="un">
<input type="hidden" name="hs_no" value="<%=Request("hs_no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
 
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ���ƣ�</td>
      <td width="79%" class="main">
        <%=rs("hs_name")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main">
        <%=rs("alice_name")%>
       
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
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main"> 
        <%=rs("area")%>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������У��</td>
      <td width="79%" class="main"> 
        <%=rs("yy_fs")%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ�ȼ���</td>
      <td width="79%" class="main"> 
        <%=rs("yy_dj")%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��Ƭ��</td>
      <td width="79%" class="main">
       <img src="http://img.dakayi.net/pic/<%=rs("img")%>">
        
          </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӫ���ʣ�</td>
      <td width="79%" class="main"> 
       <%=rs("PROPERTY")%>
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ񲿶ӣ�</td>
      <td width="79%" class="main"> 
       <%=rs("SF_TROOPS")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ۺ�/ר�ƣ�</td>
      <td width="79%" class="main"> 
       <%=rs("ZHMODE")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�֣�</td>
      <td width="79%" class="main"> 
       
      <%=rs("TYPE")%>
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
		 <a href="<%=rs("url")%>" target="_blank"><%=rs("url")%></a>
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�绰��</td>
      <td width="79%" class="main"> 
       
       <%=rs("TEL")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Һ����ӣ�</td>
      <td width="79%" class="main"> 
 
     <a href="<%=rs("SEND_URL")%>" target="_blank"><%=rs("SEND_URL")%></a>
       
      </td>
    </tr>
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
 
     <%=rs("address")%>
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
       <%=rs("info_find")%>
     
       
      </td>
    </tr>
    
   
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("qg_pm")%>
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("bj_qg_pm")%>
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("jci_qg_pm")%>
       </td>
    </tr>
	 
	
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
           <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
