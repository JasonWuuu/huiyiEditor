<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

<%
'作者：马洪岩  于 2002-4-21 编写
'功能：修改文章的保存
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
	  				'看是否是HTML
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
<title>标签与文章修改成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）标签系统修改成功 </font></div>
<hr>
<form method="POST" action="dakayi_table_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">资料标题：</td>
      <td width="68%" class="main"><small><font face="Verdana"> 
      <%=s_info_title%>
        </font></small></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">简介：</td>
      <td width="68%" class="main"> 
       <%
		 s_info_desc= replace(s_info_desc,chr(13),"<p></p>")
		
		response.Write s_info_desc
		 %>
      
      </td>
    </tr>
      <tr bgcolor="#FFFFFF">
      <td width="32%" class="main">查找字符串：</td>
      <td width="68%" class="main">
      <%=s_info_find%>
        
      </td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
          <input type="submit" name="home" value="返回主页">
          <input type="submit" name="search" value="进入查询">
        </div>
      </td>
  </table>
</form>
</body>
</html>
