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
		
		 s_xm =  request("xm")
		 MYINPUT = request("yuanwen")
		 MYINPUT = Replace(MYINPUT, Chr(13), "#")
		 MYINPUT = Replace(MYINPUT, Chr(10), "#")  
                          MYINPUT = Replace(MYINPUT, "#", "，")
                          MYINPUT = Replace(MYINPUT, "。", "，")
                          MYINPUT = Replace(MYINPUT, "；", "，")
                          MYINPUT = Replace(MYINPUT, "、", "，")
							'	  MYINPUT = Replace(MYINPUT, ".", "，")
								  MYINPUT = Replace(MYINPUT, ";", "，")
								  MYINPUT = Replace(MYINPUT, ",", "，")
								 MYINPUT = Replace(MYINPUT, " ", "")
								 
								 
								  SQL = "DELETE FROM GUOLV_NR"
								  CONN.Execute(SQL)
  EE = Split(MYINPUT, "，")
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
                         
                      
  '先按照#进行分割
   ' AA = Split(MYINPUT, "#")
   ' For AI = 0 To UBound(AA)
     '按照。进行分割
    ' BB = Split(AA(AI), "。")
    ' For BI = 0 To UBound(BB)
        '按照；进行分割
       ' CC = Split(BB(BI), "；")
       ' For CI = 0 To UBound(CC)
            '按照，进行分割
         '   DD = Split(CC(CI), "，")
         '   For DI = 0 To UBound(DD)
            '按照进行分割
          '  EE = Split(DD(DI), "，")
          '  For EI = 0 To UBound(EE)
                
                EE = Split(MYINPUT, "，")
            For EI = 0 To UBound(EE)
                
           
  
				  
                                If rs("QZF") = "无" Then
                                '后字符
                                    POP = 0
                                    POP = InStr(EE(EI), rs("HZF"))
                                    If POP > 0 Then
                                          LSTH = LSTH & " " & rs("HZF")
                                                '处理剩余的字符串
                                    
                                     sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LK(i) & "','" & rs("HZF") & "')"
                                     conn.Execute (sql)
                                    End If
                                Else
                                '前
                               response.Write ("没设置前字符程序")
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
                
                
  '处理其他的字段
  
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
  
      For J = 1 To 25
                         sql = "DELETE FROM GUOLV_ZDNR WHERE ZD = '" & LM(J) & "'"
                            conn.Execute (sql)
                            
                      '  Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV WHERE ZD = '" & LM(J) & "' ORDER BY LEN(HZF) DESC"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                            Do While Not rs.EOF
                           
                           
                            
  '先按照#进行分割
   ' AA = Split(MYINPUT, "#")
   ' For AI = 0 To UBound(AA)
     '按照。进行分割
    ' BB = Split(AA(AI), "。")
    ' For BI = 0 To UBound(BB)
        '按照；进行分割
      '  CC = Split(BB(BI), "；")
      '  For CI = 0 To UBound(CC)
            '按照，进行分割
          '  DD = Split(CC(CI), "，")
          '  For DI = 0 To UBound(DD)
             '按照，进行分割
          '  EE = Split(DD(DI), "、")
          '  For EI = 0 To UBound(EE)
                
                    EE = Split(MYINPUT, "，")
            For EI = 0 To UBound(EE)
            
            
                '处理开始
                
                If Replace(rs("QZF"), " ", "") = "无" Then
                '判断后字符的字段
                    POP = 0
                    POP = InStr(EE(EI), rs("HZF"))
                    LSTEN = Len(rs("HZF"))
                    If POP > 0 Then
                      '后字符之前的
                     ' MYNR = Mid(EE(EI), 1, POP + LSTEN)
                     ' sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & MYNR & "')"
											sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" &  replace(EE(EI),chr(32),"") & "')"
                      conn.Execute (sql)
                    End If
                    'POP >0
                    
                 Else
                 'RS("QZF") <> ""
                    '先判断后字符是否为空
                    If Replace(rs("HZF"), " ", "") = "无" Then
                    '如果为空
                         POP = 0
                            POP = InStr(EE(EI), rs("QZF"))
                             If POP > 0 Then
                              '后字符之前的
                              MYNR = Mid(EE(EI), POP)
                              'sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & MYNR & "')"
															sql = "INSERT GUOLV_ZDNR (ZD,NR) VALUES('" & LM(J) & "','" & replace(EE(EI),chr(32),"") & "')"
                              conn.Execute (sql)
                            End If
                            'POP >0
                    Else
                    '后字符，前字符都不为空
                            '先判断前字符
                            POP = 0
                            POP = InStr(EE(EI), rs("QZF"))
                             If POP > 0 Then
                             LSZFC = Mid(EE(EI), POP)
                             '看看后字符是否存在，如果存在，就是合格的
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
                    '后字符结束判断
                
                 End If
                 'RS("QZF") = ""
              
                '处理结束
                Next
       '     Next DI
    '    Next CI
   '  Next BI
  '  Next AI
  
    rs.MoveNext
    Loop
    rs.Close
   
    Next
    
    '处理完毕
    sql = "DELETE FROM GUOLV_QUEDING"
    conn.Execute (sql)
    sql = "INSERT INTO GUOLV_QUEDING SELECT DISTINCT ZD,NR,ZT,SX FROM GUOLV_ZDNR"
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
        
		  
		  '确定顺序
		  
            sql = "SELECT * FROM GUOLV_QUEDING WHERE ZT='1'"
         rs.Open sql, conn, 1, 1
            Do While Not rs.EOF
            '查询顺序
						POP =0
						POP = INSTR(request("yuanwen"),RS("NR"))
						SQL1= "UPDATE GUOLV_QUEDING SET SX = " & POP & " WHERE NR = '" & RS("NR") & "'"
						CONN.Execute(SQL1)
            rs.MoveNext
            Loop
        rs.Close
		  
		  
		  
     For J = 1 To 3
                      '   Set rs = New Recordset
                        sql = "SELECT * FROM GUOLV_QUEDING WHERE ZD = '" & LK(J) & "'AND ZT='1' ORDER BY SX"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                         i = 1
                            Do While Not rs.EOF
                            If i = 1 Then
                            Else
                            LSTH = LSTH & "，"
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
                        sql = "SELECT * FROM GUOLV_QUEDING WHERE ZD = '" & LM(J) & "' AND ZT='1'  ORDER BY SX"
                         rs.Open sql, conn, 1, 1
                         LSTH = ""
                         i = 1
                            Do While Not rs.EOF
                            If i = 1 Then
                            Else
                            LSTH = LSTH & "，"
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
	YNR = REPLACE(YNR,RS("NR"),"<font color=red>#读取#</font>")
	SQL = "DELETE FROM GUOLV_NR WHERE NR = '" & RS("NR") & "'"
	CONN.Execute(SQL)
	RS.MOVENEXT
	LOOP
