<!-- #include virtual = "/include/mylib.asp" -->
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'���ߣ�������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ���
'���������ű��κ��˲�����ԭ�������Լ�ɾ���Լ��ļ�¼

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("/manage/admin_default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("a_class_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
	
	CAOZUO = TRIM(REQUEST("CAOZUO"))
	POP = INSTR(CAOZUO,",")
		I = 0
		WHILE POP >0
			LK(I) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			I = I + 1
		WEND
		LK(I)=TRIM(MID(CAOZUO,1))
	FOR J = 0 TO I
		
	  SQL = "SELECT * FROM A_CLASS WHERE CLASS_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN

			SQL = "DELETE FROM  A_CLASS WHERE CLASS_NO = '" & LK(J) & "'"
			CONN.Execute (SQL)
		
			END IF
		RS.Close 
	
	NEXT
END IF
'��ѯ
	IF REQUEST("CLASS_NO") <> "" THEN
		MYA = " AND P_CLASS_NO LIKE '%" & REQUEST("CLASS_NO") & "%' "
		ELSE
		MYA = " "
		END IF

	
	IF REQUEST("CLASS_NAME") <> "" THEN
	MYB = " AND CLASS_NAME LIKE  '%" & REQUEST("CLASS_NAME") & "%' "
	END IF
	
	SQL = "SELECT * FROM A_CLASS WHERE JIBIE=1  " & MYA & MYB  & " ORDER BY NUM "
	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				IF REQUEST("PageNo") = "" THEN
				PageNo = Request("PageNo")
				
				if PageNo <> "" Then
					
				else
					PageNo=1
				
				End if
				ELSE
				PageNo = Request("PageNo1")
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
<script language="javascript">
var lsdz = "";
function checkIn()
{    
   if(confirm("���������Ҫɾ����ѡ��ļ�¼��?"))
      return true
   else
      return false;
}
</script>
<p align="center" class="main">�ڲ���������ϵͳ���ݣ�ÿҳ20����¼�� 
<form method="post" action="a_class_search.asp" name="un">
  <input type=hidden name="class_no" value="<%=REQUEST("class_no")%>">
  <input type=hidden name="class_name" value="<%=REQUEST("class_name")%>">
 
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">ɾ��</font></div>
      </td>
      <td width="5%"><font color="#0000FF">�޸�</font></td>
    
      <td width="9%"><font color="#0000FF">��Ŀ����</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
	   <td width="11%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">���ͼ��</font></div>
      </td>
    </tr>
    <%
		'�ж���ʾ����ҳ��
			RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 200
			IF AA = 0 THEN
			PAGE = INT(RECO/200)
			ELSE
			PAGE = INT(RECO/200)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 200	'ÿҳһ10��
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		  %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("class_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="a_class_modi.asp?class_no=<%=RS("class_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
      <td width="5%" height="34"><%=RS("class_name")%> </td>
	    <td width="9%" height="34"><%=RS("num")%> 
		<td width="9%" height="34"><%=RS("tuijian")%> 
	    <td width="9%" height="34"><%=RS("icon")%> 
        
      </td>
     
    </tr>
    <%
			SQL1  = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS("CLASS_NO") & "' AND CLASS_NO <>'" & RS("CLASS_NO") & "' ORDER BY NUM "
				RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
					Do While Not RS1.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS1("class_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="a_class_modi.asp?class_no=<%=RS1("class_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
      <td width="5%" height="34">--><%=RS1("class_name")%> </td>
	    <td width="9%" height="34"><%=RS1("num")%> 
		<td width="9%" height="34"><%=RS("tuijian")%> 
	    <td width="9%" height="34"><%=RS1("icon")%> 
        
      </td>
     
    </tr>
	  <%
			SQL2  = "SELECT * FROM A_CLASS WHERE P_CLASS_NO = '" & RS1("CLASS_NO") & "' AND CLASS_NO <>'" & RS1("CLASS_NO") & "' ORDER BY NUM "
				RS2.Open SQL2,CONN,adOpenKeyset ,adLockReadOnly
					Do While Not RS2.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS2("class_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="a_class_modi.asp?class_no=<%=RS2("class_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
      <td width="5%" height="34">-->--><%=RS2("class_name")%> </td>
	    <td width="9%" height="34"><%=RS2("num")%> 
		<td width="9%" height="34"><%=RS("tuijian")%> 
	    <td width="9%" height="34"><%=RS2("icon")%> 
        
      </td>
     
    </tr>
	 
    <%
	 
				RS2.MoveNext
				Loop
				RS2.Close 
	 
				RS1.MoveNext
				Loop
				RS1.Close 

			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
  </table>
  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">�ܼƣ�</font></div>
      </td>
      <td width="11%"><font color="#000000"><font color=red><%=PAGE%></font>ҳ</font></td>
      <td width="11%"> 
        <div align="center">��ǰ<font color=red><%=PageNo%></font>ҳ</div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="��ҳ">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Del" value="ɾ��" onClick="return checkIn();">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="����" onClick=history.back()>
          </font></div>
      </td>
      <td width="20%"> 
        <div align="center"><font color="#000000">��ʾ 
          <input type="text" name="PageNo" size="4" maxlength="6">
          ҳ 
          <input type="submit" name="Search" value="Go">
          </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) >1 THEN
                %><a href="a_class_search.asp?class_no=<%=request("class_no")%>&class_name=<%=request("class_name")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %> <a href="a_class_search.asp?class_no=<%=request("class_no")%>&class_name=<%=request("class_name")%>&PageNo=<%=PageNo+1%>&search=all">��һҳ 
         </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
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