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
	Response.Redirect ("add.asp")
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
		if Request.Cookies("user_name") = "admin" then
		
	 			SQL = "DELETE FROM SHANGFANG WHERE ID = " & LK(J) & ""
				CONN.Execute(SQL)
		end if
	NEXT
END IF
'��ѯ
IF Request("search") <> "" Then
'��ѯ
	IF REQUEST("KS") <> "" THEN
		MYA = " AND KS='" & REQUEST("KS") & "' "
		ELSE
		MYA = "  "
	END IF

	IF REQUEST("DBXM") <> "" THEN
	MYB = " AND DBXM like  '%" & REQUEST("DBXM") & "%' "
	END IF
	IF REQUEST("SFZ") <> "" THEN
	MYC = " AND SFZ   like  '%" & REQUEST("SFZ") & "%' "
	END IF
	IF REQUEST("ZZ") <> "" THEN
	MYD = " AND ZZ =  '" & REQUEST("ZZ") & "' "
	END IF
	IF REQUEST("LFXM") <> "" THEN
	MYE = " AND LFXM LIKE  '%" & REQUEST("LFXM") & "%' "
	END IF
	IF REQUEST("ZRDW") <> "" THEN
	MYF = " AND ZRDW =  '" & REQUEST("ZRDW") & "' "
	END IF
	IF REQUEST("DJCS1") <> "" THEN
	MYG = " AND DJCS >=  " & REQUEST("DJCS1") & " "
	END IF
	IF REQUEST("DJCS2") <> "" THEN
	MYH = " AND DJCS <=  " & REQUEST("DJCS2") & " "
	END IF
	IF REQUEST("DHCS1") <> "" THEN
	MYI = " AND DHCS >=  " & REQUEST("DHCS1") & " "
	END IF
	IF REQUEST("DHCS2") <> "" THEN
	MYJ = " AND DHCS <=  " & REQUEST("DHCS2") & " "
	END IF
	IF REQUEST("QSCS1") <> "" THEN
	MYK = " AND QSCS >=  " & REQUEST("QSCS1") & " "
	END IF
	IF REQUEST("QSCS2") <> "" THEN
	MYL = " AND QSCS <=  " & REQUEST("QSCS2") & " "
	END IF
	IF REQUEST("DSCS1") <> "" THEN
	MYM = " AND DSCS >=  " & REQUEST("DSCS1") & " "
	END IF
	IF REQUEST("DSCS2") <> "" THEN
	MYN = " AND DSCS <=  " & REQUEST("DSCS2") & " "
	END IF
	IF REQUEST("CFSJ1") <> "" THEN
	MYO = " AND CFSJ >=  " & REQUEST("CFSJ1") & " "
	END IF
	IF REQUEST("CFSJ2") <> "" THEN
	MYP = " AND CFSJ <  " & REQUEST("CFSJ2") & " "
	END IF
	IF REQUEST("RE_DATE1") <> "" THEN
	MYQ = " AND RE_DATE >=  " & REQUEST("RE_DATE1") & " "
	END IF
	IF REQUEST("RE_DATE2") <> "" THEN
	MYR = " AND RE_DATE <  " & REQUEST("RE_DATE2") & " "
	END IF
	IF REQUEST("CLZT") <> "" THEN
	MYS = " AND CLZT =  '" & REQUEST("CLZT") & "' "
	END IF
	IF REQUEST("PERSON") <> "" THEN
	MYT = " AND PERSON =  '" & REQUEST("PERSON") & "' "
	END IF
	IF REQUEST("FYWT") <> "" THEN
	MYU = " AND FYWT LIKE  '%" & REQUEST("FYWT") & "%' "
	END IF
	IF REQUEST("CLQK") <> "" THEN
	MYV = " AND (CLQKA LIKE  '%" & REQUEST("CLQK") & "%' OR CLQKB LIKE  '%" & REQUEST("CLQK") & "%' OR CLQKC LIKE  '%" & REQUEST("CLQK") & "%') "
	END IF
	SQL = "SELECT  * FROM SHANGFANG WHERE SFZ <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ &  MYK & MYL & MYM & MYN & MYO & MYP & MYQ & MYR & MYS & MYT & MYU & MYV & " ORDER BY ID DESC"

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
<html>
<head>
<title>������Ա�Ǽǲ�ѯ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-family: "����"; font-size: 9pt; line-height: 21pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="980" border="0" cellspacing="0" cellpadding="5" class="main">
  <tr>
    <td class="wz">
      <div align="center"><b>������Ա�Ǽǲ�ѯ���</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="980" align="left">
