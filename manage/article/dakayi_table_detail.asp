<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
	'作者：马洪岩  于 2002-4-21 编写
	'功能：修改文章
	'操作：本脚本操作人员操作
 
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
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'判断权限
	SQL = "SELECT * FROM DAKAYI_TABLE WHERE id = '" & REQUEST("id") & "'"
	RS.Open SQL,CONN,adOpenKeyset,adLockReadOnly
		IF RS.RecordCount >0 THEN
		ELSE
		Response.Write "对不起，本记录不能修改，原因可能是已经审核或则不是您输入的记录"
		Response.End 
		END IF
	
	%> 
<html>
<head>
<title>标签与文章详细内容</title>
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
  <p><font color="#0000FF" class="main">（内部资料系统管理）标签系统详细内容 </font></p>
</div>
<hr width="600" size="0">

  <table width="767" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
       <tr bgcolor="#FFFFFF"> 
      
      <td width="13%" class="main">资料标题：</td>
      <td colspan="3" class="main"><%=rs("info_title")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="14%" class="main">简介：</td>
      <td colspan="3" class="main"> <%
		
		s_info_desc = rs("info_desc")
		s_info_desc= replace(s_info_desc,chr(13),"<p></p>")
		
		response.Write s_info_desc
		
		
		%>
   </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="13%" class="main">查找字符串：</td>
      <td colspan="3" class="main"><%=rs("info_find")%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="button" name="home" value="关闭窗口" onClick=self.close();>
          <input type="submit" name="Submit" value="修改记录">
        </div>
      </td>
  </table>
</form>
</body>
</html>
