<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->

<% 
response.Charset = "utf-8" 

Session.Codepage = 65001 

Response.Buffer=true 

Response.Clear 

'�����������޸��û��������� 


set conn=server.createobject("adodb.connection") 

conn.open dbconnstr

conn.Execute ("DUMP TRANSACTION  shangfang with no_log")

bkfname=server.mappath("database.zip") 

sqlstr="backup database shangfang to disk='"+bkfname+"' with init" 

conn.execute sqlstr 

conn.close 

response.Write "���ݿⱸ�ݳɹ�! " 

response.Write "<a href=database.zip>������ص����ر���</a>" 

response.end 

'�����ֱ�ӱ��ݲ����أ����Լ����±ߵ��ⲿ�֣��ͻᱸ�ݺ��Զ����档���ǵ������ļ���.asp���ļ����޸��¾�OK�� 

set fn=server.createobject("adodb.stream") 

fn.mode=3 '��д 

fn.type=1 '��������Ϊ��adTypeBinary 

fn.open 

fn.LoadFromFile bkfname '��bkfnameָ�����ļ�װ������� 

Response.ContentType="application/octet-stream" 

Response.BinaryWrite fn.read 

fn.close
%>