RS.CLOSE 
      '增加记录
    WB_FILE_NO = id_name("LSCL_NO")
    
                   ' Set RS1 = New Recordset
                    sql = "SELECT top 1 * FROM D_DOCTOR_LINSHI"
                    RS1.Open sql, conn, adOpenKeyset, adLockOptimistic
                    RS1.AddNew
                        RS1("CLASS_NO") = ""
                        RS1("XM") = s_xm
                        RS1("hs_no") = ""
                        RS1("ysclass") = ""
                        RS1("dq") = ""
                        RS1("worktime") = MM(12)
                        RS1("zw") = MM(1)
                        RS1("zch") = KK(1)
                        RS1("zc") = KK(3)
                        RS1("XS") = KK(2)
                        RS1("JBXTA") = ""
                        RS1("JBXTB") = ""
                        RS1("JBXTC") = ""
                        RS1("ZLJD") = MYZLJD
                        RS1("ZLFS") = MYZLFS
                        RS1("KYFX") = MM(5)
                        RS1("zltc") = MM(10)
                        RS1("jcips") = ""
                        RS1("ysgs") = MM(11)
                        RS1("rwgs") = MM(11)
                        RS1("GJLY_RZ") = MM(4)
                        RS1("GJLY_JX") = MM(3)
                        RS1("GJLY_XS") = ""
                        RS1("XSZW_GJA") = MM(6)
                        RS1("XSZW_SS") = MM(7)
                        RS1("XSZW_YX") = MM(8)
                        RS1("XSZW_ZZ") = MM(9)
                        RS1("XMCG_GJ") = MM(21)
                        RS1("JLQK_GJA") = MM(14)
                        RS1("JLQK_SS") = MM(15)
                        RS1("JLQK_YX") = MM(16)
                        RS1("JLQK_QT") = MM(24)
                        RS1("ZYLZ") = MM(2)
                        RS1("LWFB") = MM(13)
                        RS1("BLBW") = MM(23)
                        RS1("ZYBD") = MM(22)
                        RS1("ZYXY") = ""
                        RS1("JBMCA") = ""
                        RS1("JBMCB") = ""
                        RS1("JBMCC") = ""
                        RS1("ZXLY") = MM(19)
                        RS1("ZLLY") = MM(20)
                        RS1("EDU_OTHERS") = MM(17)
                        RS1("SHRY") = MM(18)
                         RS1("info_find") = ""
                        RS1("NO") = WB_FILE_NO
                        RS1("IF_HTML") = "否"
                        RS1("ZP") = ""
                         RS1("QG_PM") = 100000
                        RS1("BJ_QG_PM") = 100000
                        RS1("JCI_QG_PM") = 100000
                        RS1("USER_NAME") = "leon"
                        RS1("GX_USER") = "leon"
												RS1("YNR") = request("yuanwen")  
												RS1("XNR") = YNR
                    RS1.UpdateBatch
                    RS1.Close

 
%>
<html>
<head>
<title>识别后的信息</title>
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
      <td width="324"><font color="#FFFF00">未识别的文字-前字符</font></td>
      <td width="339"><font color="#FFFF00">未识别的文字-后字符</font></td>
      <td width="569"><font color="#FFFF00">可能识别的字段</font></td>
    </tr>
    <%
	 I = 1
	 SQL = "SELECT DISTINCT NR FROM GUOLV_NR WHERE len(NR) >2"
	 RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
	 %> 
    <tr> 
      <td width="324"> 
        <input type="text" name="QZF<%=i%>" value="" size="50">
      </td>
      <td width="339"> 
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
 <input type="submit" name="Submit" value="提交识别字符串">
</form>
</center>
</body>
</html>