<form id="form1" name="un" method="post" action="search.asp">
 <input type=hidden name="ks" value="<%=REQUEST("dbxm")%>">
 <input type=hidden name="DBXM" value="<%=REQUEST("DBXM")%>">
 <input type=hidden name="SFZ" value="<%=REQUEST("SFZ")%>">
 <input type=hidden name="ZZ" value="<%=REQUEST("ZZ")%>">
 <input type=hidden name="LFXM" value="<%=REQUEST("LFXM")%>">
 <input type=hidden name="ZRDW" value="<%=REQUEST("ZRDW")%>">
 <input type=hidden name="DJCS1" value="<%=REQUEST("DJCS1")%>">
 <input type=hidden name="DJCS2" value="<%=REQUEST("DJCS2")%>">
 <input type=hidden name="DHCS1" value="<%=REQUEST("DHCS1")%>">
 <input type=hidden name="DHCS2" value="<%=REQUEST("DHCS2")%>">
 <input type=hidden name="QSCS1" value="<%=REQUEST("QSCS1")%>">
 <input type=hidden name="QSCS2" value="<%=REQUEST("QSCS2")%>">
 <input type=hidden name="DSCS1" value="<%=REQUEST("DSCS1")%>">
 <input type=hidden name="DSCS2" value="<%=REQUEST("DSCS2")%>">
 <input type=hidden name="CFSJ1" value="<%=REQUEST("CFSJ1")%>">
 <input type=hidden name="CFSJ2" value="<%=REQUEST("CFSJ2")%>">
 <input type=hidden name="RE_DATE1" value="<%=REQUEST("RE_DATE1")%>">
 <input type=hidden name="RE_DATE2" value="<%=REQUEST("RE_DATE2")%>">
 <input type=hidden name="CLZT" value="<%=REQUEST("CLZT")%>">
 <input type=hidden name="PERSON" value="<%=REQUEST("PERSON")%>">
 <input type=hidden name="FYWT" value="<%=REQUEST("FYWT")%>">
 <input type=hidden name="CLQK" value="<%=REQUEST("CLQK")%>">
  <table width="980" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#999999" class="main">
    <tr bgcolor="#3333FF"> 
      <td><font color="#FFFF00">ѡ��</font></td>
      <td><font color="#FFFF00">����</font></td>
		<td><font color="#FFFF00">��ӡ</font></td>
      <td><font color="#FFFF00">����</font></td>
      <td><font color="#FFFF00">�Ա�</font></td>
      <td><font color="#FFFF00">���֤</font></td>
      <td><font color="#FFFF00">�绰</font></td>
      <td><font color="#FFFF00">סַ</font></td>
      <td><font color="#FFFF00">����</font></td>
      <td><font color="#FFFF00">���ε�λ</font></td>
      <td><font color="#FFFF00">����</font></td>
      <td><font color="#FFFF00">��ʡ</font></td>
      <td><font color="#FFFF00">����</font></td>
      <td><font color="#FFFF00">����״̬</font></td>
      <td><font color="#FFFF00">�������</font></td>
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
    <tr> 
      <td>
        <input type="checkbox" name="caozuo" value=<%=RS("id")%>>
          &nbsp;
      </td>
      <td><a href="modi.asp?id=<%=rs("id")%>" target="_blank">�޸�</a></td>
		<td><a href="print.asp?id=<%=rs("id")%>" target="_blank">��ӡ</a></td>
      <td><a href="detail.asp?id=<%=rs("id")%>"  target="_blank"><%=rs("DBXM")%></a>&nbsp;</td>
      <td><%=rs("sex")%>&nbsp;</td>
      <td><%=rs("sfz")%>&nbsp;</td>
      <td><%=rs("lxdh")%>&nbsp;</td>
      <td><%=rs("zz")%>&nbsp;</td>
      <td><%=rs("ks")%>&nbsp;</td>
      <td><%=rs("zrdw")%>&nbsp;</td>
      <td><%=rs("djcs")%>&nbsp;</td>
      <td><%=rs("dhcs")%>&nbsp;</td>
      <td><%=rs("dscs")%>&nbsp;</td>
      <td><%=rs("clzt")%>&nbsp;</td>
      <td><%=rs("re_date")%>&nbsp;</td>
    </tr>
	 <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
  </table>
  <hr width="980" size="1" align="left">
  <table width="980" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="left" cellpadding="6" bgcolor="#000000" class="main">
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
                %><a href="search.asp?KS=<%=request("KS")%>&DBXM=<%=request("DBXM")%>&SFZ=<%=request("SFZ")%>&ZZ=<%=request("ZZ")%>&LFXM=<%=request("LFXM")%>&ZRDW=<%=Request("ZRDW")%>&DJCS1=<%=Request("DJCS1")%>&DJCS2=<%=Request("DJCS2")%>&DHCS1=<%=Request("DHCS1")%>&DHCS2=<%=Request("DHCS2")%>&QSCS1=<%=Request("QSCS1")%>&QSCS2=<%=Request("QSCS2")%>&DSCS1=<%=Request("DSCS1")%>&DSCS2=<%=Request("DSCS2")%>&CFSJ1=<%=Request("CFSJ1")%>&CFSJ2=<%=Request("CFSJ2")%>&RE_DATE1=<%=Request("RE_DATE1")%>&RE_DATE2=<%=Request("RE_DATE2")%>&CLZT=<%=Request("CLZT")%>&PERSON=<%=Request("PERSON")%>&FYWT=<%=Request("FYWT")%>&CLQK=<%=Request("CLQK")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="search.asp?KS=<%=request("KS")%>&DBXM=<%=request("DBXM")%>&SFZ=<%=request("SFZ")%>&ZZ=<%=request("ZZ")%>&LFXM=<%=request("LFXM")%>&ZRDW=<%=Request("ZRDW")%>&DJCS1=<%=Request("DJCS1")%>&DJCS2=<%=Request("DJCS2")%>&DHCS1=<%=Request("DHCS1")%>&DHCS2=<%=Request("DHCS2")%>&QSCS1=<%=Request("QSCS1")%>&QSCS2=<%=Request("QSCS2")%>&DSCS1=<%=Request("DSCS1")%>&DSCS2=<%=Request("DSCS2")%>&CFSJ1=<%=Request("CFSJ1")%>&CFSJ2=<%=Request("CFSJ2")%>&RE_DATE1=<%=Request("RE_DATE1")%>&RE_DATE2=<%=Request("RE_DATE2")%>&CLZT=<%=Request("CLZT")%>&PERSON=<%=Request("PERSON")%>&FYWT=<%=Request("FYWT")%>&CLQK=<%=Request("CLQK")%>&PageNo=<%=PageNo+1%>&search=all"> 
          ��һҳ</a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
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
End if
%>

