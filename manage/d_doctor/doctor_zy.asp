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
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			MY_HS_NO = RS("HS_NO")
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
		
	%> 
<html>
<head>
<title>ҽ�����ִҽ</title>
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
  
  var tURL= "doctor_zy.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "&no="+document.un.no.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_zy.asp?yy="+document.un.yy.value;
  var tURL2 = "&no="+document.un.no.value;
  document.location=tURL1+tURL2;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
      if( document.un.class_no.options[document.un.class_no.selectedIndex].value <1) {
      alert("���ұ���ѡ��");
      document.un.class_no.focus();
      return false;
   }
    
    if( document.un.hs_no.options[document.un.hs_no.selectedIndex].value <1) {
      alert("ҽԺ����ѡ��");
      document.un.hs_no.focus();
      return false;
   }
    
   
  
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>


<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ�޸ģ�*�������㼨Ч���� </font></div>
<%
SQL2 = "SELECT * FROM ZYDD WHERE NO = '" & REQUEST("NO") & "'"
RS2.Open SQL2,CONN,1,1
	
%>
<table width="1200" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#CCCCCC"> 
      
    <td width="4%"> 
      <div align="center"><font color="#0000FF">ɾ��</font></div>
      </td>
  
      
    <td width="19%"> 
      <div align="center"><font color="#0000FF">ҽԺ</font></div>
      </td>
		
    <td width="7%"> 
      <div align="center"><font color="#0000FF">����</font></div>
      </td>
      
    <td width="8%"> 
      <div align="center"><font color="#0000FF">����</font></div>
      </td>
      <td width="8%"> 
      <div align="center"><font color="#0000FF">����ʱ��</font></div>
      </td>
    <td width="10%"> 
      <div align="center"><font color="#0000FF">˳��</font></div>
      </td>
     
    </tr>
    <%
	
		Do While Not RS2.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      
    <td width="4%" height="34"> 
      <div align="center"> 
           <a href="doctor_zy_dele.asp?id=<%=RS2("id")%>&no=<%=rs2("no")%>">Go!</a> </div>
      </td>
      
    
    <td width="8%" height="34"> 
      <div align="center"><%=display_name("hosptial",RS2("hs_no"),"hs_no","hs_name")%></div>
      </td>
		  <td width="8%" height="34"> 
      <div align="center"><%=display_name("d_class",RS2("class_no"),"class_no","class_name")%></div>
      </td>
    <td width="10%" height="34"> 
      <div align="center"><%=display_name("d_doctor",RS2("no"),"no","xm")%></div>
      </td>
    	<td width="10%" height="34"> 
      <div align="center"><%=rs2("worktime")%></div>
      </td>
    	 
    <td width="7%" height="34"> 
      <div align="center"><%=rs2("num")%></div>
      </td>
	  
       </tr>
    <%
			RS2.MoveNext
		
			Loop
			RS2.Close 
			%> 
  </table>



<hr>
<form method="POST" action="doctor_zy_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main"> 
        <select name="hs_no"  onChange="GoToURL()">
          <%
			 
			 
         if request("yy") <> "" then
			   SQL = "SELECT * FROM HOSPTIAL WHERE HS_NAME LIKE '%" & Request("yy") & "%' or alice_name like '%" & Request("yy") & "%' ORDER BY HS_NAME"
			  else
			   SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
			  end if
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF REQUEST("HS_NO") <> "" THEN
					%>
									<%
									IF RS1("HS_NO") = REQUEST("HS_NO") THEN
						  %>
						  <option value="<%=RS1("HS_NO")%>" selected>
								<%
								ELSE
								%>
								<option value="<%=RS1("HS_NO")%>" >
								<%
								END IF
								%>
								  <%=MID(RS1("HS_NAME"),1,50)%></option>
					<%
					ELSE
					IF RS1("HS_NO") = RS("HS_NO") THEN
        %>
        <option value="<%=RS1("HS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("HS_NO")%>" >
				<%
				END IF
				%>
		  
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
        <%
				END IF
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
         <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="��ѯ" onClick=GoToURLA();> &nbsp;&nbsp;<a href="/manage/hosptial/hosptial_add.asp" target="_blank">����ҽԺ</a>
          </td>
    </tr>   
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ң�</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
          <%
			 IF REQUEST("HS_NO") <> "" THEN
			 SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & REQUEST("HS_NO") & "' ORDER BY CLASS_NAME"
			 ELSE
			 SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & MY_HS_NO & "'ORDER BY CLASS_NAME"
			 END IF
        
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
		  <%=MID(RS1("CLASS_NAME"),1,50)%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>&nbsp;&nbsp;<a href="/manage/d_class/d_class_add.asp" target="_blank">���ӿ���</a>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ʱ�䣺(*)</td>
      <td width="79%" class="main"> 
        <input type="text" name="worktime" size="50" value="">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">˳��(*)</td>
      <td width="79%" class="main"> 
          <select name="num" >
  <option value="1" selected> 1</option>
        <option value="2" > 2</option>
		   <option value="3" > 3</option>
			<option value="4" > 4</option>
			<option value="5" > 5</option>
			<option value="6" > 6</option>
			<option value="7" > 7</option>
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
