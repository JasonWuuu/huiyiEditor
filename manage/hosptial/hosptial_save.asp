<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
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
 
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("hosptial_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		 s_hs_name =  request("hs_name")
		 s_alice_name =  request("alice_name")
		 s_hs_desc = request("hs_desc")
		 s_scjb = request("scjb")
		 s_if_html =  request("if_html")
		 s_info_find =  request("info_find")
		 s_info_corre =  request("info_corre")
		 s_url= request("url")
		 s_bd_pm = request("bd_pm")
		 s_qg_pm = request("qg_pm")
		 s_area = request("sf") & request("cs")
		 s_yy_fs = request("yy_fs")
		 s_yy_dj = request("yy_dj")
		 s_PROPERTY = request("PROPERTY")
		 s_SF_TROOPS = request("SF_TROOPS")
		 s_ZHMODE = request("ZHMODE")
		 s_TYPE = request("TYPE")
		 s_TEL = request("TEL")
		 s_SEND_URL = request("SEND_URL")
		 s_address = Request("address")
		 s_bj_bd_pm = request("bj_bd_pm")
		 s_bj_qg_pm = request("bj_qg_pm")
		 s_jci_bd_pm = request("jci_bd_pm")
		 s_jci_qg_pm = request("jci_qg_pm")
		 s_img = request("img")
		 
					SQL = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & s_hs_name & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "��¼�����ظ���ҽԺ����һ��"
					Response.End 
					END IF
				RS.Close 
				
			
					WB_FILE_NO = "H" & ID_NAME("HS_NO")
					
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM HOSPTIAL"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("scjb") = s_scjb
	  				RS1("hs_name") = s_hs_name
	  				RS1("hs_desc") = s_hs_desc
						RS1("info_find") = s_info_find
	  				RS1("alice_name") = s_alice_name
	  				RS1("HS_NO") = WB_FILE_NO
	  				RS1("IF_HTML") = s_if_html
						RS1("URL") = s_url
						'RS1("bd_pm") = s_bd_pm
						RS1("qg_pm") = s_qg_pm
						RS1("AREA") = s_area
						RS1("YY_FS") = s_yy_fs
						RS1("YY_DJ") = s_yy_dj
						RS1("PROPERTY") = S_PROPERTY
						RS1("SF_TROOPS") = S_SF_TROOPS
						RS1("ZHMODE") = S_ZHMODE
						RS1("TYPE") = S_TYPE
						RS1("TEL") = S_TEL
						RS1("SEND_URL") = S_SEND_URL
						'RS1("bj_bd_pm") = s_bj_bd_pm
						RS1("bj_qg_pm") = s_bj_qg_pm
						'RS1("jci_bd_pm") = s_jci_bd_pm
						RS1("jci_qg_pm") = s_jci_qg_pm
						RS1("ADDRESS") = s_address
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1("IMG") = "yytp/" & s_img
						RS1.UpdateBatch 
	  				RS1.Close 
	  				
					
					YY = s_hs_name
		BM = s_alice_name
		JS = s_hs_desc
		KS = ""
		SQL1 = "SELECT * FROM D_CLASS WHERE HS_NO = '" & WB_FILE_NO & "'"
			RS1.Open SQL1,CONN,1,1
				DO WHILE NOT RS1.EOF 
				KS = KS & RS1("CLASS_NAME")
				SQL2 = "SELECT JB_NAME FROM JIBING WHERE FD_NO = '" & RS1("FD_NO") & "'"
					RS2.Open SQL2,CONN,1,1
						DO WHILE NOT RS2.EOF 
						KS = KS & RS2("JB_NAME")
						RS2.MoveNext
						LOOP
					RS2.CLOSE 
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			XM = ""
			SQL1 = "SELECT * FROM D_DOCTOR WHERE HS_NO = '" & WB_FILE_NO & "'"
			RS1.Open SQL1,CONN,1,1
				DO WHILE NOT RS1.EOF 
				XM = XM & RS1("XM")
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			
					
						SQL = "SELECT top 1 * FROM HOSPTIAL  WHERE HS_NO = '" & WB_FILE_NO & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
						RS9("INFO_FIND") = YY & BM & JS & KS & XM
						RS9.UpdateBatch 
	  				RS9.Close 
					
					
					
%>
<html>
<head>
<title>ҽԺ���ӳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����ҽԺϵͳ���� </font></div>
<hr>
<form method="POST" action="hosptial_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ���ƣ�</td>
      <td width="79%" class="main">
       <%=s_hs_name%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main">
       <%=s_alice_name%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��Ƭ��</td>
      <td width="79%" class="main">
       <img src="http://img.dakayi.net/pic/<%=s_img%>">
        
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��飺</td>
      <td width="79%" class="main"> 
       <%
		IF s_if_html = "��" THEN
		Response.Write s_hs_desc
		ELSE
		%>&nbsp;&nbsp;&nbsp;&nbsp;
        <%body = replace(s_hs_desc,chr(10),"<br>&nbsp;&nbsp;&nbsp;&nbsp;")%>
        <%=body%>&nbsp; 
        <%
        END IF
        %>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�������</td>
      <td width="79%" class="main"> 
        <%
		IF s_if_html = "��" THEN
		Response.Write s_scjb
		ELSE
		%>&nbsp;&nbsp;&nbsp;&nbsp;
        <%body = replace(s_scjb,chr(10),"<br>&nbsp;&nbsp;&nbsp;&nbsp;")%>
        <%=body%>&nbsp; 
        <%
        END IF
        %>
      </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main"> 
        <%=s_area%>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������У��</td>
      <td width="79%" class="main"> 
        <%=s_yy_fs%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ�ȼ���</td>
      <td width="79%" class="main"> 
        <%=s_yy_dj%>
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
        <%=s_info_find%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main"><font color=red>��ز�ѯ�ַ���</font></td>
      <td width="79%" class="main">
        
			  <%=s_info_corre%>
          
        <span class="main"> �� ���û�У��뵽����ַ������ӣ�</span></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
		<%=s_url%>
       </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_qg_pm%>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_bj_qg_pm%>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_jci_qg_pm%>
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӫ���ʣ�</td>
      <td width="79%" class="main"> 
       <%=S_PROPERTY%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ񲿶ӣ�</td>
      <td width="79%" class="main"> 
       <%=S_SF_TROOPS%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ۺ�/ר�ƣ�</td>
      <td width="79%" class="main"> 
       <%=S_ZHMODE%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�֣�</td>
      <td width="79%" class="main"> 
       <%=S_TYPE%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�绰��</td>
      <td width="79%" class="main"> 
       <%=S_TEL%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Һ����ӣ�</td>
      <td width="79%" class="main"> 
      <%=S_SEND_URL%>
     
       
      </td>
    </tr>
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
      <%=S_address%>
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="add" value="��������">
          <input type="submit" name="home" value="������ҳ">
          <input type="submit" name="search" value="�����ѯ">
        </div>
      </td>
  </table>
</form>
</body>
</html>
