<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
            
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
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

    
		 P_CLASS_NO = request("class_no")
		 s_class_name =  request("class_name")
		 s_num = request("num")
		 s_fd_no = request("fd_no")
		 S_CLASS_DESC = REQUEST("CLASS_DESC")
		 S_BD_PM = REQUEST("BD_PM")
		 S_QG_PM = REQUEST("QG_PM")
		 S_HS_NO = REQUEST("HS_NO")
		 S_BJ_BD_PM = REQUEST("BJ_BD_PM")
		 S_BJ_QG_PM = REQUEST("BJ_QG_PM")
		 S_JCI_BD_PM = REQUEST("JCI_BD_PM")
		 S_JCI_QG_PM = REQUEST("JCI_QG_PM")
		 s_URL = request("URL")
			IF s_class_name <> "" THEN
			ELSE
			Response.Write("���Ʋ���Ϊ��")
			Response.end 
			END IF

'�ж����µ�����ַ�
	SQL = "SELECT TOP 1 * FROM D_CLASS WHERE HS_NO = '" & REQUEST("HS_NO") & "' AND CLASS_NAME='"  & s_class_name & "'"

		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "�������Ѿ����ڣ�������������������"
			Response.End 
			END IF
		RS.Close 
	
	  	
			IF P_CLASS_NO = "000" THEN
			P_CLASS_NO = "C" & id_name("DCLASS_A")
			S_CLASS_NO = P_CLASS_NO
			JIBIE = 1
			ELSE
					  p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & "" & id_name("DCLASS_B")
						JIBIE = 2
				
			END IF
			
			IF P_CLASS_NO <> S_CLASS_NO THEN
			'����Ҫ��һ��Ū����
			S_CLASS_NAME =DISPLAY_NAME("D_CLASS",P_CLASS_NO,"CLASS_NO","CLASS_NAME") & "-" & S_CLASS_NAME
			
			ELSE
			
			S_CLASS_NAME =  Request("CLASS_NAME")
			
			END IF

			'����
			SQL1 = "SELECT TOP 1 * FROM FDKSPM WHERE HS_NAME = '" & DISPLAY_NAME("HOSPTIAL",S_HS_NO,"HS_NO","HS_NAME") & "' AND FD_NAME = '" & DISPLAY_NAME("FD_CLASS",S_FD_NO,"FD_NO","FD_NAME") & "'"
				RS1.Open SQL1,CONN,1,1
					IF RS1.RecordCount >0 THEN
					S_BD_PM = RS1("PM")
					S_QG_PM = RS1("PM")
					END IF
				RS1.CLOSE 
	'�����ַ�
					XTH="<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>"
					XTHJW = "</span></p>"

					S_CLASS_DESC=replace(S_CLASS_DESC,chr(13),XTHJW & XTH)
					S_CLASS_DESC = XTH & S_CLASS_DESC & XTHJW

	  				SQL = "SELECT top 1 * FROM D_CLASS"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("P_CLASS_NO") = p_class_no
	  				RS1("CLASS_NO") = S_CLASS_NO
	  				RS1("CLASS_NAME") = S_CLASS_NAME
						RS1("CLASS_DESC") = S_CLASS_DESC
	  				RS1("NUM") = S_NUM
						'RS1("BD_PM") = S_BD_PM
						RS1("QG_PM") = S_QG_PM
						'RS1("BJ_BD_PM") = S_BJ_BD_PM
						RS1("BJ_QG_PM") = S_BJ_QG_PM
						'RS1("JCI_BD_PM") = S_JCI_BD_PM
						RS1("JCI_QG_PM") = S_JCI_QG_PM
						RS1("HS_NO") = S_HS_NO
						RS1("JIBIE") = JIBIE
						RS1("URL") = S_URL
						RS1("FIND_INFO") = S_CLASS_NAME
						RS1("FD_NO") = s_fd_no
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  			
				SQL = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & p_class_no & "'"
				RS.Open SQL,CONN,1,1
					IF RS.RecordCount>0 THEN
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
				
				'	KSJJ = S_CLASS_DESC
			JB = ""
			SQL1 = "SELECT JB_NAME FROM JIBING WHERE FD_NO = '" & s_fd_no & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					JB = JB & RS1("JB_NAME")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
					'ҽ��
				YS = ""
				SQL1 = "SELECT XM FROM D_DOCTOR WHERE CLASS_NO='" & P_CLASS_NO & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					YS = YS & RS1("XM")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
					ALICE_NAME=""	
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & RS("HS_NO") & "'"
		RS1.Open SQL1,CONN,1,1
		IF RS1.RecordCount >0 Then
		ALICE_NAME=""
		ALICE_NAME = RS1("HS_NAME") & RS1("ALICE_NAME")
		
		End If
		RS1.CLOSE 	
						SQL = "SELECT top 1 * FROM D_CLASS WHERE CLASS_NO = '" & P_CLASS_NO & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("FIND_INFO") = KSJJ & JB & YS & ALICE_NAME
					RS9.UpdateBatch 
	  				RS9.Close 
					
		
		
%>
<html>
<head>
<title>����������ӳɹ�</title>
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
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������ϵͳ���� </font></div>
<hr>
<form method="POST" action="d_class_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">�ϼ����</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",N_P_CLASS_NO,"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���ƣ�</td>
      <td width="68%" class="main"> 
         <%=N_CLASS_NAME
        %> 
        </select>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���Ҽ�飺</td>
      <td width="68%" class="main"> 
         <%=N_CLASS_DESC
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">��ʾ˳��</td>
      <td width="68%" class="main"> 
         <%=N_NUM
        %> 
      </td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">ȫ��������</td>
      <td width="68%" class="main"> 
         <%=N_QG_PM
        %> 
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">����ȫ��������</td>
      <td width="68%" class="main"> 
         <%=N_BJ_QG_PM
        %> 
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">JCIȫ��������</td>
      <td width="68%" class="main"> 
         <%=N_JCI_QG_PM
        %> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���ҹҺ�URL��</td>
      <td width="68%" class="main"> 
         <%=N_URL
        %> 
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">��Ӧ�������ң�</td>
      <td width="68%" class="main"> 
         <%=DISPLAY_NAME("FD_CLASS",N_FD_NO,"FD_NO","FD_NAME")
        %> 
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
		</tr>
  </table>
</form>
</body>
</html>
