<% 
		
		IF Request.Cookies ("user_name") = "" OR Request.Cookies ("user_pass")  = "" THEN
		'Response.Redirect ("/manage/user_login.asp")
		END IF
	
%>