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
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("hosptial_add.asp")
	END IF
	%> 
<%

	SQL = "SELECT top 10000 NO,ZXLY,USER_NAME,XM,CLASS_NO,HS_NO,YSCLASS,XSZW_GJA FROM D_DOCTOR WHERE NO>'D103000' ORDER BY NO"
	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly

				
				
%>

<html>
<head>
<title>ҽԺ���ϲ�ѯϵͳ</title>
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

<p align="center" class="main">�ڲ���������ϵͳ���ݣ�ÿҳ20����¼�� 
<form method="post" action="hosptial_search.asp" name="un">
  
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">ҽ�����</font></div>
      </td>
      <td width="5%"><font color="#0000FF">��Ѷ��Դ</font></td>
      
      <td width="9%"><font color="#0000FF">¼����Ա</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽ������</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">ѧ��ְ�񣺹��Ҽ�</font></div>
      </td>
		 <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽ�����</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽԺ</font></div>
      </td>
		 <td width="11%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
    </tr>
    <%
		
		Do While Not RS.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
         <%=RS("no")%>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <%=RS("zxly")%>
        &nbsp; </td>
         <td width="9%" height="34"> <%=RS("user_name")
      
      %> </td>
       <td width="21%" height="34"> 
        <div align="center"><%=RS("xm")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><%=RS("XSZW_GJA")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><%=RS("ysclass")%></div>
      </td>
		 <td width="39%" height="34"> 
        <div align="center"> <%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"hs_NO","hs_NAME")
        %> 
        </div>
      </td>
	   <td width="39%" height="34"> 
        <div align="center"><%=DISPLAY_NAME("D_CLASS",rs("class_no"),"CLASS_NO","CLASS_NAME")
        %> 
        </div>
      </td>
		
       </tr>
    <%
			RS.MoveNext
			Loop
			RS.Close 
			%> 
  </table>
  
</form>
</body>
</html>
