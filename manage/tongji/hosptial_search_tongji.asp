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

	SQL = "SELECT  * FROM HOSPTIAL WHERE HS_NO <> ''  AND USER_NAME = '" & REQUEST("US") & "' AND RE_DATE>='" & DATE & "' ORDER BY ID DESC"
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
  <table width="898" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#CCCCCC"> 
    
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
        <div align="center"><font color="#0000FF">�����ַ�</font></div>
      </td>
    
		<td width="8%"><font color="#0000FF">����</font></td>
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
     
         <td width="9%" height="34"> <%=RS("URL")
      
      %> </td>
       <td width="21%" height="34"> 
        <div align="center"><a href="../hosptial/hosptial_detail.asp?hs_no=<%=RS("hs_no")%>" target='blank'><%=RS("hs_name")%></a></div>
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
        <div align="center"> <%=RS("INFO_FIND")%></font> 
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
<p>   <input type="button" name="add" value="�رմ���" onclick=self.close();> </p>
</body>
<%
END IF

%>
