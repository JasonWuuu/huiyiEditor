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
	Response.Redirect ("jibing_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

SQL = "SELECT M_STATE FROM D_STATE ORDER BY M_STATE"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
		SQL1 = "SELECT TOP 1 * FROM CXZK WHERE CXZF = '" & replace(replace(RS("M_STATE"),"��",""),"������","") & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount >0 THEN
			SQL2 = "UPDATE CXZK SET NUM=8888 WHERE CXZF='" & replace(replace(RS("M_STATE"),"��",""),"������","") & "'"
			CONN.Execute(SQL2)
			ELSE
			SQL2 = "INSERT INTO CXZK (CXZF,NUM) VALUES('" & replace(replace(RS("M_STATE"),"��",""),"������","") & "',8888)"
			CONN.Execute(SQL2)
			END IF
			RS1.CLOSE 
	RS.MoveNext
	LOOP
RS.CLOSE 

RESPONSE.END 

'ҽ��

SQL = "SELECT * FROM D_DOCTOR ORDER BY NO "
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
		XM = RS("XM")
		YY = ""
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & RS("HS_NO") & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
			YY = RS1("HS_NAME")
			END IF
			RS1.CLOSE 
			KS=""
		SQL1 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
			KS = RS1("CLASS_NAME")
			END IF
			RS1.CLOSE 
			ZLTC = RS("ZLTC")
			



				SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & RS("NO") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("INFO_FIND") = XM & YY & KS & ZLTC
					RS9.UpdateBatch 
	  				RS9.Close 
					
		
	RS.MoveNext
	LOOP
RS.CLOSE 

'����
SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NO"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
			KSJJ = RS("CLASS_DESC")
			JB = ""
			SQL1 = "SELECT JB_NAME FROM JIBING WHERE FD_NO = '" & RS("FD_NO") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					JB = JB & RS1("JB_NAME")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
				'ҽ��
				YS = ""
				SQL1 = "SELECT XM FROM D_DOCTOR WHERE CLASS_NO='" & RS("CLASS_NO") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					YS = YS & RS1("XM")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
					
						SQL = "SELECT top 1 * FROM D_CLASS WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("FIND_INFO") = KSJJ & JB & YS
					RS9.UpdateBatch 
	  				RS9.Close 
					
		
		RS.MoveNext
		LOOP
	RS.CLOSE 
'ҽԺ
SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NO"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
		YY = RS("HS_NAME")
		BM = RS("ALICE_NAME")
		JS = RS("HS_DESC")
		KS = ""
		SQL1 = "SELECT * FROM D_CLASS WHERE HS_NO = '" & RS("HS_NO") & "'"
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
			SQL1 = "SELECT * FROM D_DOCTOR WHERE HS_NO = '" & RS("HS_NO") & "'"
			RS1.Open SQL1,CONN,1,1
				DO WHILE NOT RS1.EOF 
				XM = XM & RS1("XM")
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			
					
						SQL = "SELECT top 1 * FROM HOSPTIAL  WHERE HS_NO = '" & RS("HS_NO") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("INFO_FIND") = YY & BM & JS & KS & XM
					RS9.UpdateBatch 
	  				RS9.Close 
					
					
					
	
	RS.MoveNext
	LOOP
RS.CLOSE 

'����
SQL = "SELECT * FROM JIBING ORDER BY JB_NO"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		ZZLB = RS("ZZLB")
		CJZZ = RS("CJZZ")
		YY = ""
			SQL1 = "SELECT * FROM D_CLASS WHERE FD_NO = '" & RS("FD_NO") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
						SQL2 = "SELECT XM FROM D_DOCTOR WHERE CLASS_NO = '" & RS1("CLASS_NO") & "'"
						RS2.Open SQL2,CONN,1,1
							DO WHILE NOT RS2.EOF 
							YY = YY & RS2("XM")
							RS2.MoveNext
							LOOP
						RS2.CLOSE 
						SQL2 = "SELECT HS_NAME FROM HOSPTIAL WHERE HS_NO = '" & RS1("HS_NO") & "'"
						RS2.Open SQL2,CONN,1,1
							DO WHILE NOT RS2.EOF 
							YY = YY & RS2("HS_NAME")
							RS2.MoveNext
							LOOP
						RS2.CLOSE 
						
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
				
						SQL = "SELECT top 1 * FROM JIBING  WHERE JB_NO = '" & RS("JB_NO") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("INFO_FIND") = ZZLB & CJZZ & YY 
					RS9.UpdateBatch 
	  				RS9.Close 
					
					
			
		RS.MoveNext
		LOOP
	RS.CLOSE 
Response.write("end")
RESPONSE.END 

SQL = "UPDATE JIBING SET INFO_FIND = ''"
CONN.Execute(SQL)
SQL = "SELECT  * FROM JIBING order by jb_no"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
			'�ҿ��� 
			M_INFO = ""
			SQL1 = "SELECT * FROM D_CLASS WHERE FD_NO = '" & RS("FD_NO") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
						POP = 0
						POP = INSTR(M_INFO,RS1("CLASS_NAME"))
							IF POP >0 THEN
							ELSE
							M_INFO = M_INFO & RS1("CLASS_NAME")
							END IF
							
							'��ҽ��
							SQL2 = "SELECT XM FROM D_DOCTOR WHERE CLASS_NO = '" & RS1("CLASS_NO") & "'"
								RS2.Open SQL2,CONN,1,1
									DO WHILE NOT RS2.EOF 
									POP = 0
									POP = INSTR(M_INFO,RS2("XM"))
										IF POP >0 THEN
										ELSE
										M_INFO = M_INFO & RS2("XM")
										END IF
									RS2.MoveNext
									LOOP
								RS2.CLOSE 
								
								'��ҽ��
							SQL2 = "SELECT HS_NAME FROM HOSPTIAL WHERE HS_NO = '" & RS1("HS_NO") & "'"
								RS2.Open SQL2,CONN,1,1
									DO WHILE NOT RS2.EOF 
									POP = 0
									POP = INSTR(M_INFO,RS2("HS_NAME"))
										IF POP >0 THEN
										ELSE
										M_INFO = M_INFO & RS2("HS_NAME")
										END IF
									RS2.MoveNext
									LOOP
								RS2.CLOSE 
							
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
					
				SQL = "UPDATE JIBING SET INFO_FIND = '" & M_INFO & "' WHERE JB_NO = '" & RS("JB_NO") & "'"
				CONN.Execute(SQL)
		RS.MoveNext
		LOOP
	RS.CLOSE 
Response.End
J = 1
SQL = "SELECT * FROM GUOLV where CH='�������ʡ�м�' AND HZF='���Ƚ�' ORDER BY HZFNUM"
	RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF 
				SQL = "INSERT INTO GUOLV (CH,ZD,HZF,QZF,HZFWZ,HZFNUM,QZFNUM) VALUES('�������ʡ�м�','MYJLQK_SS','һ�Ƚ�','" & rs("qzf") & "','��'," & J & "," & J & ")"
				CONN.Execute(SQL)
				SQL = "UPDATE GUOLV SET HZFNUM = HZFNUM + 33,QZFNUM = QZFNUM + 33 WHERE ID = " & RS("ID") & ""
				CONN.Execute(SQL)
			J = J + 1
			RS.MOVENEXT
			Loop
		RS.CLOSE 
Response.End


DIM LKK(31)
	LKK(1) = "����"
	LKK(2) = "����"
	LKK(3) = "����"
	LKK(4) = "����"
	LKK(5) = "����"
	LKK(6) = "�㶫"
	LKK(7) = "����"
	LKK(8) = "����"
	LKK(9) = "�ӱ�"
	LKK(10) = "����"
	LKK(11) = "������"
	LKK(12) = "����"
	LKK(13) = "����"
	LKK(14) = "����"
	LKK(15) = "����"
	LKK(16) = "����"
	LKK(17) = "����"
	LKK(18) = "���ɹ�"
	LKK(19) = "����"
	LKK(20) = "ɽ��"
	LKK(21) = "ɽ��"
	LKK(22) = "����"
	LKK(23) = "�Ϻ�"
	LKK(24) = "�Ĵ�"
	LKK(25) = "���"
	LKK(26) = "�½�"
	LKK(27) = "����"
	LKK(28) = "�㽭"
	LKK(29) = "����"
	J = 1
	FOR I = 1 TO 29
	SQL = "INSERT INTO GUOLV (CH,ZD,HZF,QZF,HZFWZ,HZFNUM,QZFNUM) VALUES('�������ʡ�м�','JLQK_SS','��','" & LKK(I) & "','��'," & J & "," & J & ")"
	CONN.Execute(SQL)
	
	J = J + 1
	NEXT
	
Response.End


 SQL = "SELECT * FROM JIBING "
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF 
				CJZZ = ""
				ZZLB = ""
				CJZZ = RS("CJZZ")
				POP = 0
				POP = INSTR(CJZZ,"��")
					IF POP >0 THEN
					CJZZ = MID(CJZZ,POP+1)
					END IF
				POP = 0
				POP = INSTR(CJZZ,"��")
					IF POP >0 THEN
					ZZLB = MID(CJZZ,1,POP-1)
					END IF
					SQL1="UPDATE JIBING SET ZZLB = '" & ZZLB & "' WHERE JB_NO = '" & RS("JB_NO") & "'"
					CONN.Execute(SQL1)
			RS.MoveNext
			LOOP
		RS.CLOSE 
		RESPONSE.END 
				
			

    SQL = "SELECT * FROM MY_JIBING "
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF 
				
		 
				SQL2 = "SELECT TOP 1 * FROM JIBING WHERE JB_NAME = '" & RS("��������") & "'"
					RS2.Open SQL2,CONN,1,1
						IF RS2.RecordCount >0 THEN
						ELSE
							SQL3 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("������Ӧ��������") & "'"
									RS3.Open SQL3,CONN,1,1
										IF RS3.RecordCount>0 THEN
										S_FD_NO = RS3("FD_NO")
										ELSE
										S_FD_NO= "000000"
										END IF
									RS3.CLOSE 
									
					WB_FILE_NO = "J" & ID_NAME("JB_NO")
					
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM JIBING"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
				  	RS1("P_CLASS_NO") = RS("����һ������")
					  RS1("CLASS_NO") = RS("�����������")
	  				RS1("FD_NO") = S_FD_NO
	  				RS1("jb_name") = RS("��������")
	  				RS1("info_find") = RS("��������") + RS("������Ӧ��������") 
	  				RS1("JB_NO") = WB_FILE_NO
	  				RS1("IF_HTML") = "��"
						RS1("BW") = RS("������λ")
						RS1("JB_BM") = RS("����")
						RS1("CJZZ") = RS("����֢״") 
						RS1("CJBY") = RS("��������") 
						RS1("SFCR") = RS("�Ƿ���д�Ⱦ��")
						RS1("FZPD") = RS("֢״�����ж�") 
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1.UpdateBatch 
	  				RS1.Close 
				END IF
				RS2.CLOSE 
	 RS.MoveNext
LOOP
RS.CLOSE 
%>
END 