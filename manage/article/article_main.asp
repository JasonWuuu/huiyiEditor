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
	Response.Redirect ("article_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>���������²�ѯ</title>
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

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������������ݲ�ѯ </font></div>
<hr size="1">
<form method="POST" action="article_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main">��ѯ˵����</td>
      <td colspan="3" class="main">�����ѡ��������ϵͳĬ��ȫ������</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">���</div>
      </td>
      <td width="35%" class="main"> 
         
       <select name="class_no" >
		   <option value="">���</option>
           <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
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
        <div align="right">���ϱ��⣺</div>
      </td>
      <td width="34%" class="main">
        <input type="text" name="info_title" size="30">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">�Ƿ���ˣ�</div>
      </td>
      <td width="35%" class="main"> 
          <select name="status" >
		   <option value=""  selected>ȫ��</option>
			<option value="��">��</option>
			<option value="δ">δ</option>
			  </select>
      </td>
       <td width="17%" class="main"> 
        <div align="right">������Դ��</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="info_source" size="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">����ַ���</div>
      </td>
      <td width="34%" class="main">   
       <input type="text" name="info_corre" size="50">
		  </td>
    
      <td width="17%" class="main"> 
        <div align="right">���ݣ�</div>
      </td>
      <td colspan="3" class="main"> 
        <input type="text" name="info_desc" size="50">
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
        <div align="right">�Ƿ�����</div>
      </td>
      <td colspan="3" class="main"> 
         <select name="if_bw" >
		   <option value=""  selected>ȫ��</option>
			<option value="��">��</option>
			<option value="��">��</option>
			  </select>
      </td>
    </tr>
   
	<tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">����ר�⣺</div>
      </td>
      <td width="34%" class="main">   
       <select name="zhuanti" >
		 <option value="">ȫ��</option>
           <%
        SQL = "SELECT ZT_NAME FROM A_ZHUANTI ORDER BY NUM"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("zt_name")%>" >
		 
		  <%=RS1("zt_name")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		  </td>
    
      <td width="17%" class="main"> 
        <div align="right">�Ƿ��Ƽ�&nbsp;</div>
      </td>
      <td colspan="3" class="main"> 
          <select name="if_tj" >
		   <option value=""  selected>ȫ��</option>
			<option value="��">��</option>
			<option value="��">��</option>
			  </select>
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
