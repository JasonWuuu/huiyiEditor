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
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

SQL = "SELECT  * FROM D_CLASS where id >4000 and id <=4999"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		FIND_INFO = ""
		'FIND_INFO = RS("FIND_INFO")
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & RS("HS_NO") & "'"
		RS1.Open SQL1,CONN,1,1
		IF RS1.RecordCount >0 Then
		ALICE_NAME=""
		ALICE_NAME = RS1("HS_NAME") & RS1("ALICE_NAME")
		
		End If
		RS1.CLOSE 

		JB = ""
			SQL1 = "SELECT JB_NAME FROM JIBING WHERE FD_NO = '" & rs("fd_no") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					JB = JB & RS1("JB_NAME")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
					'医生
				YS = ""
				SQL1 = "SELECT XM FROM D_DOCTOR WHERE CLASS_NO='" & RS("CLASS_NO") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					YS = YS & RS1("XM")
					RS1.MoveNext
					LOOP
				RS1.CLOSE 

		SQL = "UPDATE D_CLASS SET FIND_INFO = '" & JB & YS & ALICE_NAME & "' WHERE CLASS_NO ='" & RS("CLASS_NO") & "'"
		Response.WRITE(SQL)
		CONN.Execute(SQL)


		RS.MoveNext
		LOOP
	RS.CLOSE 

	Response.end 


'去掉医院

		SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NO "
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
					POP = INSTR(RS("CLASS_NAME"),"-")
						X_CLASS_NAME = MID(RS("CLASS_NAME"),POP+1)
						SQL1 = "UPDATE D_CLASS SET CLASS_NAME = '" & X_CLASS_NAME & "' WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
						CONN.Execute(SQL1)
						Response.Write(X_CLASS_NAME)
						Response.Write("<br>")
				RS.MoveNext
				LOOP
			RS.CLOSE 
  RESPONSE.end  
		 P_CLASS_NO = request("class_no")
		 s_class_name =  request("class_name")
		 s_num = request("num")
		 s_fd_no = request("fd_no")
		
	
			SQL = "SELECT * FROM MY_CLASS where 二级科室 <>''"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						SQL1 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NAME = '" & RS("所属医院") & "-" & RS("一级科室") & "-" & RS("二级科室") & "'"
							RS1.Open SQL1,CONN,1,1
								IF RS1.RecordCount >0 THEN
									'已经存在
									ELSE
									'复旦科室
									SQL2 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("复旦报告科室分类") & "'"
									RS2.Open SQL2,CONN,1,1
										IF RS2.RecordCount>0 THEN
										S_FD_NO = RS2("FD_NO")
										END IF
									RS2.CLOSE 
									
										'查询医院数据库
									SQL2 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("所属医院") & "'"
									RS2.Open SQL2,CONN,1,1
										IF RS2.RecordCount>0 THEN
										HS_NO = RS2("HS_NO")
										END IF
									RS2.CLOSE 
									pm = 0
							
									
									'大类别
									SQL2 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NAME = '" & RS("所属医院") & "-" & RS("一级科室") & "'"
										RS2.Open SQL2,CONN,1,1
											IF RS2.RecordCount >0 THEN
											P_CLASS_NO = RS2("CLASS_NO")
											END IF
										RS2.CLOSE 
										S_CLASS_NO = id_name("CLASS_B")
										S_CLASS_NO = P_CLASS_NO & S_CLASS_NO
										SQL2 = "INSERT INTO D_CLASS (P_CLASS_NO,CLASS_NO,CLASS_NAME,NUM,JIBIE,FD_NO,HS_NO,BD_PM,QG_PM) VALUES('" & P_CLASS_NO & "','" & S_CLASS_NO & "','" & RS("所属医院") & "-" & RS("一级科室") & "-" & RS("二级科室") & "',0,2,'" & S_FD_NO & "','" & HS_NO & "'," & PM & "," & PM & ")"
									CONN.Execute(SQL2)
								END IF
							RS1.CLOSE 
		RS.MoveNext
		LOOP

%>
END 