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
FUNCTION MYCHU(DIS)
	IF DIS = "" THEN
	MYCHU = "��"
	ELSE
	MYCHU = DIS
	END IF
END FUNCTION 


DIM LK(50)


	

FOR I = 1 TO INT(Request("NUM"))


	IF REQUEST("lb" & I ) <>"" THEN
	
	'���ֶδ���
	
	CAOZUO = TRIM(REQUEST("lb" & I ) )
	POP = INSTR(CAOZUO,",")
		J = 0
		WHILE POP >0
			LK(J) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			J = J + 1
		
		WEND
		LK(J)=TRIM(MID(CAOZUO,1))


		FOR M = 0 TO J
		SQL = "SELECT TOP 1 * FROM GUOLV WHERE ZD = '" & LK(M) & "'  AND QZF = '" & Request("QZF" & I ) & "'   AND HZF = '" & Request("HZF" & I ) & "'"
		
		RS.Open SQL,CONN,1,1
				IF RS.RecordCount>0 THEN
				ELSE
					'ȡһ������
					ZDMC = DISPLAY_NAME("GUOLV",LK(M),"ZD","ZDMC")
					SQL = "SELECT top 1 * FROM GUOLV"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
						RS1("ZD") = LK(M)
						RS1("ZDMC") = ZDMC
	  				RS1("QZF") = MYCHU(Request("QZF" & I ))
	  				RS1("HZF") = MYCHU(Request("HZF" & I ))
	  			  RS1.UpdateBatch 
	  				RS1.Close 
				END IF
			RS.CLOSE 
			NEXT
	END IF

	
NEXT

	
%>
�µ�ʶ���ַ������ˣ����������ʶ��һ��

<table width="500" border="0" cellspacing="1" class="main" cellpadding="20" bgcolor="#000000">
    
	   <tr bgcolor="#FFFFFF"> 
      <td> 
         <div align="center"><a href="doctor_shibie.asp">ҽ��ʶ��ϵͳ</a></div>
      </td>
      <td> 
        <div align="center"><a href="doctor_linshi_search.asp">ʶ�����</a></div>
      </td>
    </tr>
   
  </table>