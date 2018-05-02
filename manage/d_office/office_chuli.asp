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
	Response.Redirect ("office_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
	 SQL = "SELECT * FROM YYKS"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF

				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("KS") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("KS") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = RS("PM")
						RS1("QG_PM") = RS("PM")
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 	
			
	RESPONSE.END 
	
	SQL = "SELECT * FROM YYKS WHERE B <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("B") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("B") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "2"
						RS1("QG_PM") = "2"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
			RS.CLOSE 
	
	SQL = "SELECT * FROM YYKS WHERE C <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("C") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("C") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "3"
						RS1("QG_PM") = "3"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
		SQL = "SELECT * FROM YYKS WHERE D <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("D") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("D") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "4"
						RS1("QG_PM") = "4"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
		
		SQL = "SELECT * FROM YYKS WHERE E <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("E") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("E") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "5"
						RS1("QG_PM") = "5"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
			
		SQL = "SELECT * FROM YYKS WHERE F <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("F") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("F") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "6"
						RS1("QG_PM") = "6"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
			SQL = "SELECT * FROM YYKS WHERE G <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("G") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("G") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "7"
						RS1("QG_PM") = "7"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
		
			SQL = "SELECT * FROM YYKS WHERE H <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("H") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("H") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "8"
						RS1("QG_PM") = "8"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
		
			SQL = "SELECT * FROM YYKS WHERE I <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("I") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("I") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "9"
						RS1("QG_PM") = "9"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
				SQL = "SELECT * FROM YYKS WHERE J <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("J") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("J") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "10"
						RS1("QG_PM") = "10"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
		
		
				SQL = "SELECT * FROM YYKS WHERE TM <>''"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				'医院名称
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("YY") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						S_HS_NO = RS1("HS_NO")
						END IF
					RS1.CLOSE 
				'先查复旦科室
				SQL1 = "SELECT TOP 1 * FROM FD_CLASS WHERE FD_NAME = '" & RS("TM") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount>0 THEN
						FD_NO = RS1("FD_NO")
						END IF
					RS1.CLOSE 
				'科室编号
				
			
				SQL3 = "SELECT  * FROM D_CLASS WHERE FD_NO = '" & FD_NO & "' AND CLASS_NAME LIKE '" & RS("YY") & "%' AND P_CLASS_NO = CLASS_NO"
					RS3.Open SQL3,CONN,1,1
					
					DO WHILE NOT RS3.EOF 
					
					S_CLASS_NO = RS3("CLASS_NO")
					
					'判断是否重复
					SQL2 = "SELECT TOP 1 * FROM D_OFFICE WHERE HS_NO = '" & S_HS_NO & "' AND CLASS_NO = '" & S_CLASS_NO & "'"
						RS2.Open SQL2,CONN,1,1
							IF RS2.RecordCount >0 THEN
							ELSE

					WB_FILE_NO = ID_NAME("OFFICE_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") =  RS("TM") & "," & DISPLAY_NAME("D_CLASS",s_class_no,"class_no","class_name")
	  				RS1("info_corre") = s_info_corre
	  				RS1("IF_HTML") = s_if_html
						RS1("BD_PM") = "11"
						RS1("QG_PM") = "11"
						RS1("office_NO") = WB_FILE_NO
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				END IF
						RS2.CLOSE 
					RS3.MoveNext
					LOOP
				RS3.CLOSE 
					
			
			RS.MoveNext
			LOOP
		RS.CLOSE 		
%>
