<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%


'ȥ���ַ���ͷβ�������Ļس��Ϳո� 
function trimVBcrlf(str) 
trimVBcrlf=rtrimVBcrlf(ltrimVBcrlf(str)) 
end function 

'ȥ���ַ�����ͷ�������Ļس��Ϳո� 
function ltrimVBcrlf(str) 
dim pos,isBlankChar 
pos=1 
isBlankChar=true 
while isBlankChar 
if mid(str,pos,1)=" " then 
pos=pos+1 
elseif mid(str,pos,2)=VBcrlf then 
pos=pos+2 
else 
isBlankChar=false 
end if 
wend 
ltrimVBcrlf=right(str,len(str)-pos+1) 
end function 

'ȥ���ַ���ĩβ�������Ļس��Ϳո� 
function rtrimVBcrlf(str) 
dim pos,isBlankChar 
pos=len(str) 
isBlankChar=true 
while isBlankChar and pos>=2 
if mid(str,pos,1)=" " then 
pos=pos-1 
elseif mid(str,pos-1,2)=VBcrlf then 
pos=pos-2 
else 
isBlankChar=false 
end if 
wend 
rtrimVBcrlf=rtrim(left(str,pos)) 
end function 



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
	Response.Redirect ("doctor_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RS4 = Server.CreateObject("ADODB.RecordSet")
	set RS5 = Server.CreateObject("ADODB.RecordSet")
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%


SQL = "SELECT  * FROM D_DOCTOR WHERE ID >=7000 AND ID <7999 "
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		FIND_INFO = ""
		FIND_INFO = RS("info_find")
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & RS("HS_NO") & "'"
		RS1.Open SQL1,CONN,1,1
		IF RS1.RecordCount >0 Then
		ALICE_NAME=""
		ALICE_NAME = RS1("HS_NAME") & RS("XM")
		
		End If
		RS1.CLOSE 

		

		SQL = "UPDATE D_DOCTOR SET INFO_FIND = '" & FIND_INFO & ALICE_NAME & "' WHERE NO ='" & RS("NO") & "'"
		Response.WRITE(SQL)
	CONN.Execute(SQL)


		RS.MoveNext
		LOOP
	RS.CLOSE 

	Response.end 




sql = "delete from d_doctor_gh where w_name='ҽԺ�Һ�'"
conn.Execute(sql)
sql = "select no,xm,HS_NO from d_doctor order by no"
rs.Open sql,conn,1,1
	do while not rs.eof 
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & RS("HS_NO") & "' AND SEND_URL <>''"
			rs1.Open sql1,conn,1,1
			IF RS1.RecordCount >0 Then
		sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','ҽԺ�Һ�','" & rs1("send_url") & "')"
	  conn.Execute(sql1)
			End If
			rs1.close 

rs.MoveNext
	loop
rs.close 
response.end 

sql = "select no,xm from d_doctor order by no"
rs.Open sql,conn,1,1
	do while not rs.eof 
	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','΢ҽ','https://www.guahao.com/search?q=" & rs("xm") & "&searchType=search')"
	'conn.Execute(sql1)
	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','��ҽ160','https://so.91160.com/main/search/search_key-" & rs("xm") & ".html')"
	'conn.Execute(sql1)
	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','�Ϻ�ҽ��ԤԼƽ̨','http://yuyue.shdc.org.cn/search.action?textfields=" & rs("xm") & "')"
	'conn.Execute(sql1)

	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','�ô������','http://m.haodf.com/touch/search/search?key=" & rs("xm") & "')"
	conn.Execute(sql1)

	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','ҽ����','http://m.yihu.com')"
	conn.Execute(sql1)

	sql1 = "insert into d_doctor_gh (no,w_name,w_url ) values('" & rs("no") & "','������ԤԼ�Һ�ͳһƽ̨','http://www.bjguahao.gov.cn/index.htm')"
	conn.Execute(sql1)


	rs.MoveNext
	loop
rs.close 
response.end 



SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NO"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	SQL1 = "UPDATE D_DOCTOR SET FD_NO = '" & RS("FD_NO") & "' WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
	CONN.Execute(SQL1)
	RS.MoveNext
	LOOP
RS.CLOSE 
RESPONSE.END 
sql="select * from TTTT"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	SQL1 = "UPDATE D_DOCTOR SET USER_NAME='" & RS("PERSON") & "' WHERE XM='" & RS("XM") & "'"
	CONN.Execute(SQL1)
	RS.MoveNext
	LOOP
RS.CLOSE 

response.end 
sql = "select no from d_doctor order by no"
rs.Open sql,conn,1,1
	do while not rs.eof 
	sql = "insert into DFYSCL (NO) VALUES('" & RS("NO") & "')"
	CONN.EXECUTE(SQL)
	rs.MoveNext
	loop
rs.close 

RESPONSE.END 

sql = "select NO,XM FROM D_DOCTOR ORDER BY NO"
	rs.Open sql,conn,1,1
		do while not rs.eof 
		SQL1 = "SELECT TOP 1 NO,XM FROM D_DOCTOR WHERE XM = '" & RS("XM") & "' AND NO <>'" & RS("NO") & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
			'
			SQL2 = "UPDATE D_DOCTOR SET SFCF ='T' WHERE XM='" & RS("XM") & "'"
			CONN.Execute(SQL2)
			END IF
		RS1.CLOSE 
		rs.MoveNext
		loop
		rs.close 


response.end 




sql = "select no,XMCG_GJ from d_doctor"
	rs.Open sql,conn,1,1
		do while not rs.eof 
		
			s_XMCG_GJ=RS("XMCG_GJ")
			
			 MHY_S = ""
	 EE = split(s_XMCG_GJ,chr(13))
	 
		For EI = 0 To UBound(EE)
		
				if len(EE(EI)) >1 THEN
				
				s_XMCG_GJ=trimVBcrlf(EE(EI))
				
				MHY_S = MHY_S & s_XMCG_GJ & chr(1) & chr(13)
		'		response.Write("ffff")
				end if
		next
		

		XMCG_GJ=MHY_S



		XMCG_GJ = REPLACE(XMCG_GJ,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-size: 16px;font-family: ΢���ź�, 'Microsoft YaHei';'>",chr(13))
		XMCG_GJ = REPLACE(XMCG_GJ,"</span></p>",chr(13))
		XMCG_GJ = "<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-size: 16px;font-family: ΢���ź�, 'Microsoft YaHei';'>" & XMCG_GJ  & "</span></p>"
		response.Write XMCG_GJ
		
		
					SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & rs("NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
						RS1("XMCG_GJ") = XMCG_GJ
						RS1.UpdateBatch 
	  				RS1.Close 
		rs.MoveNext
		loop
	rs.close 
response.Write("end")
response.end 



sql = "select no,XMCG_GJ from d_doctor"
	rs.Open sql,conn,1,1
		do while not rs.eof 
				XTH="<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>"
				XTHJW = "</span></p>"
		s_XMCG_GJ = rs("xmcg_gj")
		 s_XMCG_GJ=replace(s_XMCG_GJ,chr(13),XTHJW & XTH)
		 s_XMCG_GJ = XTH & s_XMCG_GJ & XTHJW
				SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & rs("NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
						RS1("XMCG_GJ") = S_XMCG_GJ
						RS1.UpdateBatch 
	  				RS1.Close 
		rs.MoveNext
		loop
	rs.close 
response.Write("end")
response.end 

'������
sql = "select jb_name,cjzz from  jibing order by jb_no"
 rs.Open sql, conn, 1, 1
         Do While Not rs.EOF
		 M_SR = RS("JB_NAME")
			sql1 = "select no,info_find from  d_doctor where (ZLTC  like '%" & M_SR & "%'  OR XMCG_GJ  like '%" & M_SR & "%' )" 
			rs1.Open sql1, conn, 1, 1
			 Do While Not rs1.EOF
			y_info = rs1("info_find")
			 SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & rs1("no") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("INFO_FIND") = y_info & rs("cjzz")
					RS9.UpdateBatch 
	  				RS9.Close 
			rs1.MoveNext
			Loop
			rs1.Close


		rs.MoveNext
         Loop
        rs.Close
		Response.End 


sql = "select * from  d_doctor where  ysclass = '��ϯ�о�ѧ��'"
 rs.Open sql, conn, 1, 1
         Do While Not rs.EOF
			sql1 = "select top 1 * from hosptial where hs_no = '" & rs("hs_no") & "' and hs_name like '%��%'"
			rs1.Open sql1, conn, 1, 1
				IF RS1.RecordCount>0 Then
				else
				sql1 = "update d_doctor set ysclass = '��ϯ��ҽ��' where no = '" & rs("no") & "'"
				  conn.Execute (sql1)
				End If
				rs1.close 
         rs.MoveNext
         Loop
        rs.Close
		Response.End 

      sql = "SELECT no from d_doctor where zyxy like '%��%'"
         rs.Open sql, conn, 1, 1
         Do While Not rs.EOF
         sql1 = "update d_fenshu set num = num * 0.8 where no = '" & rs("no") & "'"
         conn.Execute (sql1)
         rs.MoveNext
         Loop
        rs.Close
        
    '��������
    i = 1
     
        sql = "SELECT distinct num FROM D_fenshu order by num desc"
         rs.Open sql, conn, 1, 1
         Do While Not rs.EOF
            
           
             sql1 = "SELECT no from d_fenshu where num = " & rs("num") & ""
                RS1.Open sql1, conn, 1, 1
                Do While Not RS1.EOF
                    sql2 = "update d_doctor set jci_qg_pm = " & i & " where no = '" & RS1("no") & "'"
                    conn.Execute (sql2)
                RS1.MoveNext
                Loop
            RS1.Close
         i = i + 1
         rs.MoveNext
         Loop
        rs.Close

RESPONSE.END 


SQL = "SELECT TYPE,hs_no FROM HOSPTIAL"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		SQL = "UPDATE D_DOCTOR SET ZYXY = '" & RS("TYPE") & "' WHERE HS_NO = '" & RS("HS_NO") & "'"
		CONN.Execute(SQL)
			RS.MoveNext
					LOOP
				RS.CLOSE 
	RESPONSE.END 

J = 1
SQL  = "SELECT DISTINCT ID,M_STATE FROM D_STATE ORDER BY ID "
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
			Response.Write("#" & rs("m_state") & "#:")
			Response.Write("[<br>")
			SQL1 = "SELECT * FROM D_STATE WHERE M_STATE = '" & RS("M_STATE") & "'"
				RS1.Open SQL1,CONN,1,1
					DO WHILE NOT RS1.EOF 
					Response.Write("[")
					Response.Write("#" & rs1("m_CITY") & "#,<br>10000" & J & "<br>")
					Response.Write("],<br>")
					J =J + 1
					RS1.MoveNext
					LOOP
				RS1.CLOSE 
			Response.Write("],<br>")
			
		RS.MoveNext
		LOOP
	RS.CLOSE 
	RESPONSE.END 
'ҽ������
SQL = "SELECT * FROM D_CLASS"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		SQL1 = "UPDATE D_DOCTOR SET QG_PM = " & RS("QG_PM") & " WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
		CONN.Execute(SQL1)
		RS.MoveNext
		LOOP
	RS.CLOSE 
RESPONSE.END 

'��Ŀ�ɹ�
	SQL = "SELECT * FROM MY_DOCTOR ORDER BY ҽ������"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				MYXMCG = ""
				MYXMCG = RS("��Ŀ�ɹ�1") & RS("��Ŀ�ɹ�2") & RS("��Ŀ�ɹ�3") & RS("��Ŀ�ɹ�4")
				MYXMCG = replace(MYXMCG,"'","")
				SQL1 = "UPDATE D_DOCTOR SET XMCG_GJ ='" & MYXMCG & "' WHERE XM = '" & replace(RS("ҽ������")," ","") & "'"
				CONN.Execute(SQL1)
			RS.MoveNext
			LOOP
		RS.CLOSE 
RESPONSE.END 


'ҽ������

	SQL = "SELECT * FROM D_DOCTOR ORDER BY XM"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
				SQL1 = "UPDATE D_DOCTOR SET INFO_FIND ='" & MID(RS("INFO_FIND"),2) & "' WHERE ID = " & RS("ID") & ""
				CONN.Execute(SQL1)
			RS.MoveNext
			LOOP
		RS.CLOSE 
RESPONSE.END 
	SQL = "SELECT * FROM D_CLASS"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF 
				SQL1 = "UPDATE D_DOCTOR SET BD_PM = " & RS("BD_PM") & ",QG_PM = " & RS("QG_PM") & " WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
				CONN.Execute(SQL1)
			RS.MoveNext
			LOOP
		RS.CLOSE 

Response.end 

    	SQL = "SELECT * FROM MY_DOCTOR order by ҽ������"
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
				SQL1 = "UPDATE D_DOCTOR SET SHRY = '" & RS("�������") & "' WHERE XM = '" & RS("ҽ������") & "'"
				CONN.Execute(SQL1)
				RS.MoveNext
				LOOP
			RS.CLOSE 
		
		Response.end 

	'���ж�һ�����ҽԺ�����ڿ������ݱ��Ƿ����


		SQL = "SELECT * FROM MY_DOCTOR order by ҽ������"
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
					'���жϿ���
					IF RS("��������") <> "" THEN
						SQL1 = "SELECT * FROM D_CLASS WHERE CLASS_NAME = '" & RS("ҽԺ") & "-" & RS("һ������") & "-" & RS("��������") & "'"
					ELSE
						SQL1 = "SELECT * FROM D_CLASS WHERE CLASS_NAME = '" & RS("ҽԺ") & "-" & RS("һ������") & "'"
					END IF
						RS1.Open SQL1,CONN,1,1
							IF RS1.RecordCount>0 THEN
							S_CLASS_NO = RS1("CLASS_NO")
							ELSE
							S_CLASS_NO = "000000"
							END IF
						RS1.CLOSE 
						
				SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("ҽԺ") & "'"
					RS1.Open SQL1,CONN,1,1
						IF RS1.RecordCount >0 THEN
						S_HS_NO = RS1("HS_NO")
						ELSE
						S_HS_NO = "000000"
						END IF
					RS1.CLOSE 
					



					SQL2 = "SELECT TOP 1 * FROM D_DOCTOR WHERE XM = '" & RS("ҽ������") & "' and hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "'"
				RS2.Open SQL2,CONN,adOpenKeyset ,adLockReadOnly
					IF RS2.RecordCount >0 THEN
						ELSE
						
				WB_FILE_NO = ID_NAME("DOCTOR_NO")
			
					
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM D_DOCTOR"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("XM") = replace(RS("ҽ������")," ","")
	  				RS1("hs_no") = s_hs_no
						RS1("DQ") = RS("����")
						RS1("ZW") = RS("����ְ��")
						RS1("ZCH") = RS("����ְ��")
						RS1("ZC") = RS("ѧ��ְ��")
						RS1("XS") = RS("ѧ���ƺ�")
						'RS1("RYCH") = RS("ѧ���ƺ�")
						'RS1("XZZW") = RS("����ְ��")
						RS1("EDU_OTHERS") = RS("ѧ��������")
						RS1("JBXTA") = RS("��Ӧ������λ1")
						RS1("JBXTB") = RS("��Ӧ������λ2")
						RS1("JBXTC") = RS("��Ӧ������λ3")
						'RS1("CJ") = RS("��Ŀ�ɹ�1") & RS("��Ŀ�ɹ�2") & RS("��Ŀ�ɹ�3") & RS("��Ŀ�ɹ�4")
						'RS1("ZLAL") = ""
						'RS1("ZXDT") = RS("��Ҫ����")
						RS1("ZLJD") = RS("���ƽ׶�")
						RS1("ZLFS") = RS("���Ʒ�ʽ")
						RS1("ZLTC") = RS("ҽѧר�������س�")
						RS1("KYFX") = RS("ҽѧר�����з���")
						'RS1("CJRY") = RS("CJRY")
						'RS1("SHZW") = RS("�������")
						RS1("JCIPS") = RS("JCI����")
						RS1("YSGS") = RS("ҽ������")
						RS1("YSCLASS") = RS("ҽ�����")
						RS1("GJLY_RZ") = RS("�������������ְ")
						RS1("GJLY_JX") = RS("����������ʽ���")
						RS1("GJLY_XS") = RS("��������ѧ���")
						RS1("XSZW_GJA") = RS("ѧ��ְ����Ҽ�")
						RS1("XSZW_SS") = RS("ѧ��ְ��ʡ�м�")
						RS1("XSZW_YX") = RS("ѧ��ְ��ԺУ��")
						RS1("XSZW_ZZ") = RS("ѧ��ְ����־��ְ")
						RS1("XMCG_GJ") = RS("��Ŀ�ɹ�1")
						RS1("XMCG_GJA") = RS("��Ŀ�ɹ�2")
						RS1("XMCG_SS") = RS("��Ŀ�ɹ�3")
						RS1("XMCG_YX") = RS("��Ŀ�ɹ�4")
						RS1("JLQK_GJA") = RS("��������Ҽ�")
						RS1("JLQK_SS") = RS("�����ʡ�м�")
						RS1("JLQK_YX") = RS("�����ԺУ��")
						RS1("JLQK_QT") = RS("���������")
						RS1("ZYLZ") = RS("��Ҫ������Ҫ����")
						RS1("LWFB") = RS("��Ҫ�������ķ���")
						RS1("BLBW") = RS("��������")
						RS1("ZYBD") = RS("��Ҫ����")
						RS1("ZYXY") = RS("��ҽ��ҽ")
						RS1("JBMCA") = RS("��������1")
						RS1("JBMCB") = RS("��������2")
						RS1("JBMCC") = RS("��������3")
						RS1("ZXLY") = RS("��Ѷ��Դ")
						RS1("ZLLY") = RS("������Դ")
						RS1("RWGS") = RS("�������")
						RS1("info_find") = s_info_find & "," & DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME") & "," & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
	  				RS1("info_corre") = s_info_corre
	  				RS1("NO") = "D" & WB_FILE_NO
	  				RS1("IF_HTML") = "��"
						RS1("ZP") = s_zp
					'	RS1("ADDR") = s_addr
						RS1("BD_PM") = 0
						RS1("QG_PM") = 0
						RS1("USER_NAME") = "leon"
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				
				END IF
				RS2.Close 
			RS.MoveNext
			LOOP
		RS.CLOSE 
%>
end 