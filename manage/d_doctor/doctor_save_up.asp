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
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
 
		 s_class_no = request("class_no")
		 s_xm =  request("xm")
		 s_hs_no = request("hs_no")
		 s_ysclass = request("ysclass")
		 s_dq = request("dq")
		 s_zw = request("zw")
		 s_zch = request("zch")
		 s_zc = request("zc")
		 s_xs = request("xs")
		 s_worktime = request("worktime")
		 s_jbxta = request("jbxta")
		 s_jbxtb = request("jbxtb")
		 s_jbxtc = request("jbxtc")
		 s_zltc = request("zltc")
		 s_zljd = request("zljd")
		 s_zlfs = request("zlfs")
		 s_kyfx = request("kyfx")
		  s_jcips = request("jcips")
		 s_ysgs = request("ysgs")
		 s_rwgs = request("rwgs")
		 s_GJLY_RZ = request("GJLY_RZ")
		 s_GJLY_JX = request("GJLY_JX")
		 s_GJLY_XS = request("GJLY_XS")
		 s_XSZW_GJA = request("XSZW_GJA")
		 s_XSZW_SS = request("XSZW_SS")
		 s_XSZW_YX = request("XSZW_YX")
		 s_XSZW_ZZ = request("XSZW_ZZ")
		 s_XMCG_GJ = request("XMCG_GJ")
		 
		 s_JLQK_GJA = request("JLQK_GJA")
		 s_JLQK_SS = request("JLQK_SS")
		 s_JLQK_YX = request("JLQK_YX")
			s_JLQK_QT = request("JLQK_QT")
			s_ZYLZ = request("ZYLZ")
			s_LWFB = request("LWFB")
			s_BLBW = request("BLBW")
			s_ZYBD = request("ZYBD")
			s_ZYXY = request("ZYXY")
			s_JBMCA = request("JBMCA")
			s_JBMCB = request("JBMCB")
			s_JBMCC = request("JBMCC")
			s_zxly = request("zxly")
		  s_zlly = request("zlly")
			s_edu_others = request("edu_others")
		  s_shry = request("shry")
		'  s_sfsx = request("sfsx")
		'  s_if_html =  request("if_html")
		' s_info_find =  request("info_find")
		 s_info_corre =  request("info_corre")
		 s_zp =  request("zp")
		 s_bd_pm = request("bd_pm")
		 s_qg_pm = request("qg_pm")
		 s_bj_bd_pm = request("bj_bd_pm")
		 s_bj_qg_pm = request("bj_qg_pm")
		 s_jci_bd_pm = request("jci_bd_pm")
		 s_jci_qg_pm = request("jci_qg_pm")
		 
	 MHY_S = ""
	 EE = split(s_XMCG_GJ,chr(13))
		For EI = 0 To UBound(EE)
		
				if len(EE(EI)) >1 THEN
				
				s_XMCG_GJ=trimVBcrlf(EE(EI))
				
				MHY_S = MHY_S & s_XMCG_GJ & chr(10) & chr(13)
				
				end if
		next
		

		s_XMCG_GJ=MHY_S

	
		XTH="<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-size: 16px;font-family: ΢���ź�, 'Microsoft YaHei';'>"
		XTHJW = "</span></p>"
		
		 s_XMCG_GJ=replace(s_XMCG_GJ,chr(13),XTHJW & XTH)
		 s_XMCG_GJ = XTH & s_XMCG_GJ & XTHJW
					 
			
				SQL = "SELECT TOP 1 * FROM D_CLASS WHERE hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "'"
					RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 Then
					s_qg_pm = rs("qg_pm")
					ELSE
					Response.Write "�ڿ������ݱ��и�ҽԺ�Ŀ���û��¼�룬����¼���ҽԺ�Ŀ��ң�лл��"
					Response.End 
					END IF
				RS.Close 



		 
					SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE XM = '" & s_xm & "' and hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "' and no <>'" & request("no") & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "��¼�����ظ���������ҽԺ������һ��"
					Response.End 
					END IF
				RS.Close 
				
				
				
				YBH = "F"
			
				
						SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
							IF RS1.RecordCount>0 THEN
							
													'����
														IF StrComp(RS1("DQ"),s_dq) = 0 THEN
															ss_dq = s_dq
															ELSE
																MYLEN = LEN(RS1("dq"))
																MYXLEN =LEN(s_dq)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("dq"), TmpFor, 1) <> Mid(s_dq, TmpFor, 1) Then
																			ss_dq = MID(s_dq,1,TMPFOR-1) & "<font color=red>" & MID(s_dq,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															'����ְ��
														IF StrComp(RS1("ZW"),s_zw) = 0 THEN
															ss_zw = s_zw
															ELSE
																MYLEN = LEN(RS1("ZW"))
																MYXLEN =LEN(s_zw)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZW"), TmpFor, 1) <> Mid(s_zw, TmpFor, 1) Then
																			ss_zw = MID(s_zw,1,TMPFOR-1) & "<font color=red>" & MID(s_zw,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'����ְ��
														IF StrComp(RS1("ZCH"),s_zch) = 0 THEN
															ss_zch = s_zch
															ELSE
																MYLEN = LEN(RS1("ZCH"))
																MYXLEN =LEN(s_zch)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZCH"), TmpFor, 1) <> Mid(s_zch, TmpFor, 1) Then
																			ss_zch = MID(s_zch,1,TMPFOR-1) & "<font color=red>" & MID(s_zch,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																		'ѧ��ְ��
														IF StrComp(RS1("ZC"),s_zc) = 0 THEN
															ss_zc = s_zc
															ELSE
																MYLEN = LEN(RS1("ZC"))
																MYXLEN =LEN(s_zc)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZC"), TmpFor, 1) <> Mid(s_zc, TmpFor, 1) Then
																			ss_zc = MID(s_zc,1,TMPFOR-1) & "<font color=red>" & MID(s_zc,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
														'ѧ���ƺ�
														IF StrComp(RS1("XS"),s_xs) = 0 THEN
															ss_xs = s_xs
															ELSE
																MYLEN = LEN(RS1("XS"))
																MYXLEN =LEN(s_xs)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XS"), TmpFor, 1) <> Mid(s_xs, TmpFor, 1) Then
																			ss_xs = MID(s_xs,1,TMPFOR-1) & "<font color=red>" & MID(s_xs,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'�ó�����ϵͳ/��λ1
														IF StrComp(RS1("JBXTA"),s_jbxta) = 0 THEN
															ss_jbxta = s_jbxta
															ELSE
																MYLEN = LEN(RS1("JBXTA"))
																MYXLEN =LEN(s_jbxta)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JBXTA"), TmpFor, 1) <> Mid(s_jbxta, TmpFor, 1) Then
																			ss_jbxta = MID(s_jbxta,1,TMPFOR-1) & "<font color=red>" & MID(s_jbxta,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'�����س�
														IF StrComp(RS1("ZLTC"),s_zltc) = 0 THEN
															ss_zltc = s_zltc
															ELSE
																MYLEN = LEN(RS1("ZLTC"))
																MYXLEN =LEN(s_zltc)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZLTC"), TmpFor, 1) <> Mid(s_zltc, TmpFor, 1) Then
																			ss_zltc = MID(s_zltc,1,TMPFOR-1) & "<font color=red>" & MID(s_zltc,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'���ƽ׶�
														IF StrComp(RS1("ZLJD"),s_zljd) = 0 THEN
															ss_zljd = s_zljd
															ELSE
																MYLEN = LEN(RS1("ZLJD"))
																MYXLEN =LEN(s_zljd)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZLJD"), TmpFor, 1) <> Mid(s_zljd, TmpFor, 1) Then
																			ss_zljd = MID(s_zljd,1,TMPFOR-1) & "<font color=red>" & MID(s_zljd,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
														'���Ʒ�ʽ
														IF StrComp(RS1("ZLFS"),s_zlfs) = 0 THEN
															ss_zlfs = s_zlfs
															ELSE
																MYLEN = LEN(RS1("ZLFS"))
																MYXLEN =LEN(s_zlfs)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZLFS"), TmpFor, 1) <> Mid(s_zlfs, TmpFor, 1) Then
																			ss_zlfs = MID(s_zlfs,1,TMPFOR-1) & "<font color=red>" & MID(s_zlfs,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'���з���
														IF StrComp(RS1("KYFX"),s_kyfx) = 0 THEN
															ss_kyfx = s_kyfx
															ELSE
																MYLEN = LEN(RS1("KYFX"))
																MYXLEN =LEN(s_kyfx)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("KYFX"), TmpFor, 1) <> Mid(s_kyfx, TmpFor, 1) Then
																			ss_kyfx = MID(s_kyfx,1,TMPFOR-1) & "<font color=red>" & MID(s_kyfx,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'JCI����
														IF StrComp(RS1("JCIPS"),s_jcips) = 0 THEN
															ss_jcips = s_jcips
															ELSE
																MYLEN = LEN(RS1("JCIPS"))
																MYXLEN =LEN(s_jcips)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JCIPS"), TmpFor, 1) <> Mid(s_jcips, TmpFor, 1) Then
																			ss_jcips = MID(s_jcips,1,TMPFOR-1) & "<font color=red>" & MID(s_jcips,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																	'�������
														IF StrComp(RS1("RWGS"),s_rwgs) = 0 THEN
															ss_rwgs = s_rwgs
															ELSE
																MYLEN = LEN(RS1("RWGS"))
																MYXLEN =LEN(s_jcips)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("RWGS"), TmpFor, 1) <> Mid(s_rwgs, TmpFor, 1) Then
																			ss_rwgs = MID(s_jcips,1,TMPFOR-1) & "<font color=red>" & MID(s_rwgs,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
													
													'�������򣺹�����ְ
														IF StrComp(RS1("GJLY_RZ"),S_GJLY_RZ) = 0 THEN
															sS_GJLY_RZ = S_GJLY_RZ
															ELSE
																MYLEN = LEN(RS1("GJLY_RZ"))
																MYXLEN =LEN(S_GJLY_RZ)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("GJLY_RZ"), TmpFor, 1) <> Mid(S_GJLY_RZ, TmpFor, 1) Then
																			sS_GJLY_RZ = MID(S_GJLY_RZ,1,TMPFOR-1) & "<font color=red>" & MID(S_GJLY_RZ,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'�������򣺹��ʽ���
														IF StrComp(RS1("GJLY_JX"),S_GJLY_JX) = 0 THEN
															sS_GJLY_JX = S_GJLY_JX
															ELSE
																MYLEN = LEN(RS1("GJLY_JX"))
																MYXLEN =LEN(S_GJLY_JX)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("GJLY_JX"), TmpFor, 1) <> Mid(S_GJLY_JX, TmpFor, 1) Then
																			sS_GJLY_JX = MID(S_GJLY_JX,1,TMPFOR-1) & "<font color=red>" & MID(S_GJLY_JX,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'��������ѧ���
														IF StrComp(RS1("GJLY_XS"),S_GJLY_XS) = 0 THEN
															sS_GJLY_XS = S_GJLY_XS
															ELSE
																MYLEN = LEN(RS1("GJLY_XS"))
																MYXLEN =LEN(S_GJLY_XS)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("GJLY_XS"), TmpFor, 1) <> Mid(S_GJLY_XS, TmpFor, 1) Then
																			sS_GJLY_XS = MID(S_GJLY_XS,1,TMPFOR-1) & "<font color=red>" & MID(S_GJLY_XS,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																	'ѧ��ְ�񣺹��Ҽ�
														IF StrComp(RS1("XSZW_GJA"),S_XSZW_GJA) = 0 THEN
															sS_XSZW_GJA = S_XSZW_GJA
															ELSE
																MYLEN = LEN(RS1("XSZW_GJA"))
																MYXLEN =LEN(S_XSZW_GJA)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XSZW_GJA"), TmpFor, 1) <> Mid(S_XSZW_GJA, TmpFor, 1) Then
																			sS_XSZW_GJA = MID(S_XSZW_GJA,1,TMPFOR-1) & "<font color=red>" & MID(S_XSZW_GJA,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
														'ѧ��ְ��ʡ�м�
														IF StrComp(RS1("XSZW_SS"),S_XSZW_SS) = 0 THEN
															sS_XSZW_SS = S_XSZW_SS
															ELSE
																MYLEN = LEN(RS1("XSZW_SS"))
																MYXLEN =LEN(S_XSZW_SS)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XSZW_SS"), TmpFor, 1) <> Mid(S_XSZW_SS, TmpFor, 1) Then
																			sS_XSZW_SS = MID(S_XSZW_SS,1,TMPFOR-1) & "<font color=red>" & MID(S_XSZW_SS,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'ѧ��ְ��ԺУ��
														IF StrComp(RS1("XSZW_YX"),S_XSZW_YX) = 0 THEN
															sS_XSZW_YX = S_XSZW_YX
															ELSE
																MYLEN = LEN(RS1("XSZW_YX"))
																MYXLEN =LEN(S_XSZW_YX)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XSZW_YX"), TmpFor, 1) <> Mid(S_XSZW_YX, TmpFor, 1) Then
																			sS_XSZW_YX = MID(S_XSZW_YX,1,TMPFOR-1) & "<font color=red>" & MID(S_XSZW_YX,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'ѧ��ְ����־��ְ
														IF StrComp(RS1("XSZW_ZZ"),S_XSZW_ZZ) = 0 THEN
															sS_XSZW_ZZ = S_XSZW_ZZ
															ELSE
																MYLEN = LEN(RS1("XSZW_ZZ"))
																MYXLEN =LEN(S_XSZW_ZZ)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XSZW_ZZ"), TmpFor, 1) <> Mid(S_XSZW_ZZ, TmpFor, 1) Then
																			sS_XSZW_ZZ = MID(S_XSZW_ZZ,1,TMPFOR-1) & "<font color=red>" & MID(S_XSZW_ZZ,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
													'��Ŀ�ɹ������ʼ�
														IF StrComp(RS1("XMCG_GJ"),S_XMCG_GJ) = 0 THEN
															sS_XMCG_GJ = S_XMCG_GJ
															ELSE
																MYLEN = LEN(RS1("XMCG_GJ"))
																MYXLEN =LEN(S_XMCG_GJ)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("XMCG_GJ"), TmpFor, 1) <> Mid(S_XMCG_GJ, TmpFor, 1) Then
																			sS_XMCG_GJ = MID(S_XMCG_GJ,1,TMPFOR-1) & "<font color=red>" & MID(S_XMCG_GJ,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
												
																	'����������Ҽ�
														IF StrComp(RS1("JLQK_GJA"),S_JLQK_GJA) = 0 THEN
															sS_JLQK_GJA = S_JLQK_GJA
															ELSE
																MYLEN = LEN(RS1("JLQK_GJA"))
																MYXLEN =LEN(S_JLQK_GJA)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JLQK_GJA"), TmpFor, 1) <> Mid(S_JLQK_GJA, TmpFor, 1) Then
																			sS_JLQK_GJA = MID(S_JLQK_GJA,1,TMPFOR-1) & "<font color=red>" & MID(S_JLQK_GJA,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
							
							
											'�������ʡ�м�
														IF StrComp(RS1("JLQK_SS"),S_JLQK_SS) = 0 THEN
															sS_JLQK_SS  = S_JLQK_SS
															ELSE
																MYLEN = LEN(RS1("JLQK_SS"))
																MYXLEN =LEN(S_JLQK_SS)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JLQK_SS"), TmpFor, 1) <> Mid(S_JLQK_SS, TmpFor, 1) Then
																			sS_JLQK_SS = MID(S_JLQK_SS,1,TMPFOR-1) & "<font color=red>" & MID(S_JLQK_SS,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
														'�������ԺУ��
														IF StrComp(RS1("JLQK_YX"),S_JLQK_YX) = 0 THEN
															sS_JLQK_YX = S_JLQK_YX
															ELSE
																MYLEN = LEN(RS1("JLQK_YX"))
																MYXLEN =LEN(S_JLQK_YX)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JLQK_YX"), TmpFor, 1) <> Mid(S_JLQK_YX, TmpFor, 1) Then
																			sS_JLQK_YX = MID(S_JLQK_YX,1,TMPFOR-1) & "<font color=red>" & MID(S_JLQK_YX,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'�����������
														IF StrComp(RS1("JLQK_QT"),S_JLQK_QT) = 0 THEN
															sS_JLQK_QT = S_JLQK_QT
															ELSE
																MYLEN = LEN(RS1("JLQK_QT"))
																MYXLEN =LEN(S_JLQK_QT)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("JLQK_QT"), TmpFor, 1) <> Mid(S_JLQK_QT, TmpFor, 1) Then
																			sS_JLQK_QT = MID(S_JLQK_QT,1,TMPFOR-1) & "<font color=red>" & MID(S_JLQK_QT,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																
															'��Ҫ��������Ҫ����
														IF StrComp(RS1("ZYLZ"),S_ZYLZ) = 0 THEN
															sS_ZYLZ = S_ZYLZ
															ELSE
																MYLEN = LEN(RS1("ZYLZ"))
																MYXLEN =LEN(S_ZYLZ)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZYLZ"), TmpFor, 1) <> Mid(S_ZYLZ, TmpFor, 1) Then
																			sS_ZYLZ = MID(S_ZYLZ,1,TMPFOR-1) & "<font color=red>" & MID(S_ZYLZ,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
													'��Ҫ���������ķ���
														IF StrComp(RS1("LWFB"),S_LWFB) = 0 THEN
															sS_LWFB = S_LWFB
															ELSE
																MYLEN = LEN(RS1("LWFB"))
																MYXLEN =LEN(S_LWFB)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("LWFB"), TmpFor, 1) <> Mid(S_LWFB, TmpFor, 1) Then
																			sS_LWFB = MID(S_LWFB,1,TMPFOR-1) & "<font color=red>" & MID(S_LWFB,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
															'��������
														IF StrComp(RS1("BLBW"),S_BLBW) = 0 THEN
															sS_BLBW = S_BLBW
															ELSE
																MYLEN = LEN(RS1("BLBW"))
																MYXLEN =LEN(S_BLBW)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("BLBW"), TmpFor, 1) <> Mid(S_BLBW, TmpFor, 1) Then
																			sS_BLBW = MID(S_BLBW,1,TMPFOR-1) & "<font color=red>" & MID(S_BLBW,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																'��Ҫ����
														IF StrComp(RS1("ZYBD"),S_ZYBD) = 0 THEN
															sS_ZYBD = S_ZYBD
															ELSE
																MYLEN = LEN(RS1("ZYBD"))
																MYXLEN =LEN(S_ZYBD)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("ZYBD"), TmpFor, 1) <> Mid(S_ZYBD, TmpFor, 1) Then
																			sS_ZYBD = MID(S_ZYBD,1,TMPFOR-1) & "<font color=red>" & MID(S_ZYBD,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
															
																		'�������
														IF StrComp(RS1("shry"),S_shry) = 0 THEN
															sS_shry = S_shry
															ELSE
																MYLEN = LEN(RS1("shry"))
																MYXLEN =LEN(S_shry)
																	IF MYLEN < MYXLEN THEN
																		MYLEN = MYXLEN
																	END IF
																	FOR TMPFOR = 1 TO MYLEN
																		If Mid(RS1("shry"), TmpFor, 1) <> Mid(S_shry, TmpFor, 1) Then
																			sS_shry = MID(S_shry,1,TMPFOR-1) & "<font color=red>" & MID(S_shry,TMPFOR) & "</font>"
																			YBH = "T"
																			EXIT for
																		ELSE
																			END IF
																	NEXT
															END IF
							
											'��Ƭ
												    	if Request("yzp") <> Request("zp") then
																			YBH = "T"
												
															END IF
															
							END IF
						RS1.CLOSE 
					
				'�޸ļ�¼
	  		
	  				SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
						RS1("CLASS_NO") = s_class_no
	  				RS1("XM") = s_xm
	  				RS1("hs_no") = s_hs_no
					  RS1("ysclass") = s_ysclass
						RS1("dq") = s_dq
						RS1("zw") = s_zw
						RS1("zch") = s_zch
						RS1("zc") = s_zc
						RS1("XS") = S_XS
						RS1("JBXTA") = S_JBXTA
						RS1("JBXTB") = S_JBXTB
						RS1("JBXTC") = S_JBXTC
						RS1("ZLJD") = S_ZLJD
						RS1("ZLFS") = S_ZLFS
						RS1("KYFX") = S_KYFX
						RS1("zltc") = s_zltc
						RS1("jcips") = S_jcips
						RS1("ysgs") = s_zw & "��" & s_zch & "��" & s_zc & "��" & S_XS & "��" & S_rwgs
						RS1("rwgs") = S_rwgs
						RS1("GJLY_RZ") = S_GJLY_RZ
						RS1("GJLY_JX") = S_GJLY_JX
						RS1("GJLY_XS") = S_GJLY_XS
						RS1("XSZW_GJA") = S_XSZW_GJA
						RS1("XSZW_SS") = S_XSZW_SS
						RS1("XSZW_YX") = S_XSZW_YX
						RS1("XSZW_ZZ") = S_XSZW_ZZ
						RS1("XMCG_GJ") = S_XMCG_GJ
				   	RS1("worktime") = s_worktime
						RS1("JLQK_GJA") = S_JLQK_GJA
						RS1("JLQK_SS") = S_JLQK_SS
						RS1("JLQK_YX") = S_JLQK_YX
						RS1("JLQK_QT") = S_JLQK_QT
						RS1("ZYLZ") = S_ZYLZ
						RS1("LWFB") = S_LWFB
						RS1("BLBW") = S_BLBW
						RS1("ZYBD") = S_ZYBD
						'RS1("ZYXY") = S_ZYXY
						RS1("JBMCA") = S_JBMCA
						RS1("JBMCB") = S_JBMCB
						RS1("JBMCC") = S_JBMCC
						RS1("ZXLY") = S_ZXLY
						RS1("ZLLY") = S_ZLLY
						RS1("EDU_OTHERS") = S_EDU_OTHERS
						RS1("SHRY") = S_SHRY
					'	RS1("SFSX") = S_SFSX
					'RS1("SFSX") = S_SFSX
						ss_dq = mid(s_dq,1,2)
						pop = instr(s_dq,"������")
						if pop >0 then
						ss_dq = "������"
						end if
						pop = instr(s_dq,"���ɹ�")
						if pop >0 then
						ss_dq = "���ɹ�"
						end if
	  				RS1("info_find") =  DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME") & "," & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","ALICE_NAME") & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME") & S_XM & S_ZLTC & ss_dq & S_XM
	  				'RS1("info_corre") = s_info_corre
	  				'RS1("NO") = WB_FILE_NO
	  				'RS1("IF_HTML") = s_if_html
						RS1("ZP") = s_zp
						'RS1("BD_PM") = s_bd_pm
						RS1("QG_PM") = s_qg_pm
						'RS1("BJ_BD_PM") = s_bj_bd_pm
						RS1("BJ_QG_PM") = s_bj_qg_pm
						'RS1("JCI_BD_PM") = s_jci_bd_pm
						RS1("JCI_QG_PM") = s_jci_qg_pm
						RS1("GX_DATE") = Date & " " & HOUR(TIME)& ":" & MINUTE(TIME) & ":" & SECOND(TIME) & ""
						RS1("GX_USER") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
					
					
						sql1 = "delete from d_doctor_gh where no = '" & REQUEST("NO") & "'"
						conn.Execute(sql1)
						
						 SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & s_hs_no & "' AND SEND_URL <>''"
						rs1.Open sql1,conn,1,1
						IF RS1.RecordCount >0 Then
						sql1 = "insert into d_doctor_gh (no,w_name,w_url,px) values('" & REQUEST("NO") & "','ҽԺ�Һ�','" & rs1("send_url") & "',99)"
						conn.Execute(sql1)
						End If
						rs1.close 
						
						
						sql1 = "insert into d_doctor_gh (no,w_name,w_url,px ) values('" & REQUEST("NO") & "','΢ҽ','https://www.guahao.com/search?q=" & s_xm & "&searchType=search',88)"
						conn.Execute(sql1)
						sql1 = "insert into d_doctor_gh (no,w_name,w_url,px ) values('" & REQUEST("NO") & "','��ҽ160','https://so.91160.com/main/search/search_key-" & s_xm & ".html',77)"
						conn.Execute(sql1)
						sql1 = "insert into d_doctor_gh (no,w_name,w_url,px ) values('" & REQUEST("NO") & "','�Ϻ�ҽ��ԤԼƽ̨','http://yuyue.shdc.org.cn/search.action?textfields=" & s_xm & "',33)"
						conn.Execute(sql1)
	
					'	sql1 = "insert into d_doctor_gh (no,w_name,w_url,px ) values('" & WB_FILE_NO & "','�ô������','http://m.haodf.com/touch/search/search?key=" & s_xm & "',55)"
					'	conn.Execute(sql1)
					'	sql1 = "insert into d_doctor_gh (no,w_name,w_url,ST,CL,px) values('" & rs("no") & "','ҽ����','http://m.yihu.com','T','T',66)"
					'	conn.Execute(sql1)

					'	sql1 = "insert into d_doctor_gh (no,w_name,w_url,ST,CL,px) values('" & rs("no") & "','������ԤԼ�Һ�ͳһƽ̨','http://www.bjguahao.gov.cn/index.htm','T','T',44)"
					'	conn.Execute(sql1)

													
			IF YBH = "T" THEN
					'�޸ļ�¼
	  		
	  				'���ӱ�ע���ݱ�
					
					SQL = "SELECT top 1 * FROM D_DOCTOR_DESC"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("XM") = s_xm
	  				RS1("hs_no") = s_hs_no
					  RS1("ysclass") = s_ysclass
						RS1("dq") = ss_dq
						RS1("zw") = ss_zw
						RS1("zch") = ss_zch
						RS1("zc") = ss_zc
						RS1("XS") = sS_XS
						RS1("JBXTA") = sS_JBXTA
						RS1("JBXTB") = S_JBXTB
						RS1("JBXTC") = S_JBXTC
						RS1("ZLJD") = sS_ZLJD
						RS1("ZLFS") = sS_ZLFS
						RS1("KYFX") = sS_KYFX
						RS1("zltc") = ss_zltc
						RS1("jcips") = sS_jcips
						RS1("ysgs") = ss_zw & "��" & ss_zch & "��" & ss_zc & "��" & Ss_XS & "��" & Ss_rwgs
						RS1("rwgs") = sS_rwgs
						RS1("GJLY_RZ") = sS_GJLY_RZ
						RS1("GJLY_JX") = sS_GJLY_JX
						RS1("GJLY_XS") = sS_GJLY_XS
						RS1("XSZW_GJA") = sS_XSZW_GJA
						RS1("XSZW_SS") = sS_XSZW_SS
						RS1("XSZW_YX") = sS_XSZW_YX
						RS1("XSZW_ZZ") = sS_XSZW_ZZ
						RS1("XMCG_GJ") = sS_XMCG_GJ
				   	RS1("worktime") = s_worktime
						RS1("JLQK_GJA") = sS_JLQK_GJA
						RS1("JLQK_SS") = sS_JLQK_SS
						RS1("JLQK_YX") = sS_JLQK_YX
						RS1("JLQK_QT") = sS_JLQK_QT
						RS1("ZYLZ") = sS_ZYLZ
						RS1("LWFB") = sS_LWFB
						RS1("BLBW") = sS_BLBW
						RS1("ZYBD") = sS_ZYBD
						'RS1("ZYXY") = S_ZYXY
						RS1("JBMCA") = S_JBMCA
						RS1("JBMCB") = S_JBMCB
						RS1("JBMCC") = S_JBMCC
						RS1("ZXLY") = S_ZXLY
						RS1("ZLLY") = S_ZLLY
						RS1("EDU_OTHERS") = S_EDU_OTHERS
						RS1("SHRY") = sS_SHRY
					'	RS1("SFSX") = S_SFSX
	  				RS1("info_find") = s_info_find & "," & DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME") & "," & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
	  				'RS1("info_corre") = s_info_corre
	  				RS1("NO") = Request("No")
	  				'RS1("IF_HTML") = s_if_html
						RS1("ZP") = s_zp
						'RS1("BD_PM") = s_bd_pm
						RS1("QG_PM") = s_qg_pm
						'RS1("BJ_BD_PM") = s_bj_bd_pm
						RS1("BJ_QG_PM") = s_bj_qg_pm
						'RS1("JCI_BD_PM") = s_jci_bd_pm
						RS1("JCI_QG_PM") = s_jci_qg_pm
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1("GX_USER") = Request.Cookies("user_name")
						RS1("CAOZUO") = "�޸�"
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  END IF			


				
'		XM = s_xm
'		YY = ""
'		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & s_hs_no & "'"
'		RS1.Open SQL1,CONN,1,1
'			IF RS1.RecordCount>0 THEN
'			YY = RS1("HS_NAME")
'			END IF
'			RS1.CLOSE 
'			KS=""
'		SQL1 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & s_class_no & "'"
'		RS1.Open SQL1,CONN,1,1
'			IF RS1.RecordCount>0 THEN
'			KS = RS1("CLASS_NAME")
'			END IF
'			RS1.CLOSE 
'			ZLTC =s_zltc
			
SQL = "DELETE FROM DFYSCL WHERE NO='" &  REQUEST("NO") & "'"
CONN.Execute(SQL)
SQL = "INSERT INTO DFYSCL (NO) VALUES('" &  REQUEST("NO") & "')"
CONN.Execute(SQL)
	

	'			SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" &  REQUEST("NO") & "'"
	'  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	'  				RS9.MoveFirst
	'				RS9("INFO_FIND") = XM & YY & KS & ZLTC 
	'				RS9.UpdateBatch 
	'  				RS9.Close 
						
%>
<html>
<head>
<title>�����������޸ĳɹ�</title>
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
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ�޸� </font></div>
<hr>
<form method="POST" action="doctor_main.asp" name="un" >
  <table width="1180" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
       <%=s_xm%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main"> 
        <%=DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
        %> 
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�����</td>
      <td width="79%" class="main"> 
        <%=s_YSCLASS%>
        
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <%=s_dq%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ʱ�䣺</td>
      <td width="79%" class="main"> 
        <%=s_worktime%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ��</td>
      <td width="79%" class="main"> 
        <%=s_zw%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ�ƣ�</td>
      <td width="79%" class="main"> 
       <%=s_zch%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�ƣ�</td>
      <td width="79%" class="main"> 
      <%=s_zc%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ���ƺţ�</td>
      <td width="79%" class="main"> 
       <%=s_XS%>
        
          </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ����������</td>
      <td width="79%" class="main"> 
       <%=s_edu_others%>
      </td>
    </tr>
	
	 
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ҽ/��ҽ��</td>
      <td width="79%" class="main"> 
        <%=s_ZYXY%>
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����س���</td>
      <td width="79%" class="main"> 
       <%=s_zltc%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƽ׶Σ�</td>
      <td width="79%" class="main"> 
       <%=s_ZLJD%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���Ʒ�ʽ��</td>
      <td width="79%" class="main"> 
       <%=s_ZLFS%>
        
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ1��</td>
      <td width="79%" class="main"> 
        <%=s_JBXTA%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ2��</td>
      <td width="79%" class="main"> 
        <%=s_JBXTB%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ3��</td>
      <td width="79%" class="main"> 
       <%=s_JBXTC%>
        
          </td>
    </tr>
	 
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������1��</td>
      <td width="79%" class="main"> 
           <%=s_JBMCA%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������2��</td>
      <td width="79%" class="main"> 
         <%=s_JBMCB%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������3��</td>
      <td width="79%" class="main"> 
        <%=s_JBMCC%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���з���</td>
      <td width="79%" class="main"> 
      <%=s_kyfx%>
      </td>
    </tr>
	  
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI������</td>
      <td width="79%" class="main"> 
          <%=s_jcips%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ��������</td>
      <td width="79%" class="main"> 
         <%=s_ysgs%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
         <%=s_rwgs%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹�����ְ��</td>
      <td width="79%" class="main"> 
          <%=s_GJLY_RZ%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹��ʽ��</td>
      <td width="79%" class="main"> 
            <%=s_GJLY_JX%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������ѧ�����</td>
      <td width="79%" class="main"> 
          <%=s_GJLY_XS%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�񣺹��Ҽ���</td>
      <td width="79%" class="main"> 
          <%=s_XSZW_GJA%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ʡ�м���</td>
      <td width="79%" class="main"> 
          <%=s_XSZW_SS%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ԺУ����</td>
      <td width="79%" class="main"> 
         <%=s_XSZW_YX%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ����־��ְ��</td>
      <td width="79%" class="main"> 
         <%=s_XSZW_ZZ%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ŀ�ɹ���</td>
      <td width="79%" class="main"> 
         <%=s_XMCG_GJ%>
          </td>
    </tr>
	 	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������Ҽ���</td>
      <td width="79%" class="main"> 
          <%=s_JLQK_GJA%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ʡ�м���</td>
      <td width="79%" class="main"> 
           <%=s_JLQK_SS%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ԺУ����</td>
      <td width="79%" class="main"> 
            <%=s_JLQK_YX%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������������</td>
      <td width="79%" class="main"> 
             <%=s_JLQK_QT%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ��������Ҫ������</td>
      <td width="79%" class="main"> 
            <%=s_ZYLZ%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ���������ķ���</td>
      <td width="79%" class="main"> 
           <%=s_LWFB%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������</td>
      <td width="79%" class="main"> 
         <%=s_BLBW%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ������</td>
      <td width="79%" class="main"> 
          <%=s_ZYBD%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
        <%=s_shry%>
      </td>
    </tr>
	 
	 	 	
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ѷ��Դ��</td>
      <td width="79%" class="main"> 
        <%=s_zxly%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
        <%=s_zlly%>
        
          </td>
    </tr>
  
	 
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
      
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ͷ��ͼƬ��</td>
      <td width="79%" class="main"> 
		 <img src=/pic/<%=s_zp%><font color=red>�������ξͿ����ˣ�FTP�ϴ�������С��ͼƬ400X600�ģ�����Ϊ��</font>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_qg_pm%>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_bj_qg_pm%>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <%=s_jci_qg_pm%>
       </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">�ƹ��ַ��</td>
      <td width="68%" class="main"> 
     http://www.dakayi.net/doctor/D<%=REQUEST("NO")%>.html
        
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
	 <td width="32%" class="main">�����ƹ�:</td>
      <td width="68%" class="main"> 
     <a href="http://zhanzhang.baidu.com/linksubmit/url" target='_blank'>�򿪰ٶ��ƹ�</a> �������������ַ�����ύ��
        
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
