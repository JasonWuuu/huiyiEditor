<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ��޸�����
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
      

  Function check_op(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'�ж�Ȩ��
	SQL = "SELECT * FROM DAKAYI_TABLE WHERE id = '" & REQUEST("id") & "'"
	RS.Open SQL,CONN,adOpenKeyset,adLockReadOnly
		IF RS.RecordCount >0 THEN
		ELSE
		Response.Write "�Բ��𣬱���¼�����޸ģ�ԭ��������Ѿ���˻�����������ļ�¼"
		Response.End 
		END IF
	
	%> 
<html>
<head>
<title>��ǩ��������ϸ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<div align="center"> 
  <p>&nbsp;</p>
  <p><font color="#0000FF" class="main">���ڲ�����ϵͳ������ǩϵͳ��ϸ���� </font></p>
</div>
<hr width="600" size="0">

  <table width="767" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
       <tr bgcolor="#FFFFFF"> 
      
      <td width="13%" class="main">���ϱ��⣺</td>
      <td colspan="3" class="main"><%=rs("info_title")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="14%" class="main">��飺</td>
      <td colspan="3" class="main"> <%
		
		s_info_desc = rs("info_desc")
		s_info_desc= replace(s_info_desc,chr(13),"<p></p>")
		
		response.Write s_info_desc
		
		
		%>
   </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="13%" class="main">�����ַ�����</td>
      <td colspan="3" class="main"><%=rs("info_find")%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="button" name="home" value="�رմ���" onClick=self.close();>
          <input type="submit" name="Submit" value="�޸ļ�¼">
        </div>
      </td>
  </table>
</form>
</body>
</html>