<%

'��ѯ
IF Request("scbg") <> "" Then
'��ѯ
	IF REQUEST("KS") <> "" THEN
		MYA = " AND KS='" & REQUEST("KS") & "' "
		ELSE
		MYA = "  "
	END IF

	IF REQUEST("DBXM") <> "" THEN
	MYB = " AND DBXM like  '%" & REQUEST("DBXM") & "%' "
	END IF
	IF REQUEST("SFZ") <> "" THEN
	MYC = " AND SFZ  like '%" & REQUEST("SFZ") & "%' "
	END IF
	IF REQUEST("ZZ") <> "" THEN
	MYD = " AND ZZ =  '" & REQUEST("ZZ") & "' "
	END IF
	IF REQUEST("LFXM") <> "" THEN
	MYE = " AND LFXM LIKE  '%" & REQUEST("LFXM") & "%' "
	END IF
	IF REQUEST("ZRDW") <> "" THEN
	MYF = " AND ZRDW =  '" & REQUEST("ZRDW") & "' "
	END IF
	IF REQUEST("DJCS1") <> "" THEN
	MYG = " AND DJCS >=  " & REQUEST("DJCS1") & " "
	END IF
	IF REQUEST("DJCS2") <> "" THEN
	MYH = " AND DJCS <=  " & REQUEST("DJCS2") & " "
	END IF
	IF REQUEST("DHCS1") <> "" THEN
	MYI = " AND DHCS >=  " & REQUEST("DHCS1") & " "
	END IF
	IF REQUEST("DHCS2") <> "" THEN
	MYJ = " AND DHCS <=  " & REQUEST("DHCS2") & " "
	END IF
	IF REQUEST("QSCS1") <> "" THEN
	MYK = " AND QSCS >=  " & REQUEST("QSCS1") & " "
	END IF
	IF REQUEST("QSCS2") <> "" THEN
	MYL = " AND QSCS <=  " & REQUEST("QSCS2") & " "
	END IF
	IF REQUEST("DSCS1") <> "" THEN
	MYM = " AND DSCS >=  " & REQUEST("DSCS1") & " "
	END IF
	IF REQUEST("DSCS2") <> "" THEN
	MYN = " AND DSCS <=  " & REQUEST("DSCS2") & " "
	END IF
	IF REQUEST("CFSJ1") <> "" THEN
	MYO = " AND CFSJ >=  " & REQUEST("CFSJ1") & " "
	END IF
	IF REQUEST("CFSJ2") <> "" THEN
	MYP = " AND CFSJ <  " & REQUEST("CFSJ2") & " "
	END IF
	IF REQUEST("RE_DATE1") <> "" THEN
	MYQ = " AND RE_DATE >=  " & REQUEST("RE_DATE1") & " "
	END IF
	IF REQUEST("RE_DATE2") <> "" THEN
	MYR = " AND RE_DATE <  " & REQUEST("RE_DATE2") & " "
	END IF
	IF REQUEST("CLZT") <> "" THEN
	MYS = " AND CLZT =  '" & REQUEST("CLZT") & "' "
	END IF
	IF REQUEST("PERSON") <> "" THEN
	MYT = " AND PERSON =  '" & REQUEST("PERSON") & "' "
	END IF
	IF REQUEST("FYWT") <> "" THEN
	MYU = " AND FYWT LIKE  '%" & REQUEST("FYWT") & "%' "
	END IF
	IF REQUEST("CLQK") <> "" THEN
	MYV = " AND (CLQKA LIKE  '%" & REQUEST("CLQK") & "%' OR CLQKB LIKE  '%" & REQUEST("CLQK") & "%' OR CLQKC LIKE  '%" & REQUEST("CLQK") & "%') "
	END IF
	SQL = "SELECT  * FROM SHANGFANG WHERE SFZ <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ &  MYK & MYL & MYM & MYN & MYO & MYP & MYQ & MYR & MYS & MYT & MYU & MYV & " ORDER BY ID DESC"

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
<html>
<head>
<title>������Ա�Ǽǲ�ѯ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-family: "����"; font-size: 9pt; line-height: 21pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="980" border="0" cellspacing="0" cellpadding="5" class="main">
  <tr>
    <td class="wz">
      <div align="center"><b><%=Request("bgbt")%></b></div>
    </td>
  </tr>
