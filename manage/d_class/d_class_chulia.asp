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

    
		 P_CLASS_NO = request("class_no")
		 s_class_name =  request("class_name")
		 s_num = request("num")
		 s_fd_no = request("fd_no")
		
	
			SQL = "SELECT * FROM MY_CLASS"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						SQL1 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NAME = '" & RS("所属医院") & "-" & RS("一级科室") & "'"
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
									'大类别
									
									'查询医院数据库
									SQL2 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & RS("所属医院") & "'"
									RS2.Open SQL2,CONN,1,1
										IF RS2.RecordCount>0 THEN
										HS_NO = RS2("HS_NO")
										END IF
									RS2.CLOSE 
									PM = 0
									
									
										P_CLASS_NO = id_name("CLASS_A")
									
										S_CLASS_NO = P_CLASS_NO 
										SQL2 = "INSERT INTO D_CLASS (P_CLASS_NO,CLASS_NO,CLASS_NAME,NUM,JIBIE,FD_NO,HS_NO,BD_PM,QG_PM) VALUES('" & P_CLASS_NO & "','" & S_CLASS_NO & "','" & RS("所属医院") & "-" & RS("一级科室")  & "',0,1,'" & S_FD_NO & "','" & HS_NO & "'," & PM & "," & PM & ")"
									CONN.Execute(SQL2)
								END IF
							RS1.CLOSE 
		RS.MoveNext
		LOOP

%>
END 