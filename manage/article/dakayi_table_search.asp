<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->


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
	Response.Redirect ("dakayi_table_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
response.Write("������ɾ��")
response.end 
END IF
'��ѯ

  
				
				
	IF REQUEST("INFO_TITLE") <> "" THEN
	MYA = ""
	CC = Split(REQUEST("INFO_TITLE"), " ")
            For CI = 0 To UBound(CC)
						if CI = 0 THEN
						MYA = MYA & " AND (INFO_TITLE LIKE  '%" & CC(CI) & "%' "
						ELSE
						MYA = MYA & " OR INFO_TITLE LIKE  '%" & CC(CI) & "%' "
						END IF
						NEXT
	MYA = MYA & ") "
	END IF

	IF REQUEST("INFO_FIND") <> "" THEN
	
	MYB = ""
	CC = Split(REQUEST("INFO_FIND"), " ")
            For CI = 0 To UBound(CC)
						if CI = 0 THEN
						MYB = MYB & " AND (INFO_FIND LIKE  '%" & CC(CI) & "%' "
						ELSE
						MYB = MYB & " OR INFO_FIND LIKE  '%" & CC(CI) & "%' "
						END IF
						NEXT
	MYB = MYB & ") "
	
	
	END IF
	
	IF REQUEST("person") <>"" THEN
		MYC = " AND PERSON = '" & REQUEST("PERSON") & "' "
	END IF
	
	SQL = "SELECT  * FROM DAKAYI_TABLE WHERE  INFO_TITLE <>'' " & MYA & MYB & MYC & " ORDER BY ID DESC"

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
<title>��ǩ���������ϲ�ѯϵͳ</title>
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
<form method="post" action="dakayi_table_search.asp" name="un">
  <input type=hidden name="info_title" value="<%=REQUEST("info_title")%>">
   <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
    <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
     
      <td width="5%"><font color="#0000FF">�޸�</font></td>
       <td width="21%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
      <td width="9%"> 
        <div align="center"><font color="#0000FF">�����ַ���</font></div>
      </td>
       <td width="11%"> 
        <div align="center"><font color="#0000FF">����ʱ��</font></div>
      </td>
       <td width="11%"> 
        <div align="center"><font color="#0000FF">������Ա</font></div>
      </td>
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
     
      <td width="5%" height="34"> <a href="dakayi_table_modi.asp?id=<%=RS("id")%>" target="_blank">Go!</a> 
        &nbsp; </td>
        <td width="21%" height="34"> 
        <div align="center"><a href="dakayi_table_detail.asp?id=<%=RS("id")%>" target="_blank"><%=RS("info_title")%></a></div>
      </td>
          <td width="7%" height="34"><%=RS("info_find")%>&nbsp;</td>
      <td width="11%" height="34"> 
        <div align="center"><%=RS("re_date")%></div>
      </td>
		  <td width="11%" height="34"> 
        <div align="center"><%=RS("person")%></div>
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
                %><a href="dakayi_table_search.asp?info_title=<%=request("info_title")%>&info_find=<%=request("info_find")%>&PageNo=<%=PageNo-1%>&person=<%=Request("person")%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %> <a href="dakayi_table_search.asp?info_title=<%=request("info_title")%>&info_find=<%=request("info_find")%>&PageNo=<%=PageNo+1%>&person=<%=Request("person")%>&search=all"> 
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
