<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/wsql.asp" -->

<%
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<%
	IF Request.Form ("USER_name") <> "" AND Request.Form ("user_PASS") <> "" THEN
			SQL = "SELECT * FROM PERSON WHERE USER_NAME = '" & Request.Form ("USER_NAME") & "' AND USER_PASS = '" & Request.Form ("USER_PASS") & "'"
			RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				IF RS.RecordCount >0 THEN
			
				'�û�������Ϸ� 
				Response.Cookies ("user_name") = Request.Form ("USER_name")
				Response.Cookies ("user_pass") = Request.Form ("user_PASS")
				Response.Redirect ("admin_default.ASP")
				ELSE
				Response.Redirect ("user_login.ASP")
			END IF
		
	ELSE
	'�û�����Ĳ�����
			
	Response.Redirect ("user_login.ASP")
	END IF
%>