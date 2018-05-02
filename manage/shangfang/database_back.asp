<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->

<% 
response.Charset = "utf-8" 

Session.Codepage = 65001 

Response.Buffer=true 

Response.Clear 

'根据你的情况修改用户名和密码 


set conn=server.createobject("adodb.connection") 

conn.open dbconnstr

conn.Execute ("DUMP TRANSACTION  shangfang with no_log")

bkfname=server.mappath("database.zip") 

sqlstr="backup database shangfang to disk='"+bkfname+"' with init" 

conn.execute sqlstr 

conn.close 

response.Write "数据库备份成功! " 

response.Write "<a href=database.zip>点击下载到本地保存</a>" 

response.end 

'如果想直接备份并下载，可以加上下边的这部分，就会备份后自动保存。但是弹出的文件是.asp的文件，修改下就OK。 

set fn=server.createobject("adodb.stream") 

fn.mode=3 '读写 

fn.type=1 '数据类型为：adTypeBinary 

fn.open 

fn.LoadFromFile bkfname '将bkfname指定的文件装入对像中 

Response.ContentType="application/octet-stream" 

Response.BinaryWrite fn.read 

fn.close
%>