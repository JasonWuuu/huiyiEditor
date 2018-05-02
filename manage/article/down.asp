<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->
<%
          

'获取品种
	
response.Charset="GB2312"
 session.CodePage=936	
	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RS7 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
     
dim s,sql,filename,fs,myfile,x 

Set fs = server.CreateObject("scripting.filesystemobject") 
'--假设你想让生成的EXCEL文件做如下的存放 
filename = Server.MapPath("order.xls") 
'--如果原来的EXCEL文件存在的话删除它 
if fs.FileExists(filename) then 
   fs.DeleteFile(filename) 
end  if 
'--创建EXCEL文件 
set myfile = fs.CreateTextFile(filename,true) 


strSql = "select info_no,info_title from a_article where  RE_DATE>='2017-9-1' ORDER BY RE_DATE "
rs.open strSql,conn,1,1




if not rs.EOF and not rs.BOF then 
  
   dim  trLine,responsestr 
   strLine=""
   For each x in rs.fields 
     strLine = strLine & x.name & chr(9) 
   Next
  
'--将表的列名先写入EXCEL 
   myfile.writeline strLine 
  
   Do while Not rs.EOF 
     strLine=""
  
     for each x in rs.Fields 
       strLine = strLine & x.value &  chr(9) 
     next 
     myfile.writeline  strLine 
  
     rs.MoveNext 
   loop 
  
end if 
Response.Write  "生成EXCEL文件成功，点击<a href='/' rel='external nofollow' order.xls' target='_blank'>下载！"
rs.Close 
set rst = nothing
Conn.Close
Set Conn = nothing
%>