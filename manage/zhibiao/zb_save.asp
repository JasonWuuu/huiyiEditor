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
	Response.Redirect ("zb_main.asp")
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

    
		 s_zbmc = request("zbmc")
		 s_zbdw =  request("zbdw")
		 s_zbsx = request("zbsx")
		 s_zbxx = request("zbxx")
		 s_zbgs = request("zbgs")
		 s_zbpgyy = request("zbpgyy")
		 s_zbpdyy = request("zbpdyy")
		 s_ZBBCSM = request("ZBBCSM")
		 s_dyjb = request("dyjb")
		 s_cjzb = request("cjzb")
		
	
		XTH="<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-size: 16px;font-family: ΢���ź�, 'Microsoft YaHei';'>"
		XTHJW = "</span></p>"
		
		 s_XMCG_GJ=replace(s_XMCG_GJ,chr(13),XTHJW & XTH)
		 s_XMCG_GJ = XTH & s_XMCG_GJ & XTHJW
	


	'���ж�һ�����ҽԺ�����ڿ������ݱ��Ƿ����

		 	SQL = "SELECT TOP 1 * FROM D_BODYREPORT WHERE ZBMC = '" & S_ZBMC & "' "
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 Then
					Response.Write "��¼�����ظ�"
					Response.End 
					END IF
				RS.Close 


				
				WB_FILE_NO = "B" & ID_NAME("ZB")
					
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM D_BODYREPORT"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("NO") = WB_FILE_NO
	  				RS1("zbmc") = s_zbmc
	  				RS1("zbdw") = s_zbdw
	  				RS1("zbsx") = s_zbsx
					  RS1("zbxx") = s_zbxx
						RS1("zbgs") = s_zbgs
						RS1("zbpgyy") = s_zbpgyy
						RS1("zbpdyy") = s_zbpdyy
						RS1("ZBBCSM") = s_ZBBCSM
						RS1("dyjb") = s_dyjb
						RS1("CJZB") = S_cjzb
						RS1("USER_NAME") = Request.Cookies("user_name")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				
					
					
%>
<html>
<head>
<title>�������������ӳɹ�</title>
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
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="zb_main.asp" name="un" >
   <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ƣ�</td>
      <td width="79%" class="main"> 
       <%=s_zbmc%>
       
          </td>
    </tr>
	  
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�굥λ��</td>
      <td width="79%" class="main"> 
       
        <%=s_zbdw%>
          </td>
    </tr>
	  
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
       <%=s_zbsx%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
        <%=s_zbxx%>
        
          </td>
    </tr>
	  
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�������</td>
      <td width="79%" class="main"> 
         <%=s_zbgs%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
          
			   <%=s_zbpgyy%>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
        
		   <%=s_zbpdyy%>
      </td>
    </tr>
	  
	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�겹��˵����</td>
      <td width="79%" class="main"> 
       
		   <%=s_ZBBCSM%>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ��������-�ֿ�����</td>
      <td width="79%" class="main"> 
       
		  <%=s_dyjb%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="add" value="��������">
          <input type="submit" name="home" value="������ҳ">
          <input type="submit" name="search" value="�����ѯ">
        </div>
      </td>
  </table>
</form>
</body>
</html>
