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
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("jibing_add.asp")
	END IF
	%> 
<%
DIM LK(20)
IF REQUEST("INFO_FIND") <>"" THEN
INFO_FIND = REQUEST("INFO_FIND")
ELSE
RESPONSE.Write("���뼲������")
Response.end 
END IF

	CAOZUO = TRIM(REQUEST("CXZD"))
	POP = INSTR(CAOZUO,",")
		I = 0
		WHILE POP >0
			LK(I) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			I = I + 1
		WEND
		LK(I)=TRIM(MID(CAOZUO,1))
		
		
		MYA = " ( ZLTC  LIKE '%" & INFO_FIND & "%' "
		
	FOR J = 0 TO I
	if LK(J) <> "ZLTC" THEN
	MYA = MYA & " OR " & LK(J) & " LIKE '%" & INFO_FIND & "%' "
	END IF
	NEXT
	
	MYA = MYA & ") "
	SQL = "DELETE FROM D_PM"
	CONN.Execute(SQL)
	SQL = "INSERT INTO D_PM SELECT NO,XM,HS_NO,ZLTC,FENSHU FROM D_DOCTOR WHERE NO <> '' AND " & MYA & " ORDER BY JCI_QG_PM"
  CONN.Execute(SQL)
  '����һ�±���
  SQL = "SELECT NO FROM D_DOCTOR WHERE JCIPS LIKE '%" & INFO_FIND & "%' AND XSZW_GJA   LIKE '%" & INFO_FIND & "%' AND GJLY_RZ   LIKE '%" & INFO_FIND & "%'"
  RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		SQL1 = "UPDATE D_PM SET FENSHU = FENSHU + 50000 WHERE NO = '" & RS("NO") & "'"
		CONN.Execute(SQL1)
		RS.MoveNext
		LOOP
	RS.CLOSE 
  SQL = "SELECT NO,XM,HS_NO,ZLTC,FENSHU FROM D_PM  ORDER BY FENSHU DESC"
	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	
				
%>
<html>
<head>
<title>�������ϲ�ѯϵͳ--���ҽ��</title>
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
<form method="post" action="jibing_pm_search.asp" name="un">
  
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
         <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽ������</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">����ҽԺ</font></div>
      </td>
    
   <td width="11%"> 
        <div align="center"><font color="#0000FF">��������</font></div>
      </td>
	   <td width="11%"> 
        <div align="center"><font color="#0000FF">�����س�</font></div>
      </td>
	 <td width="11%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
    </tr>
    <%
	
		Do While Not RS.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
    
       <td width="21%" height="34"> 
        <div align="center"><a href="../d_doctor/doctor_detail.asp?no=<%=rs("no")%>" target="_blank"><%=RS("XM")%></a></div>
      </td>
		<td width="21%" height="34"> 
        <div align="center"><%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")%></div>
		  <p>JCI����</p><%=display_name("D_DOCTOR",rs("NO"),"NO","JCIPS")%>
      </td>
     <td width="21%" height="34"> 
        <div align="center">
		  
		 		  <table width="500" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#FFFFFF"> 
    <td width="8%" class="main"> ҽ����� </td>
    <td width="6%" class="main"> �ֶ����� </td>
    <td width="7%" class="main"> ǰ�ַ� </td>
    <td width="5%" class="main"> ���ַ� </td>
    <td width="4%" class="main"> ��� </td>
    <td width="30%" class="main"> ��� </td>
  </tr>
  <%
	TOTAL=0
	SQL1 = "SELECT DISTINCT ZDMC FROM FENSHU_DESC  WHERE NO = '" & RS("NO") & "' AND NUM>=6000"
	RS1.Open SQL1,CONN,1,1
	
		Do While Not RS1.EOF
			
				SQL = "SELECT * FROM FENSHU_DESC WHERE NO = '" & rs("NO") & "' AND ZDMC = '" & RS1("ZDMC") & "' AND  NUM>=6000"

					RS2.Open SQL,CONN,1,1

					Do While Not RS2.EOF
		
	%> 
  <tr bgcolor="#FFFFFF"> 
    <td width="8%" class="main"> <%=rs("no")%> </td>
    <td width="6%" class="main"> <%=display_name("ZDLB",rs2("zdmc"),"zd","zdmc")%> 
	 
    </td>
    <td width="7%" class="main"> <%=rs2("qzf")%> </td>
    <td width="5%" class="main"> <%=rs2("hzf")%> </td>
    <td width="4%" class="main"> <%
	If rs2("st") = "T" then
	Response.write(rs2("num"))
	
	Else
		Response.write("������")
	
	End if
	%> 
	
	</td>
    <td width="30%" class="main"> <%sjz=replace(rs2("jz"),rs2("qzf"),"<font color=blue>" & rs2("qzf") & "</font>")%> <%sjz=replace(sjz,rs2("hzf"),"<font color=blue>" & rs2("hzf") & "</font>")%><%=sjz%></td>
	
  </tr>
 <%
			RS2.MoveNext
				Loop
			RS2.Close 
			%> 
  <tr bgcolor="#FFFFFF"> 
    <td width="8%" class="main">���ֶ�ԭ������</td>
    <td colspan="5" class="main">
	<%
	SQL2 = "SELECT TOP 1 " & RS1("ZDMC") & " FROM D_DOCTOR WHERE NO = '" & RS("NO") & "'"

					RS2.Open SQL2,CONN,1,1

					IF RS2.RecordCount >0 THEN
					Response.WRITE(RS2(0))
					END IF
			RS2.CLOSE 
	%>
	
	</td>
  </tr>
  <%
			RS1.MoveNext
				Loop
			RS1.Close 
			%> 
</table>

		  </div>
      </td>
	   <td width="21%" height="34"> 
        <div align="center"><%=RS("zltc")%></div>
      </td>
      <td width="21%" height="34"> 
        <div align="center"><%=RS("FENSHU")%></div>
      </td>
       </tr>
    <%
			RS.MoveNext
				Loop
			RS.Close 
			%> 
  </table>
  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">�ܼƣ�</font></div>
      </td>
        <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="��ҳ">
          </font></div>
      </td>
     
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="����" onClick=history.back()>
          </font></div>
      </td>
      
      
    </tr>
  </table>
</form>
</body>
</html>


<%
ELSE
%>
<html>
<head>
<title>û�в�ѯ����¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<p>û�в�ѯ����¼</p>
<p><input type=button name=back value="����" onclick=history.back();></p>
</body>
<%
END IF

%>

