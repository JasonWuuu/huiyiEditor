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
	Response.Redirect ("doctor_add.asp")
	END IF
	%> 
<%


	SQL = "SELECT  * FROM D_DOCTOR_DESC WHERE NO ='" & Request("No") & "' ORDER BY ID"
	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
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
<title>ҽ���������β�ѯϵͳ</title>
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
     
      
      <td width="9%"><font color="#0000FF">����</font></td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">ҽԺ</font></div>
      </td>
      <td width="21%"> 
        <div align="center"><font color="#0000FF">����</font></div>
      </td>
		<td width="21%"> 
        <div align="center"><font color="#0000FF">��ʽ</font></div>
      </td>
     <td width="21%"> 
        <div align="center"><font color="#0000FF">�鿴�޸ļ�¼</font></div>
      </td>
      <td width="11%"> 
        <div align="center"><font color="#0000FF">������</font></div>
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
      
         <td width="9%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("D_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "�ڲ�"
      END IF
      %> </td>
      <td width="11%" height="34"> 
        <div align="center"><%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")%></div>
      </td>
      <td width="21%" height="34"> 
        <div align="center"><%=RS("xm")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><%=RS("caozuo")%></div>
      </td>
		 <td width="21%" height="34"> 
        <div align="center"><a href="doctor_lici_detail.asp?id=<%=RS("id")%>" target='blank'>�鿴�޸ļ�¼</a></div>
      </td>
      <td width="9%" height="34"> 
        <div align="center"> <%=RS("gx_user")%></font> 
        </div>
      </td>
     
      <td width="11%" height="34"> 
        <div align="center"><%=RS("gx_date")%></div>
      </td>
       </tr>
    <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
			 <tr bgcolor="#FFFFFF"> 
      <td colspan="7"> 
        <div align="center"><br>
           <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
		</tr>
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
