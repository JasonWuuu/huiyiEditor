<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询结果
'操作：本脚本任何人操作，原则上是自己删除自己的记录

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
	SQL1 = "INSERT INTO D_GHPT (NAME,URL,IMG,CLASS,NUM,AREA) VALUES('" & RS("HS_NAME") & "','" & URL & "','" & RS("IMG") & "','医院官方'," & I & ",'" & MID(RS("AREA"),1,2) & "')"
	response.Write(sql1)
	'CONN.Execute(SQL1)
	I = I + 1
	RS.MoveNext
	LOOP
RS.CLOSE 
Response.end 
SQL3 = "SELECT DISTINCT 字段名称 FROM TEST"
	RS3.Open SQL3,CONN,1,1
	DO WHILE NOT RS3.EOF
SQL = "SELECT * FROM TEST WHERE 字段名称 = '" & RS3("字段名称") & "'"
	RS.Open SQL,CONN,1,1
	I = 1
		DO WHILE NOT RS.EOF
			
					'增加记录
	  		SQL2 = "SELECT TOP 1 * FROM GUOLV WHERE CH = '" & RS("字段名称") & "' AND QZF='" & RS("前字符") & "' AND HZF='" & RS("后字符") & "'"
			RS2.Open SQL2,CONN,1,1
				IF RS2.RecordCount >0 THEN
				
				Else
				
	  				SQL = "SELECT top 1 * FROM GUOLV"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CH") = RS("字段名称")
	  				RS1("QZF") = RS("前字符")
	  				RS1("HZF") = RS("后字符")
					RS1("HZFNUM") = I 
					RS1("QZFNUM") = I
	  				RS1("QZFWZ") = "截止"
					RS1("HZFWZ") = "截止"
	  				
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

		SQL = "SELECT * FROM my_hosptial where 医院名称 like '%（%' "
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
					POP = INSTR(RS("医院名称"),"（")
						IF POP >0 THEN
						
						X_CLASS_NAME = MID(RS("医院名称"),1,POP-1)
						B_CLASS_NAME = MID(RS("医院名称"),POP+1)
						MYLEN = LEN(B_CLASS_NAME)
						B_CLASS_NAME = MID(B_CLASS_NAME,1,MYLEN-1)
						ELSE
						X_CLASS_NAME = RS("医院名称")
						B_CLASS_NAME = ""
						END IF
					
					  SQL1 = "UPDATE HOSPTIAL SET HS_NAME = '" & X_CLASS_NAME & "',ALICE_NAME='" & B_CLASS_NAME & "' WHERE URL = '" & RS("医院官网") & "'"
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
	
	
	
	
		SQL2 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("医院名称") & "'"
			RS2.Open SQL2,CONN,1,1
				IF RS2.RecordCount >0 THEN
				
				ELSE
				response.Write(RS("电话"))
				response.Write("<br>")
	response.Write(RS("医院名称"))
				response.Write("<hr>")
		WB_FILE_NO = ID_NAME("HS_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM HOSPTIAL"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("scjb") = ""
	  				RS1("hs_name") = RS("医院名称")
	  				RS1("hs_desc") = ""
						RS1("info_find") = RS("医院名称")
	  				RS1("info_corre") = ""
	  				RS1("HS_NO") = WB_FILE_NO
	  				RS1("IF_HTML") = "否"
						RS1("URL") = RS("医院官网")
						RS1("bd_pm") = RS("综合排名")
						RS1("qg_pm") = RS("综合排名")
						RS1("AREA") = RS("地区")
						RS1("YY_FS") = RS("医院所属高校")
						RS1("YY_DJ") = RS("医院等级")
						RS1("PROPERTY") = RS("经营性质")
						RS1("SF_TROOPS") = RS("部队医院否部队")
						RS1("ZHMODE") = RS("综合专科")
						RS1("TYPE") = RS("医种")
						RS1("SEND_URL") = RS("挂号链接")
						RS1("ADDRESS") = RS("地址")
						RS1("TEL") = RS("电话")
						RS1("BJ_BD_PM") = 0
						RS1("BJ_QG_PM") = 0
						RS1("JCI_BD_PM") = 0
						RS1("JCI_QG_PM") = 0
						RS1("USER_NAME") = "leon"
						RS1.UpdateBatch 
	  				RS1.Close 
						SQL = "UPDATE HOSPTIAL SET INFO_FIND= '" & RS("医院名称") & "-" & RS("地区") & "-" & RS("医院所属高校") & "-" & RS("医院等级") & "'"
						CONN.Execute(SQL)
		END IF
		RS2.CLOSE 
			RS.MoveNext
			LOOP
		RS.CLOSE 
		
		SQL = "update HOSPTIAL set IF_HTML='否'"
		CONN.Execute(SQL)
		
	
%>
END 