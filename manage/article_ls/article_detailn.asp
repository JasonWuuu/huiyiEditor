<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ�������  �� 2002-4-21 ��д
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
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	
	SQL = "SELECT TOP 1 * FROM A_ARTICLE_LS WHERE INFO_NO = '" & REQUEST("INFO_NO") & "'"
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


<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����������������ϵͳ�޸� </font></div>
<hr>

  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
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
        <%=RS("INFO_TITLE")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����⣺</td>
      <td width="79%" class="main">
        <%=RS("SUB_TITLE")%>
       
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��飺</td>
      <td width="79%" class="main"> 
		<style type="text/css">
img {vertical-align:middle}
</style>

		<b><font size="+2"><%=RS("INFO_TITLE")%></font></b><p>

		 <%=rs("info_source")%>
		 		<p></p>
	  <img src="http://img.dakayi.cc/pic/<%=rs("info_file")%>" width="640px">
	  <font size="3">
		<%
		  IF RS("IF_HTML") = "��" THEN
		body = replace(rs("info_desc"),chr(10),"&nbsp;&nbsp;&nbsp;&nbsp;")
		body = replace(body,"1.5em","2.0em")
		body = replace(body,";'>",";'> <font size='+3'>")
		body = replace(body,"</p>","</p></font>")
	  ELSE
		body = RS("INFO_DESC")
	  END IF
		%>
       <%=body%>
		 
		 </font>
		 <hr>
		 <p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>		 Android�ͻ������أ�</span></p></font>
<img src="http://wap.dakayi.cc/images/a1.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	�ر���ʾ������Android��΢������Ļ�г��ֶ����ά��ʱ����ʶ��ǰ��Ļ�����һ����ά�룬���Android΢���û��ڳ���ʶ���ά��ʱ����ȷ��������Ҫʶ��Ķ�ά��������ʾ�����ڵ�ǰ��Ļ�����·�����iOS�û�����Ӱ�죬ֻ�賤������ʶ���ά�뼴�ɡ�</span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	iOS�ͻ������أ�</span></p></font>
<img src="http://wap.dakayi.cc/images/a2.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	�ر���ʾ������Android��΢������Ļ�г��ֶ����ά��ʱ����ʶ��ǰ��Ļ�����һ����ά�룬���Android΢���û��ڳ���ʶ���ά��ʱ����ȷ��������Ҫʶ��Ķ�ά��������ʾ�����ڵ�ǰ��Ļ�����·�����iOS�û�����Ӱ�죬ֻ�賤������ʶ���ά�뼴�ɡ�</span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	
��ע΢�Ź��ںţ�</span></p></font>
<img src="http://wap.dakayi.cc/images/a4.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	�ر���ʾ������Android��΢������Ļ�г��ֶ����ά��ʱ����ʶ��ǰ��Ļ�����һ����ά�룬���Android΢���û��ڳ���ʶ���ά��ʱ����ȷ��������Ҫʶ��Ķ�ά��������ʾ�����ڵ�ǰ��Ļ�����·�����iOS�û�����Ӱ�죬ֻ�賤������ʶ���ά�뼴�ɡ�</span></p></font>
<hr>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	
��ע����΢����</span></p></font>
<img src="http://wap.dakayi.cc/images/a3.png" width="100%">
<p></p>
<font size="3">
<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: ΢���ź�, 'Microsoft YaHei';'>	�ر���ʾ������Android��΢������Ļ�г��ֶ����ά��ʱ����ʶ��ǰ��Ļ�����һ����ά�룬���Android΢���û��ڳ���ʶ���ά��ʱ����ȷ��������Ҫʶ��Ķ�ά��������ʾ�����ڵ�ǰ��Ļ�����·�����iOS�û�����Ӱ�죬ֻ�賤������ʶ���ά�뼴�ɡ�</span></p></font>
<hr>

<img src="http://wap.dakayi.cc/images/about.png" width="100%">




      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ƵURL��</td>
      <td width="79%" class="main"> 
       <%=rs("sp_url")%>
     
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
       <%=rs("info_find")%>
     
       
      </td>
    </tr>
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
        <%=rs("info_source")%>
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ֻ�ͼƬ��</td>
      <td width="79%" class="main"> 
		 <%=rs("info_file")%><font color=red>����С��ͼƬ100X100�ģ�����Ϊ��</font>
       </td>
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
      <td width="21%" class="main">�����Ŀ��</td>
      <td width="79%" class="main"> 
		 <%
			SQL = "SELECT * FROM A_CLASS ORDER BY CLASS_NO"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="class_corre" value="<%=RS1("class_no")%>"  <%=IF_OPA(s_class_corre,RS1("CLASS_NO"))%>><%=RS1("Class_NAME")%>
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
			SQL = "SELECT * FROM A_ZHUANTI ORDER BY NUM"
			RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
				DO WHILE NOT RS1.EOF 
				%>
				<input type="checkbox" name="zhuanti" value="<%=RS1("zt_name")%>"  <%=IF_OPA(rs("zhuanti"),RS1("zt_name"))%>><%=RS1("ZT_NAME")%>
				<%
				RS1.MoveNext 
				LOOP
			RS1.Close 
		%>
		 
		 
		 
       </td>
		 </tr>
		  <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">�ƹ��ַ��</td>
      <td width="68%" class="main"> 
     http://www.dakayi.cc/article/X<%=REQUEST("INFO_NO")%>.html
        
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
	 <td width="32%" class="main">�����ƹ�:</td>
      <td width="68%" class="main"> 
     <a href="http://zhanzhang.baidu.com/linksubmit/url" target='_blank'>�򿪰ٶ��ƹ�</a> �������������ַ�����ύ��
        
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
         <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>