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

    '科室的连接
	 DIM LK(100) 
	 
	 LK(1) = "放射科"
	 LK(2) = "病理科"
	 LK(3) = "传染科"
	 LK(4) = "耳鼻喉科"
	 LK(5) = "呼吸科"
	 LK(6) = "风湿科"
	 LK(7) = "妇产科"
	 LK(8) = "骨科"
	 LK(9) = "口腔科"
	 LK(10) = "泌尿外科"
	 LK(11) = "内分泌"
	 LK(12) = "皮肤科"
	 LK(13) = "普通外科"
	 LK(14) = "神经内科"
	 LK(15) = "肾脏病"
	 LK(16) = "神经外科"
	 LK(17) = "消化病"
	 LK(18) = "小儿内科"
	 LK(19) = "小儿外科"
	 LK(20) = "心血管病"
	 LK(21) = "心外科"
	 LK(22) = "胸外科"
	 LK(23) = "血液学"
	 LK(24) = "眼科"
	 LK(25) = "整形外科"
	 LK(26) = "肿瘤学"
	 LK(27) = "超声医学"
	 LK(28) = "核医学"
	 LK(29) = "烧伤科"
	 LK(30) = "检验医学"
	 LK(31) = "康复医学"
	 LK(32) = "老年医学"
	 LK(33) = "精神医学"
	 LK(34) = "麻醉科"
	
	 
	 FOR I =1 TO 34
	 
	 SQL = "SELECT * FROM MY_HOSPTIAL WHERE " & LK(I) & " >0"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
			SQL1 = "UPDATE D_CLASS SET BD_PM = " & RS(LK(I)) & ",QG_PM = " & RS(LK(I)) & " WHERE CLASS_NAME = '" & RS("医院名称") & "-" & LK(I) & "'"
			CONN.Execute(SQL1)
			
			
			SQL1 = "UPDATE D_CLASS SET BD_PM = " & RS(LK(I)) & ",QG_PM = " & RS(LK(I)) & " WHERE CLASS_NAME LIKE '" & RS("医院名称") & "%' AND CLASS_NAME LIKE '%" & LK(I) & "%' AND BD_PM=0 AND QG_PM=0"
			CONN.Execute(SQL1)
			
			
			RS.MoveNext
			LOOP
		RS.CLOSE 
		
		
		
	NEXT

%>
END 