<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 
'作者：马洪岩  于 2002-4-21 编写
'功能：文章的确认
'操作：本脚本由部门经理以上操作

 '判断级别
 	set CONN = Server.CreateObject("ADODB.Connection")
	CONN.open CONNSTR,"",""  
    set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'判断权限

	%>


<%

'去掉字符串头尾的连续的回车和空格 
function trimVBcrlf(str) 
trimVBcrlf=rtrimVBcrlf(ltrimVBcrlf(str)) 
end function 

'去掉字符串开头的连续的回车和空格 
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

'去掉字符串末尾的连续的回车和空格 
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
	Response.Redirect ("article_main.asp")
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



	SQL = "UPDATE A_ARTICLE SET IF_TJ = '" & REQUEST("IF_TJ") & "' WHERE INFO_NO = '" & Request("info_no") & "'"
		CONN.Execute(SQL)

		
%>	
<html>
<head>
<title>内容与文章审核结果</title>
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
  <p>&nbsp;</p>
  <p><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统审核结果</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un" >
  <table width="400" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="0" class="main">
    <tr> 
      <td colspan="2"><font color="#0000FF">审核记录，请确信您已经仔细的阅读了该篇文章</font></td>
    </tr>
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td width="98">目前状态：</td>
      <td width="296">
      <%=request("IF_TJ")
      %></td>
    </tr>
   
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="2">
        <div align="center">
          <input type="button" name="Button" value="关闭窗口" onclick=self.close();>
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
