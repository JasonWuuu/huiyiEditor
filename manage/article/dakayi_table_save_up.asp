<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

<%
'���ߣ������  �� 2002-4-21 ��д
'���ܣ��޸����µı���
'���������ű�������Ա����

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
      




	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("dakayi_table_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%
   
		 s_info_title =  request("info_title")
		 s_info_desc =  request("info_desc")
		 s_info_find =  request("info_find")
		

	  			
	  			SQL = "SELECT * FROM DAKAYI_TABLE WHERE ID = '" & request("id") & "'"
	  			RS1.Open SQL,CONN,adOpenKeyset,adLockOptimistic 
	  				IF RS1.RecordCount >0 THEN
	  				'���Ƿ���HTML
	  						RS1.MoveFirst 
	  					RS1("INFO_TITLE") = s_info_title
							RS1("INFO_DESC") = s_info_desc
	  					RS1("INFO_FIND") = s_info_find 
	  					RS1.UpdateBatch
	  					RS1.UpdateBatch
	  					RS1.Close 
	  				
						END IF
	  			
			
%>
<html>
<head>
<title>��ǩ�������޸ĳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ������ǩϵͳ�޸ĳɹ� </font></div>
<hr>
<form method="POST" action="dakayi_table_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���ϱ��⣺</td>
      <td width="68%" class="main"><small><font face="Verdana"> 
      <%=s_info_title%>
        </font></small></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">��飺</td>
      <td width="68%" class="main"> 
       <%
		 s_info_desc= replace(s_info_desc,chr(13),"<p></p>")
		
		response.Write s_info_desc
		 %>
      
      </td>
    </tr>
      <tr bgcolor="#FFFFFF">
      <td width="32%" class="main">�����ַ�����</td>
      <td width="68%" class="main">
      <%=s_info_find%>
        
      </td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="button" name="add" value="�رմ���" onclick=self.close();> 
          <input type="submit" name="home" value="������ҳ">
          <input type="submit" name="search" value="�����ѯ">
        </div>
      </td>
  </table>
</form>
</body>
</html>
