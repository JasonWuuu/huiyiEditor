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
	set RS6 = Server.CreateObject("ADODB.RecordSet")
	set RS7 = Server.CreateObject("ADODB.RecordSet")
	set RS8 = Server.CreateObject("ADODB.RecordSet")
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    dim lk(100)
	 DIM KM(100)
		
		sql = "select * from d_doctor where no = '" & request("no") & "'"
		rs.Open sql,conn,1,1
			if rs.RecordCount>0 then
			 MYINPUT =  MYINPUT &  rs("ysgs") & rs("zltc") & rs("kyfx") & rs("GJLY_RZ") & rs("GJLY_JX") & rs("GJLY_XS") & rs("XSZW_GJA") & rs("XSZW_SS") & rs("XSZW_YX") & rs("XSZW_ZZ") & ""
			 MYINPUT = MYINPUT & rs("XMCG_GJ") & rs("JLQK_GJA") & rs("JLQK_SS") & rs("JLQK_YX") & rs("JLQK_QT") & rs("ZYLZ") & rs("LWFB") & rs("BLBW") & rs("ZYBD") & rs("SHRY") & rs("worktime")
			MYINPUT = MYINPUT & RS("EDU_OTHERS") & RS("ZXLY") & RS("ZLLY")
		KM(11) = RS("YSGS")
			KM(10) = RS("ZLTC")
			KM(5) = RS("KYFX")
			KM(4) = RS("GJLY_RZ")
			KM(3) = RS("GJLY_JX")
			KM(25) = RS("GJLY_XS")
			KM(6) = RS("XSZW_GJA")
			KM(7) = RS("XSZW_SS")
			KM(8) = RS("XSZW_YX")
			KM(9) = RS("XSZW_ZZ")
			KM(21) = RS("XMCG_GJ")
			KM(14) = RS("JLQK_GJA")
			KM(15) = RS("JLQK_SS")
			KM(16) = RS("JLQK_YX")
			KM(2) = RS("ZYLZ")
			KM(13) = RS("LWFB")
			KM(23) = RS("BLBW")
			KM(22) = RS("ZYBD")
			KM(18) = RS("SHRY")
			KM(12) = RS("WORKTIME")
			KM(17) = RS("EDU_OTHERS")
			KM(19) = RS("ZXLY")
			KM(20) = RS("ZLLY")
			
			
			end if
			rs.close 
	'	 s_xm =  request("xm")
	'	 MYINPUT = request("yuanwen")
		 MYINPUT = Replace(MYINPUT, Chr(13), "#")
		 MYINPUT = Replace(MYINPUT, Chr(10), "#")  
                          MYINPUT = Replace(MYINPUT, "#", "��")
                          MYINPUT = Replace(MYINPUT, "��", "��")
                          MYINPUT = Replace(MYINPUT, "��", "��")
                          MYINPUT = Replace(MYINPUT, "��", "��")
							'	  MYINPUT = Replace(MYINPUT, ".", "��")
								  MYINPUT = Replace(MYINPUT, ";", "��")
								  MYINPUT = Replace(MYINPUT, ",", "��")
								 MYINPUT = Replace(MYINPUT, " ", "")
								 
								 
								  SQL = "DELETE FROM GUOLV_NR"
								  CONN.Execute(SQL)
  EE = Split(MYINPUT, "��")
            For EI = 0 To UBound(EE)
							  SQL = "INSERT INTO GUOLV_NR (NR) VALUES('" & REPLACE(EE(EI),CHR(20),"") & "')"
								CONN.Execute(SQL)
						  NEXT
				SQL = "DELETE FROM GUOLV_NR WHERE NR = ''"
				CONN.Execute(SQL)
 
	sql = "DELETE FROM D_DOCTOR_LINSHI WHERE XM='" & s_xm & "'"
  conn.Execute (sql)
  
    LK(1) = "MYZCH"
    LK(2) = "MYXS"
    LK(3) = "MYZC"
                
                
                
                        For i = 1 To 3
                         sql = "DELETE FROM GUOLV_ZDNR WHERE ZD = '" & LK(i) & "'"
                            conn.Execute (sql)
                            
                      '  Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV WHERE ZD = '" & LK(i) & "' ORDER BY LEN(HZF) DESC"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                            Do While Not rs.EOF
                         
                      
  '�Ȱ���#���зָ�
   ' AA = Split(MYINPUT, "#")
   ' For AI = 0 To UBound(AA)
     '���ա����зָ�
    ' BB = Split(AA(AI), "��")
    ' For BI = 0 To UBound(BB)
        '���գ����зָ�
       ' CC = Split(BB(BI), "��")
       ' For CI = 0 To UBound(CC)
            '���գ����зָ�
         '   DD = Split(CC(CI), "��")
         '   For DI = 0 To UBound(DD)
            '���ս��зָ�
          '  EE = Split(DD(DI), "��")
          '  For EI = 0 To UBound(EE)
                
                EE = Split(MYINPUT, "��")
            For EI = 0 To UBound(EE)
                
           
  
				  
                                If rs("QZF") = "��" Then
                                '���ַ�
                                    POP = 0
                                    POP = InStr(EE(EI), rs("HZF"))
                                    If POP > 0 Then
                                          LSTH = LSTH & " " & rs("HZF")
                                                '����ʣ����ַ���
                                    
                                     sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LK(i) & "','" & rs("HZF") & "')"
                                     conn.Execute (sql)
                                    End If
                                Else
                                'ǰ
                               response.Write ("û����ǰ�ַ�����")
                               response.end 
                                End If
                          
                        
                     
              Next
                
         '   Next DI
     '   Next CI
    ' Next BI
   ' Next AI
  
    rs.MoveNext
    Loop
    rs.Close
   
    Next
                
                
  '�����������ֶ�
  
  Dim LM(30)
