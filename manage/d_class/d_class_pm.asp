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

    '���ҵ�����
	 DIM LK(100) 
	 
	 LK(1) = "�����"
	 LK(2) = "�����"
	 LK(3) = "��Ⱦ��"
	 LK(4) = "���Ǻ��"
	 LK(5) = "������"
	 LK(6) = "��ʪ��"
	 LK(7) = "������"
	 LK(8) = "�ǿ�"
	 LK(9) = "��ǻ��"
	 LK(10) = "�������"
	 LK(11) = "�ڷ���"
	 LK(12) = "Ƥ����"
	 LK(13) = "��ͨ���"
	 LK(14) = "���ڿ�"
	 LK(15) = "���ಡ"
	 LK(16) = "�����"
	 LK(17) = "������"
	 LK(18) = "С���ڿ�"
	 LK(19) = "С�����"
	 LK(20) = "��Ѫ�ܲ�"
	 LK(21) = "�����"
	 LK(22) = "�����"
	 LK(23) = "ѪҺѧ"
	 LK(24) = "�ۿ�"
	 LK(25) = "�������"
	 LK(26) = "����ѧ"
	 LK(27) = "����ҽѧ"
	 LK(28) = "��ҽѧ"
	 LK(29) = "���˿�"
	 LK(30) = "����ҽѧ"
	 LK(31) = "����ҽѧ"
	 LK(32) = "����ҽѧ"
	 LK(33) = "����ҽѧ"
	 LK(34) = "�����"
	
	 
	 FOR I =1 TO 34
	 
	 SQL = "SELECT * FROM MY_HOSPTIAL WHERE " & LK(I) & " >0"
		RS.Open SQL,CONN,1,1
			DO WHILE NOT RS.EOF
			SQL1 = "UPDATE D_CLASS SET BD_PM = " & RS(LK(I)) & ",QG_PM = " & RS(LK(I)) & " WHERE CLASS_NAME = '" & RS("ҽԺ����") & "-" & LK(I) & "'"
			CONN.Execute(SQL1)
			
			
			SQL1 = "UPDATE D_CLASS SET BD_PM = " & RS(LK(I)) & ",QG_PM = " & RS(LK(I)) & " WHERE CLASS_NAME LIKE '" & RS("ҽԺ����") & "%' AND CLASS_NAME LIKE '%" & LK(I) & "%' AND BD_PM=0 AND QG_PM=0"
			CONN.Execute(SQL1)
			
			
			RS.MoveNext
			LOOP
		RS.CLOSE 
		
		
		
	NEXT

%>
END 