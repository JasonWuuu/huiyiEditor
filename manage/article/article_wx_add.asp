<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	%> 
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<script language="javascript">

var lsdz = "";
function checkIn()
{
     if( document.un.class_no.options[document.un.class_no.selectedIndex].value <1) {
      alert("������ѡ��");
      document.un.b_id.focus();
      return false;
   }
    
   
   
    if( document.un.info_title.value.length <1) {
      alert("���������д");
      document.un.info_title.focus();
      return false;
   }
  if( document.un.sub_title.value.length <1) {
      alert("�����������д");
      document.un.sub_title.focus();
      return false;
   }

	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="article_wx_save.asp" name="un">
  <table width="953" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
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
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ϱ��⣺</td>
      <td width="79%" class="main">
       
         <textarea name="info_title" rows="10" cols="60"></textarea>������#�ŷֿ�
           <input type="radio" name="colorxz" checked value="">
            ����
             <input type="radio" name="colorxz" value="���">
            ���</td>
    </tr>
	  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">΢�����µ�URL��</td>
      <td width="79%" class="main"> 
       <input type="text" name="wx_url" size="80">
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ƵURL��</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url" size="30">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ���HTML��ʽ��</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="��" checked>
        �� 
        <input type="radio" name="if_html" value="��" >
        �� </td>
    </tr>
   
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_source" size="30">
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ֻ�ͼƬ��</td>
      <td width="79%" class="main"> 
		<textarea name="info_file" rows="10" cols="60"></textarea>��#�ŷֿ�����Ӧ����
		 <font color=red>����С��ͼƬ200X200�ģ�����Ϊ��</font>
       </td>
    </tr>
    
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����Ŀ��</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_CLASS WHERE JIBIE=1 ORDER BY NUM DESC"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>" ><%=RS1("Class_NAME")%>
				<%
				'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM DESC"
						RS2.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS2.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS2("class_no")%>" ><%=RS2("Class_NAME")%>
						<%
						RS2.MoveNext 
						LOOP
						RS2.Close 
						%>
						<br>
						<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ר�⣺</td>
      <td width="79%" class="main"> 
		 <%
		 I = 1
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
					IF I = 7 THEN
				Response.Write("<br>")
				I = 1
				END IF
				%>
				<input type="checkbox" name="zhuanti" value="<%=RS1("zt_name")%>"  ><%=RS1("zt_NAME")%>
				<%
				I = I + 1
					RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ�����</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_bw" value="��">
        �� 
        <input type="radio" name="if_bw" value="��" checked>
        �� </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ��Ƽ���</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_tj" value="��">
        �� 
        <input type="radio" name="if_tj" value="��" checked>
        �� </td>
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