Dim MM(30) 
DIM KK(100)
LM(1) = "MYZW"
LM(2) = "MYZYLZ"
LM(3) = "MYGJLY_JX"
LM(4) = "MYGJLY_RZ"
LM(5) = "MYKYFX"
LM(6) = "MYXSZW_GJA"
LM(7) = "MYXSZW_SS"
LM(8) = "MYXSZW_YX"
LM(9) = "MYXSZW_ZZ"
LM(10) = "MYZLTC"
LM(11) = "MYRWGS"
LM(12) = "MYWORKTIME"
LM(13) = "MYLWFB"
LM(14) = "MYJLQK_GJA"
LM(15) = "MYJLQK_SS"
LM(16) = "MYJLQK_YX"
LM(17) = "MYEDU_OTHERS"
LM(18) = "MYSHRY"
LM(19) = "MYZXLY"
LM(20) = "MYZLLY"
LM(21) = "MYXMCG_GJ"
LM(22) = "MYZYBD"
LM(23) = "MYBLBW"
LM(24) = "MYJLQK_QT"
LM(25) = "MYGJLY_XS"

  
      For J = 1 To 22
                         sql = "DELETE FROM GUOLV_ZDNR WHERE ZD = '" & LM(J) & "'"
                            conn.Execute (sql)
                            
                      '  Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV WHERE ZD = '" & LM(J) & "' ORDER BY LEN(HZF) DESC"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                            Do While Not rs.EOF
                           
                           
                            
  '�Ȱ���#���зָ�
   ' AA = Split(MYINPUT, "#")
   ' For AI = 0 To UBound(AA)
     '���ա����зָ�
    ' BB = Split(AA(AI), "��")
    ' For BI = 0 To UBound(BB)
        '���գ����зָ�
      '  CC = Split(BB(BI), "��")
      '  For CI = 0 To UBound(CC)
            '���գ����зָ�
          '  DD = Split(CC(CI), "��")
          '  For DI = 0 To UBound(DD)
             '���գ����зָ�
          '  EE = Split(DD(DI), "��")
          '  For EI = 0 To UBound(EE)
                
                    EE = Split(MYINPUT, "��")
            For EI = 0 To UBound(EE)
            
            
                '������ʼ
                
                If Replace(rs("QZF"), " ", "") = "��" Then
                '�жϺ��ַ����ֶ�
                    POP = 0
                    POP = InStr(EE(EI), rs("HZF"))
                    LSTEN = Len(rs("HZF"))
                    If POP > 0 Then
                      '���ַ�֮ǰ��
                     ' MYNR = Mid(EE(EI), 1, POP + LSTEN)
                     ' sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & MYNR & "')"
											sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" &  replace(EE(EI),chr(32),"") & "')"
                      conn.Execute (sql)
                    End If
                    'POP >0
                    
                 Else
                 'RS("QZF") <> ""
                    '���жϺ��ַ��Ƿ�Ϊ��
                    If Replace(rs("HZF"), " ", "") = "��" Then
                    '���Ϊ��
                         POP = 0
                            POP = InStr(EE(EI), rs("QZF"))
                             If POP > 0 Then
                              '���ַ�֮ǰ��
                              MYNR = Mid(EE(EI), POP)
                              'sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & MYNR & "')"
															sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & replace(EE(EI),chr(32),"") & "')"
                              conn.Execute (sql)
                            End If
                            'POP >0
                    Else
                    '���ַ���ǰ�ַ�����Ϊ��
                            '���ж�ǰ�ַ�
                            POP = 0
                            POP = InStr(EE(EI), rs("QZF"))
                             If POP > 0 Then
                             LSZFC = Mid(EE(EI), POP)
                             '�������ַ��Ƿ���ڣ�������ڣ����Ǻϸ��
                             POP1 = 0
                             POP1 = InStr(LSZFC, rs("HZF"))
                                If POP1 > 0 Then
                                LSTEN = Len(rs("HZF"))
                                MYNR = Mid(LSZFC, 1, POP1 + LSTEN)
                                'sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & MYNR & "')"
																sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & replace(EE(EI),chr(32),"") & "')"
                                conn.Execute (sql)
                                End If
                                'POP1 >0
                             End If
                             'POP >0
                    End If
                    '���ַ������ж�
                
                 End If
                 'RS("QZF") = ""
              
                '��������
                Next
       '     Next DI
    '    Next CI
   '  Next BI
  '  Next AI
  
    rs.MoveNext
    Loop
    rs.Close
   
    Next
    
    '�������
    sql = "DELETE FROM GUOLV_QUEDING"
    conn.Execute (sql)
    sql = "INSERT INTO GUOLV_QUEDING SELECT DISTINCT ZD,NR,ZT FROM GUOLV_ZDNR"
    conn.Execute (sql)
   '   Set rs = New Recordset
        sql = "SELECT * FROM GUOLV_QUEDING order by LEN(NR) DESC"
         rs.Open sql, conn, 1, 1
            Do While Not rs.EOF
             '    Set RS1 = New Recordset
                 sql1 = "SELECT TOP 1 * FROM GUOLV_QUEDING WHERE ZD='" & rs("ZD") & "' AND NR LIKE '" & rs("NR") & "%' AND ZT ='1'"
                 RS1.Open sql1, conn, 1, 1
                    If RS1.RecordCount > 0 Then
                    Else
                    SQL2 = "UPDATE GUOLV_QUEDING SET ZT ='1' WHERE ZD ='" & rs("ZD") & "' AND ZT ='0' AND NR = '" & rs("NR") & "'"
                    conn.Execute (SQL2)
                    End If
                RS1.Close
                    
         
            rs.MoveNext
            Loop
        rs.Close
        
        
     For J = 1 To 3
                      '   Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV_QUEDING WHERE ZD = '" & LK(J) & "'AND ZT='1' "
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                         i = 1
                            Do While Not rs.EOF
                            If i = 1 Then
                            Else
                            LSTH = LSTH & "��"
                            End If
                            LSTH = LSTH & rs("NR")
                            i = i + 1
                            rs.MoveNext
                            Loop
                        rs.Close
                        KK(J) = LSTH
       Next
       
        
        
       For J = 1 To 23
                       '  Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV_QUEDING WHERE ZD = '" & LM(J) & "' AND ZT='1'"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                         i = 1
                            Do While Not rs.EOF
                            If i = 1 Then
                            Else
                            LSTH = LSTH & "��"
                            End If
                            LSTH = LSTH & rs("NR")
                            i = i + 1
                            rs.MoveNext
                            Loop
                        rs.Close
                        MM(J) = LSTH
       Next
    YNR = request("yuanwen")       
