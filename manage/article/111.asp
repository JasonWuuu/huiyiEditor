RESPONSE.END 

SQL = "SELECT  * FROM A_ARTICLE WHERE CLASS_NO  LIKE 'A104%' AND SP_URL_OUT ='' AND RE_DATE>='2017-1-1' AND RE_DATE<'2017-3-1' ORDER BY INFO_NO "
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	
	INFO_DESC = RS("INFO_DESC")
	
'	INFO_DESC =REPLACE(INFO_DESC,"<p style='text-indent:2em;text-align:justify;line-height:1.5em;margin-bottom:15px;margin-top:15px;'><span style='color:rgb(0,0,0);font-family:微软雅黑,'Microsoft YaHei';'>","22")
'	INFO_DESC =REPLACE(INFO_DESC,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>","22")
	POP = 0
	POP = INSTR(INFO_DESC,"<a href=")
	IF POP >0 THEN

	INFO_DESC = MID(INFO_DESC,POP+9)

	POP1 = 0 
	POP1 = INSTR(INFO_DESC,">")
				IF POP1 >0 THEN
				
				INFO_DESC = MID(INFO_DESC,1,POP1-1)
				
				END IF
	
	END IF
	
	INFO_DESC = REPLACE(INFO_DESC,"""","")
	INFO_DESC = REPLACE(INFO_DESC,"'","")
	SQL1 = "UPDATE A_ARTICLE SET SP_URL_OUT = '" & MID(INFO_DESC,1,200) & "' WHERE INFO_NO = '" & RS("INFO_NO") & "' AND SP_URL_OUT=''"
	CONN.Execute(SQL1)
	RS.MoveNext
	LOOP
RS.CLOSE 

RESPONSE.END 


'
SQL = "SELECT * FROM A_CLASS WHERE JIBIE = 1 ORDER BY CLASS_NO"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
		HLB = MID(RS("CLASS_NO"),2,2)
		XHLB = "2" & HLB
		SQL1 = "SELECT * FROM A_ARTICLE WHERE  LEFT(CLASS_NO,3) = '1" & HLB & "'"
		RS1.Open SQL1,CONN,1,1
			DO WHILE NOT RS1.EOF
		SQL2 = "UPDATE A_ARTICLE SET CLASS_NO = 'B" & XHLB & MID(RS1("CLASS_NO"),4,4)   & "' WHERE INFO_NO = '" & RS1("INFO_NO") & "'"
		'response.Write (sql2)
		conn.Execute(sql2)
		RS1.MoveNext
		LOOP
		RS1.CLOSE 
		
	RS.MoveNext
	LOOP
RS.CLOSE 

RESPONSE.END 



SQL = "SELECT INFO_NO,INFO_DESC FROM A_ARTICLE WHERE INFO_DESC LIKE '%text-indent:2em;text-align:justify;line-height:1.5em;margin-bottom:15px%'"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	INFO_DESC = ""
		INFO_DESC=RS("INFO_DESC")
		INFO_DESC = REPLACE(INFO_DESC,"<p style='text-indent:2em;text-align:justify;line-height:1.5em;margin-bottom:15px;margin-top:15px;'><span style='color:rgb(0,0,0);font-family:微软雅黑,'Microsoft YaHei';'>因版权问题，此视频无法直接播放，请点击以下链接去官网观看。","")

		SQL = "SELECT top 1 * FROM A_ARTICLE WHERE INFO_NO='" & RS("INFO_NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  				RS1("info_desc") = INFO_DESC
						RS1.UpdateBatch 
	  				RS1.Close 
					
		
	RS.MoveNext
	LOOP
RS.CLOSE 

RESPONSE.END 

SQL = "SELECT * FROM A_CLASS"
	RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF 
				SQL1 = "UPDATE A_ARTICLE SET INFO_CORRE = '" & RS("CLASS_NAME") & "' WHERE CLASS_NO = '" & RS("CLASS_NO") & "' AND INFO_CORRE='无'"
				conn.execute(sql1)
				RS.MoveNext
				LOOP
			RS.CLOSE 
	RESPONSE.END 		

SQL = "SELECT TOP 1 INFO_DESC FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("NO") & "'"
RS.Open SQL,CONN,1,1
	IF RS.RecordCount >0 THEN
	MYDESC = RS("INFO_DESC")
	END IF
RS.CLOSE 
XGNR = ""
    SQL = "SELECT NO,XM,CLASS_NO,HS_NO FROM D_DOCTOR ORDER BY NO "
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF 
				POP = 0
					POP = INSTR(MYDESC,RS("XM"))
						IF POP >0 THEN
						XGNR = XGNR & RS("NO") & "-"
							POP1 = 0
							POP1 = INSTR(XGNR,RS("CLASS_NO"))
							IF POP1 >0 THEN
								ELSE
								XGNR = XGNR & RS("CLASS_NO") & "-"
							END IF
							POP1 = 0
							POP1 = INSTR(XGNR,RS("HS_NO"))
							IF POP1 >0 THEN
								ELSE
								XGNR = XGNR & RS("HS_NO") & "-"
							END IF
						END IF
				
				RS.MoveNext
				LOOP
			RS.CLOSE 
		
		SQL = "UPDATE A_ARTICLE SET XGNR = '" & XGNR & "' WHERE INFO_NO = '" & REQUEST("NO") & "'"
		CONN.Execute(SQL)
		RESPONSE.END 