<!-- #include virtual = "/include/wsql.asp" -->
 <!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->

 <%
 
'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ����
'���������ű��κ��˲���

	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("office_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>ҽԺ���Ҳ�ѯ</title>
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

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����ҽԺ���Ҳ�ѯ </font></div>
<hr size="1">
<form method="POST" action="office_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main">��ѯ˵����</td>
      <td colspan="3" class="main">�����ѡ��������ϵͳĬ��ȫ������</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">���ң�</div>
      </td>
      <td width="35%" class="main"> 
         
       <select name="class_no" >
		   <option value="">����</option>
           <%
        SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("CLASS_NO")%>" >
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=RS1("CLASS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
     
      </td>
    
   
		  
		    <td width="14%" class="main"> 
        <div align="right">����ַ���</div>
      </td>
      <td width="34%" class="main">   
       <input type="text" name="info_corre" size="50">
		  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
	    <td width="14%" class="main"> 
        <div align="right">ҽԺ���ƣ�</div>
      </td>
      <td width="34%" class="main"><small><font face="Verdana"> 
       <select name="hs_no" >
		   <option value="">ҽԺ</option>
           <%
        SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("HS_NO")%>" >
		  
		  <%=RS1("HS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        </font></small></td>
      <td width="17%" class="main"> 
        <div align="right">�����ַ�����</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="info_find" size="20">
      </td>
       
    </tr>
    
   
	 <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">��������(>=)��</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="bd_pm1" size="20">
      </td>
       <td width="17%" class="main"> 
        <div align="right">��������(<)��</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="bd_pm2" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">ȫ������(>=)��</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="qg_pm1" size="20">
      </td>
       <td width="17%" class="main"> 
        <div align="right">ȫ������(<)��</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="qg_pm2" size="20">
      </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">������Ա��</div>
      </td>
      <td width="34%" class="main">   
       <select name="username" >
		 <option value="">ȫ��</option>
           <%
        SQL = "SELECT * FROM PERSON"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("user_name")%>" >
		 
		  <%=RS1("user_name")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		  </td>
    
      <td width="17%" class="main"> 
        <div align="right"></div>
      </td>
      <td colspan="3" class="main"> 
        
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="submit" name="search" value="���в�ѯ" >
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="submit" name="home" value="������ҳ">
        </div>
      </td>
  </table>
</form>
</body>
</html>
