<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	%> 
<html>
<head>
<title>�����������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<script language="javascript">
function GoToURL()
{
  
  var tURL= "d_class_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
 
  document.location=tURL;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "d_class_add.asp?yy="+document.un.yy.value;
 // var tURL2 = "&no="+document.un.no.value;
  document.location=tURL1;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
   
    if( document.un.class_name.value.length <1) {
      alert("���������д");
      document.un.class_name.focus();
      return false;
   }

	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ�����������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="d_class_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
       <select name="hs_no"  onChange="GoToURL()">
           <%
         if request("yy") <> "" then
			   SQL = "SELECT * FROM HOSPTIAL WHERE HS_NAME LIKE '%" & Request("yy") & "%' or alice_name like '%" & Request("yy") & "%' ORDER BY HS_NAME"
			  else
			   SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
			  end if
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF Request("HS_NO") = RS1("HS_NO") THEN
					%>
					  <option value="<%=RS1("HS_NO")%>" selected><%=RS1("HS_NAME")%></option>
					<%
					ELSE
					
        %>
        <option value="<%=RS1("HS_NO")%>" ><%=RS1("HS_NAME")%></option>
        <%
				END IF
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        </font></small>
		   <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="��ѯ" onClick=GoToURLA();>
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ϼ����</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
          <option value="000">һ�����</option>
          <%
        SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & Request("HS_NO") & "' ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
		   
        <option value="<%=RS1("CLASS_NO")%>" ><%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("--")
		  NEXT
		  %><%=RS1("CLASS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƣ�</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="class_name" value="" size="80"><br>��ֻ����������Σ�ϵͳ�Զ�����ҽԺ����
        </font></small></td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���Ҽ�飺</td>
      <td width="79%" class="main"> 
        <textarea name="class_desc" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ʾ˳��</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="10" value="0"> 
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46" value="100000">
       </td>
    </tr>
	 
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46" value="100000">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46" value="100000">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ҹҺ�����URL��</td>
      <td width="79%" class="main"> 
		 <input type="text" name="url" size="46" value="http://">
       </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ�������ң�</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO DESC"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
		   
        <option value="<%=RS1("FD_NO")%>" ><%
		
		  %><%=RS1("FD_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="�ύ����" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="button" name="home" value="��    ��" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
