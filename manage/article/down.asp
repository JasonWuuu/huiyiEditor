<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->
<%
          

'��ȡƷ��
	
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
'--�������������ɵ�EXCEL�ļ������µĴ�� 
filename = Server.MapPath("order.xls") 
'--���ԭ����EXCEL�ļ����ڵĻ�ɾ���� 
if fs.FileExists(filename) then 
   fs.DeleteFile(filename) 
end  if 
'--����EXCEL�ļ� 
set myfile = fs.CreateTextFile(filename,true) 


strSql = "select info_no,info_title from a_article where  RE_DATE>='2017-9-1' ORDER BY RE_DATE "
rs.open strSql,conn,1,1




if not rs.EOF and not rs.BOF then 
  
   dim  trLine,responsestr 
   strLine=""
   For each x in rs.fields 
     strLine = strLine & x.name & chr(9) 
   Next
  
'--�����������д��EXCEL 
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
Response.Write  "����EXCEL�ļ��ɹ������<a href='/' rel='external nofollow' order.xls' target='_blank'>���أ�"
rs.Close 
set rst = nothing
Conn.Close
Set Conn = nothing
%>