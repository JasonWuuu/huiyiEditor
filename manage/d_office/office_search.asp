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
	Response.Redirect ("office_add.asp")
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
		
	  SQL = "SELECT * FROM D_OFFICE WHERE OFFICE_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM D_OFFICE WHERE OFFICE_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'��ѯ
	IF REQUEST("CLASS_NO") <> "" THEN
		MYA = " AND CLASS_NO = '" & REQUEST("CLASS_NO") & "' "
	
	END IF

	IF REQUEST("info_find") <> "" THEN
	MYB = " AND info_find  '%" & REQUEST("info_find") & "%' "
	END IF
	IF REQUEST("info_source") <> "" THEN
	MYC = " AND info_source LIKE  '%" & REQUEST("info_source") & "%' "
	END IF
	IF REQUEST("info_corre") <> "" THEN
	MYD = " AND info_corre LIKE  '%" & REQUEST("info_corre") & "%' "
	END IF
	IF REQUEST("HS_NO") <> "" THEN
	MYE = " AND HS_NO =  '" & REQUEST("HS_NO") & "' "
	END IF
	
	IF REQUEST("BD_PM1") <> "" THEN
	MYF = " AND BD_PM >=  " & REQUEST("BD_PM1") & " "
	END IF
	IF REQUEST("BD_PM2") <> "" THEN
	MYG = " AND BD_PM <  " & REQUEST("BD_PM2") & " "
	END IF
	IF REQUEST("QG_PM1") <> "" THEN
	MYH = " AND QG_PM >=  " & REQUEST("QG_PM1") & " "
	END IF
	IF REQUEST("QG_PM2") <> "" THEN
	MYI = " AND QG_PM <  " & REQUEST("QG_PM2") & " "
	END IF
	IF REQUEST("username") <> "" THEN
	MYJ = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END IF
	SQL = "SELECT  * FROM D_OFFICE WHERE OFFICE_NO <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & " ORDER BY ID DESC"
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
<title>ҽԺ���Ҳ�ѯϵͳ</title>
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
<p align="center" class="main">ҽԺ����ϵͳ���ݣ�ÿҳ20����¼�� 
<form method="post" action="office_search.asp" name="un">
   <input type=hidden name="class_no" value="<%=REQUEST("class_no")%>">
 <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
  <input type=hidden name="info_corre" value="<%=REQUEST("info_corre")%>">
  <input type=hidden name="hs_no" value="<%=REQUEST("hs_no")%>">
  <input type=hidden name="BD_PM1" value="<%=REQUEST("BD_PM1")%>">
  <input type=hidden name="BD_PM2" value="<%=REQUEST("BD_PM2")%>">
  <input type=hidden name="QG_PM1" value="<%=REQUEST("QG_PM1")%>">
  <input type=hidden name="QG_PM2" value="<%=REQUEST("QG_PM2")%>">
    <input type=hidden name="username" value="<%=REQUEST("username")%>">
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
      <td width="5%"> 
        <div align="center"><font color="#0000FF">ɾ��</font></div>
      </td>
      <td width="5%"><font color="#0000FF">�޸�</font></td>
      
      <td width="9%"><font color="#0000FF">����</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽԺ</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">���</font></div>
      </td>
        <td width="11%"> 
        <div align="center"><font color="#0000FF">�����ַ�</font></div>
      </td>
      <td width="8%"><font color="#0000FF">����ַ�</font></td>
		<td width="8%"><font color="#0000FF">����</font></td>
    </tr>
    <%
		'�ж���ʾ����ҳ��
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
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 20	'ÿҳһ10��
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      <td width="5%" height="34"> 
        <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("OFFICE_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="office_modi.asp?office_no=<%=RS("office_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
         <td width="9%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("D_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "�ڲ�"
      END IF
      %> </td>
      <td width="11%" height="34"> 
        <div align="center"><%=DISPLAY_NAME("HOSPTIAL",RS("HS_NO"),"HS_NO","HS_NAME")%></div>
      </td>
      <td width="21%" height="34"> 
        <div align="center"><a href="office_detail.asp?office_no=<%=RS("office_no")%>" target='blank'><%=RS("office_no")%></a></div>
      </td>
      <td width="9%" height="34"> 
        <div align="center"> <%=RS("INFO_FIND")%></font> 
        </div>
      </td>
      <td width="7%" height="34"><%=RS("INFO_CORRE")%>&nbsp;</td>
      <td width="11%" height="34"> 
        <div align="center"><%=RS("re_date")%></div>
      </td>
       </tr>
    <%
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
                %><a href="office_search.asp?bd_pm1=<%request("bd_pm1")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&class_no=<%=request("class_no")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&hs_no=<%=request("hs_o")%>&username=<%=Request("username")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="office_search.asp?bd_pm1=<%request("bd_pm1")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&class_no=<%=request("class_no")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&hs_no=<%=request("hs_no")%>&username=<%=Request("username")%>&PageNo=<%=PageNo+1%>&search=all"> 
          ��һҳ</a> <%
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
