<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ���
'���������ű��κ��˲�����ԭ�������Լ�ɾ���Լ��ļ�¼

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("/manage/admin_default.asp")
	END IF

	%> 

<html>
<head>
<title>�ڲ�����������-����ѯϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>

<p align="center" class="main">�ڲ���������ϵͳ���ݣ���Ŀͳ�������� 

 
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
     
      <td width="9%"><font color="#0000FF">���ҷ���</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽ����Ŀ</font></div>
      </td>
       <td width="11%"> 
        <div align="center"><font color="#0000FF">������Ŀ</font></div>
      </td>
    </tr>
    <%
			SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NO"
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF
					SQL1 = "SELECT COUNT(*) AS TOTAL FROM D_DOCTOR WHERE CLASS_NO LIKE  '" & RS("CLASS_NO") & "%'"
						RS1.Open SQL1,CONN,1,1
							IF RS1.RecordCount >0 THEN
								MY_TOTAL = RS1("TOTAL")
							ELSE
								MY_TOTAL = 0
							END IF
						RS1.CLOSE 
						
						SQL1 = "SELECT COUNT(*) AS TOTAL FROM D_OFFICE WHERE CLASS_NO LIKE  '" & RS("CLASS_NO") & "%'"
						RS1.Open SQL1,CONN,1,1
							IF RS1.RecordCount >0 THEN
								NY_TOTAL = RS1("TOTAL")
							ELSE
								NY_TOTAL = 0
							END IF
						RS1.CLOSE 
						
						
						%>
						 <tr bgcolor="#FFFFFF"> 
      
      <td width="5%" height="34"><%=RS("class_name")%> </td>
	    <td width="9%" height="34"><%=MY_TOTAL%> 
        <div align="center"></div>
		    <td width="9%" height="34"><%=NY_TOTAL%> 
        <div align="center"></div>
      </td>
     
    </tr>
						<%
				RS.MoveNext
				LOOP
			RS.CLOSE 
    %> 
   
  </table>
  
</form>
</body>
</html>

