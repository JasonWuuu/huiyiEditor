<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ���
'���������ű��κ��˲�����ԭ�������Լ�ɾ���Լ��ļ�¼

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("/manage/admin_default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("d_class_add.asp")
	END IF
	%> 
<%
I = 5
SQL = "SELECT HS_NAME,SEND_URL,URL,IMG,AREA FROM HOSPTIAL"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	IF RS("SEND_URL") = "" THEN
	URL = RS("URL")
	ELSE
	URL = RS("SEND_URL")
	END IF
	SQL1 = "INSERT INTO D_GHPT (NAME,URL,IMG,CLASS,NUM,AREA) VALUES('" & RS("HS_NAME") & "','" & URL & "','" & RS("IMG") & "','ҽԺ�ٷ�'," & I & ",'" & MID(RS("AREA"),1,2) & "')"
	response.Write(sql1)
	'CONN.Execute(SQL1)
	I = I + 1
	RS.MoveNext
	LOOP
RS.CLOSE 
Response.end 
SQL3 = "SELECT DISTINCT �ֶ����� FROM TEST"
	RS3.Open SQL3,CONN,1,1
	DO WHILE NOT RS3.EOF
SQL = "SELECT * FROM TEST WHERE �ֶ����� = '" & RS3("�ֶ�����") & "'"
	RS.Open SQL,CONN,1,1
	I = 1
		DO WHILE NOT RS.EOF
			
					'���Ӽ�¼
	  		SQL2 = "SELECT TOP 1 * FROM GUOLV WHERE CH = '" & RS("�ֶ�����") & "' AND QZF='" & RS("ǰ�ַ�") & "' AND HZF='" & RS("���ַ�") & "'"
			RS2.Open SQL2,CONN,1,1
				IF RS2.RecordCount >0 THEN
				
				Else
				
	  				SQL = "SELECT top 1 * FROM GUOLV"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CH") = RS("�ֶ�����")
	  				RS1("QZF") = RS("ǰ�ַ�")
	  				RS1("HZF") = RS("���ַ�")
					RS1("HZFNUM") = I 
					RS1("QZFNUM") = I
	  				RS1("QZFWZ") = "��ֹ"
					RS1("HZFWZ") = "��ֹ"
	  				
						RS1.UpdateBatch 
	  				RS1.Close 
					I = I + 1
				End If
				RS2.CLOSE 
			RS.MoveNext
			LOOP
			RS.CLOSE 
		RS3.MoveNext
			LOOP
		RS3.CLOSE 	
Response.end 
SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NO"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		M_INFO = ""
			SQL1 = "SELECT * FROM D_DOCTOR WHERE (HS_NO LIKE '%" & RS("HS_NO") & "%' OR ZW LIKE '%" & RS("HS_NAME") & "%' OR XSZW_GJA LIKE '%" & RS("HS_NAME") & "%'  OR YSGS LIKE '%" & RS("HS_NAME") & "%')"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					M_INFO = M_INFO & RS1("XM")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
				SQL2 = "UPDATE HOSPTIAL SET INFO_FIND = '" & M_INFO & "' WHERE HS_NO = '" & RS("HS_NO") & "'"
				CONN.Execute(SQL2)
		RS.MoveNext
		LOOP
	RS.CLOSE 
Response.end 

		SQL = "SELECT * FROM my_hosptial where ҽԺ���� like '%��%' "
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
					POP = INSTR(RS("ҽԺ����"),"��")
						IF POP >0 THEN
						
						X_CLASS_NAME = MID(RS("ҽԺ����"),1,POP-1)
						B_CLASS_NAME = MID(RS("ҽԺ����"),POP+1)
						MYLEN = LEN(B_CLASS_NAME)
						B_CLASS_NAME = MID(B_CLASS_NAME,1,MYLEN-1)
						ELSE
						X_CLASS_NAME = RS("ҽԺ����")
						B_CLASS_NAME = ""
						END IF
					
					  SQL1 = "UPDATE HOSPTIAL SET HS_NAME = '" & X_CLASS_NAME & "',ALICE_NAME='" & B_CLASS_NAME & "' WHERE URL = '" & RS("ҽԺ����") & "'"
					  CONN.Execute(SQL1)
					 Response.Write(SQL1)
					 Response.Write("<br>")
						Response.Write(X_CLASS_NAME)
						Response.Write("<br>")
						Response.Write(b_CLASS_NAME)
						Response.Write("<br>")
				RS.MoveNext
				LOOP
			RS.CLOSE 
  RESPONSE.end  


SQL = "SELECT * FROM MY_HOSPTIAL"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF
	
	
	
	
		SQL2 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("ҽԺ����") & "'"
			RS2.Open SQL2,CONN,1,1
				IF RS2.RecordCount >0 THEN
				
				ELSE
				response.Write(RS("�绰"))
				response.Write("<br>")
	response.Write(RS("ҽԺ����"))
				response.Write("<hr>")
		WB_FILE_NO = ID_NAME("HS_NO")
					
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM HOSPTIAL"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("scjb") = ""
	  				RS1("hs_name") = RS("ҽԺ����")
	  				RS1("hs_desc") = ""
						RS1("info_find") = RS("ҽԺ����")
	  				RS1("info_corre") = ""
	  				RS1("HS_NO") = WB_FILE_NO
	  				RS1("IF_HTML") = "��"
						RS1("URL") = RS("ҽԺ����")
						RS1("bd_pm") = RS("�ۺ�����")
						RS1("qg_pm") = RS("�ۺ�����")
						RS1("AREA") = RS("����")
						RS1("YY_FS") = RS("ҽԺ������У")
						RS1("YY_DJ") = RS("ҽԺ�ȼ�")
						RS1("PROPERTY") = RS("��Ӫ����")
						RS1("SF_TROOPS") = RS("����ҽԺ�񲿶�")
						RS1("ZHMODE") = RS("�ۺ�ר��")
						RS1("TYPE") = RS("ҽ��")
						RS1("SEND_URL") = RS("�Һ�����")
						RS1("ADDRESS") = RS("��ַ")
						RS1("TEL") = RS("�绰")
						RS1("BJ_BD_PM") = 0
						RS1("BJ_QG_PM") = 0
						RS1("JCI_BD_PM") = 0
						RS1("JCI_QG_PM") = 0
						RS1("USER_NAME") = "leon"
						RS1.UpdateBatch 
	  				RS1.Close 
						SQL = "UPDATE HOSPTIAL SET INFO_FIND= '" & RS("ҽԺ����") & "-" & RS("����") & "-" & RS("ҽԺ������У") & "-" & RS("ҽԺ�ȼ�") & "'"
						CONN.Execute(SQL)
		END IF
		RS2.CLOSE 
			RS.MoveNext
			LOOP
		RS.CLOSE 
		
		SQL = "update HOSPTIAL set IF_HTML='��'"
		CONN.Execute(SQL)
		
	
%>
END 