</table>
<hr size="1" width="980" align="left">

  <table width="980" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFFFFF" bordercolordark="#999999" class="main">
  <tr bgcolor="#FFFFFF"> 
    <td><font color="#000000">����</font></td>
    <td><font color="#000000">�Ա�</font></td>
    <td><font color="#000000">���֤</font></td>
    <td><font color="#000000">�绰</font></td>
    <td><font color="#000000">סַ</font></td>
    <td><font color="#000000">����</font></td>
    <td><font color="#000000">���ε�λ</font></td>
    <td><font color="#000000">����</font></td>
    <td><font color="#000000">��ʡ</font></td>
    <td><font color="#000000">����</font></td>
    <td><font color="#000000">����״̬</font></td>
    <td><font color="#000000">�������</font></td>
  </tr>
  <%
		
		Do While Not RS.EOF
		
    %> 
  <tr> 
    <td><%=rs("DBXM")%>&nbsp;</td>
    <td><%=rs("sex")%>&nbsp;</td>
    <td><%=rs("sfz")%>&nbsp;</td>
    <td><%=rs("lxdh")%>&nbsp;</td>
    <td><%=rs("zz")%>&nbsp;</td>
    <td><%=rs("ks")%>&nbsp;</td>
    <td><%=rs("zrdw")%>&nbsp;</td>
    <td><%=rs("djcs")%>&nbsp;</td>
    <td><%=rs("dhcs")%>&nbsp;</td>
    <td><%=rs("dscs")%>&nbsp;</td>
    <td><%=rs("clzt")%>&nbsp;</td>
    <td><%=rs("re_date")%>&nbsp;</td>
  </tr>
  <%
			RS.MoveNext
			Loop
			RS.Close 
			%> 
</table>
<hr width="980" size="1" align="left">
<table width="980" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="left" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#FFFFFF"> 
    <td width="10%"> 
      <div align="center"><font color="#000000">�ܼƣ�</font></div>
    </td>
    <td width="11%"><font color="#000000"><font color=red><%=reco%></font>��</font></td>
  </tr>
</table>
  <p>&nbsp;</p>

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
End if
%>


