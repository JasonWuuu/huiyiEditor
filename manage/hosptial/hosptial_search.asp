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
	Response.Redirect ("hosptial_add.asp")
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
		
	  SQL = "SELECT * FROM HOSPTIAL WHERE HS_NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM HOSPTIAL WHERE HS_NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'��ѯ
	IF REQUEST("SCJB") <> "" THEN
		MYA = " AND SCJBO LIKE '%" & REQUEST("SCJB") & "%' "
		ELSE
		MYA = "  "
	
	END IF

	IF REQUEST("HS_NAME") <> "" THEN
	MYB = " AND (HS_NAME LIKE '%" & REQUEST("HS_NAME") & "%' OR ALICE_NAME LIKE '%" & REQUEST("HS_NAME") & "%') "
	END IF
	IF REQUEST("info_find") <> "" THEN
	MYC = " AND info_find  '%" & REQUEST("info_find") & "%' "
	END IF
	IF REQUEST("HS_desc") <> "" THEN
	MYD = " AND HS_desc LIKE  '%" & REQUEST("HS_desc") & "%' "
	END IF

	IF REQUEST("TYPE") <> "" THEN
	MYG = " AND TYPE =  '" & REQUEST("TYPE") & "' "
	END IF
	IF REQUEST("BD_PM2") <> "" THEN
	MYH = " AND BD_PM <  " & REQUEST("BD_PM2") & " "
	END IF
	IF REQUEST("QG_PM1") <> "" THEN
	MYI = " AND QG_PM >=  " & REQUEST("QG_PM1") & " "
	END IF
	IF REQUEST("QG_PM2") <> "" THEN
	MYJ = " AND QG_PM <  " & REQUEST("QG_PM2") & " "
	END IF
	IF REQUEST("username") <> "" THEN
	MYK = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END IF
	IF REQUEST("IMG") <> "" THEN
		IF REQUEST("IMG") = "��" THEN
		MYM = " AND IMG <>'' "
		ELSE
		MYM = " AND IMG = '' "
		END IF
	END IF
	SQL = "SELECT  * FROM HOSPTIAL WHERE HS_NO <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & MYK & MYM &  " ORDER BY ID DESC"
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
<title>ҽԺ���ϲ�ѯϵͳ</title>
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
<form method="post" action="hosptial_search.asp" name="un">
   <input type=hidden name="scjb" value="<%=REQUEST("scjb")%>">
  <input type=hidden name="hs_name" value="<%=REQUEST("hs_name")%>">
 <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
  <input type=hidden name="info_corre" value="<%=REQUEST("info_corre")%>">
  <input type=hidden name="url" value="<%=REQUEST("url")%>">
  <input type=hidden name="hs_desc" value="<%=REQUEST("hs_desc")%>">
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
      
      <td width="9%"><font color="#0000FF">��վ��ַ</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽԺ����</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">������У</font></div>
      </td>
		<td width="11%"> 
        <div align="center"><font color="#0000FF">ҽԺ�ȼ�</font></div>
      </td>
     
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽ��</font></div>
      </td>
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
          <input type="checkbox" name="caozuo" value=<%=RS("hs_no")%>>
          &nbsp; </div>
      </td>
      <td width="5%" height="34"> <a href="hosptial_modi.asp?hs_no=<%=RS("hs_no")%>" target="_blank">Go!</a> 
        &nbsp; </td>
         <td width="9%" height="34"> <%=RS("URL")
      
      %> </td>
       <td width="21%" height="34"> 
        <div align="center"><a href="hosptial_detail.asp?hs_no=<%=RS("hs_no")%>" target='blank'><%=RS("hs_name")%></a></div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("area")%></font> 
        </div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("yy_fs")%></font> 
        </div>
      </td>
		 <td width="9%" height="34"> 
        <div align="center"> <%=RS("yy_dj")%></font> 
        </div>
      </td>
     
      <td width="9%" height="34"> 
        <div align="center"> <%=RS("TYPE")%></font> 
        </div>
      </td>
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
                %><a href="hosptial_search.asp?type=<%request("type")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&scjb=<%=request("scjb")%>&hs_name=<%=request("hs_name")%>&hs_desc=<%=request("hs_desc")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&url=<%=request("url")%>&username=<%=Request("username")%>&img=<%=Request("img")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="hosptial_search.asp?type=<%request("type")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&scjb=<%=request("scjb")%>&hs_name=<%=request("hsb_name")%>&hs_desc=<%=request("hs_desc")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&url=<%=request("url")%>&username=<%=Request("username")%>&img=<%=Request("img")%>&PageNo=<%=PageNo+1%>&search=all"> 
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
