<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS3 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	
	SQL = "SELECT TOP 1 * FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	
	
	%> 
<html>
<head>
<title>�����޸�</title>
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


	
	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ�޸� </font></div>
<hr>
<form method="POST" action="article_save_up.asp" name="un">
<input type="hidden" name="info_no" value="<%=Request("info_no")%>">
  <table width="953" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
           <%
        SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF RS1("CLASS_NO") = RS("CLASS_NO") THEN
        %>
        <option value="<%=RS1("CLASS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("CLASS_NO")%>" >
				<%
				END IF
				%>
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
        <input type="text" name="info_title" size="50" value="<%=RS("INFO_TITLE")%>">
      
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����⣺</td>
      <td width="79%" class="main">
        <input type="text" name="sub_title" size="50" value="<%=RS("SUB_TITLE")%>">
      
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��飺</td>
      <td width="79%" class="main"> 
		<%
		INFO_DESC=RS("INFO_DESC")
		INFO_DESC = REPLACE(INFO_DESC,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>",chr(13))
		INFO_DESC = REPLACE(INFO_DESC,"</span></p>",chr(13))
				
		%>
        <textarea name="info_desc" rows="10" cols="60"><%=INFO_DESC%></textarea>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ƵURL��</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url" size="30" value="<%=rs("sp_url")%>">
     
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ƶ��URL��</td>
      <td width="79%" class="main"> 
        <input type="text" name="sp_url_out" size="30" value="<%=rs("sp_url_out")%>">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_source" size="30" value="<%=rs("info_source")%>">
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ֻ�ͼƬ��</td>
      <td width="79%" class="main"> 
		 <input type="text" name="info_file" size="16" value="<%=rs("info_file")%>"><font color=red>����С��ͼƬ100X100�ģ�����Ϊ��</font>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����Ŀ��</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_CLASS WHERE JIBIE=1 ORDER BY NUM "
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS1("CLASS_NO"))%>><%=RS1("Class_NAME")%>
				<%
				'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM "
						RS2.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS2.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS2("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS2("CLASS_NO"))%>><%=RS2("Class_NAME")%>
						<%
						'XIAO LEIBIE
					SQL = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS2("CLASS_NO") & "' AND CLASS_NO <>'" & RS2("CLASS_NO") & "' ORDER BY NUM "
						RS3.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
						DO WHILE NOT RS3.EOF
						%>
						<input type="checkbox" name="class_corre" value="<%=RS3("class_no")%>"  <%=IF_OPA(RS("CLASS_CORRE"),RS3("CLASS_NO"))%>><%=RS3("Class_NAME")%>
						<%
						RS3.MoveNext 
						LOOP
						RS3.Close 
						
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
      <td width="21%" class="main">�����Ŀ��</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="zt_name" value="<%=RS1("zt_name")%>"  <%=IF_OPA(RS("ZHUANTI"),RS1("zt_name"))%>><%=RS1("zt_NAME")%>
				<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
		 </tr>
		   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ�HTML��</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="��" <%=check_op("��",rs("if_html"))%>>
        �� 
        <input type="radio" name="if_html" value="��" <%=check_op("��",rs("if_html"))%>>
        �� </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ�����</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_bw" value="��" <%=check_op("��",rs("if_bw"))%>>
        �� 
        <input type="radio" name="if_bw" value="��" <%=check_op("��",rs("if_bw"))%>>
        �� </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ��Ƽ���</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_tj" value="��" <%=check_op("��",rs("if_tj"))%>>
        �� 
        <input type="radio" name="if_tj" value="��" <%=check_op("��",rs("if_tj"))%>>
        �� </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ڣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="re_date" size="30" value="<%=rs("re_date")%>">
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