SQL = "SELECT * FROM GUOLV_QUEDING WHERE ZT='1' order by len(NR) desc"
RS.Open SQL,CONN,1,1
	DO WHILE NOT RS.EOF 
	YNR = REPLACE(YNR,RS("NR"),"<font color=red>#��ȡ#</font>")
	SQL = "DELETE FROM GUOLV_NR WHERE NR = '" & RS("NR") & "'"
	CONN.Execute(SQL)
	RS.MOVENEXT
	LOOP
RS.CLOSE 
     
 
%>
<html>
<head>
<title>ʶ������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.unnamed1 {  font-size: 9pt; line-height: 16pt; text-decoration: none}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<center>
<form name="form1" action="doctor_sb.asp" method="post">
  <table width="1300" border="1" cellspacing="0" cellpadding="10" class="unnamed1">
    <tr bgcolor="#0000CC"> 
      <td width="324"><font color="#FFFF00">δʶ�������-ǰ�ַ�</font></td>
      <td width="339"><font color="#FFFF00">δʶ�������-���ַ�</font></td>
      <td width="569"><font color="#FFFF00">����ʶ����ֶ�</font></td>
    </tr>
    <%
	 I = 1
	 SQL = "SELECT DISTINCT NR FROM GUOLV_NR WHERE len(NR) >2"
	 RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		FOR J = 2 TO 25
			POP = 0
			POP = INSTR(KM(J),RS("NR"))
				IF POP >0 THEN
				GZD = DISPLAY_NAME("GUOLV_ZD",LM(J),"ZD","ZDMC")
				YZD = KM(J)
				END IF
		NEXT
	 %> 
    <tr> 
      <td width="324"> 
        <input type="text" name="QZF<%=i%>" value="" size="50">
		  <%=YZD%>
      </td>
      <td width="339"> <%=GZD%>
        <input type="text" name="HZF<%=i%>" value="<%=rs("nr")%>" size="50">
      </td>
      <td width="469"> <%
			SQL1 = "SELECT * FROM GUOLV_ZD ORDER BY ID"
			RS1.Open SQL1,CONN,1,1
			MHY = 0
				DO WHILE NOT RS1.EOF 
					IF cdbl(MHY) = 4 or  cdbl(MHY) = 7 or cdbl(MHY) =10 or cdbl(MHY) =14 or cdbl(MHY) =15 or cdbl(MHY) =18 or cdbl(MHY) =21 or cdbl(MHY) =27 THEN
					 RESPONSE.Write("<br>")
					END IF
				%> 
        <input type="checkbox" name="lb<%=i%>" value="<%=RS1("ZD")%>"  >
        <%=RS1("ZDMC")%> <%
		  	MHY = MHY + 1
				
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			%> </td>
    </tr>
    <%
	 I = I + 1
	 RS.MoveNext
	 LOOP
	 RS.CLOSE 
	 %> 
  </table>
  <hr>
  <input type="hidden" name = "num" value="<%=I%>">
 <input type="submit" name="Submit" value="�ύʶ���ַ���">
</form>
</center>
</body>
</html>