<!-- #include virtual = "/include/mylib.asp" -->

<%

'Status = 0 δ����
'Status = 1 δ��ѯ
'Status = 2 �Ѹ���
'Status = 3 �Ѳ���
'Status = 4 ��ɾ��
%>
<html>
<head>
<title>������ҽ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<link href="tab.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>

<body bgcolor="white">
<script type="text/javascript">
function tabPageControl(n)
{
for (var i = 0; i < tabTitles.cells.length; i++)
{
tabTitles.cells[i].className = "tabTitleUnSelected";
}
tabTitles.cells[n].className = "tabTitleSelected";

for (var i = 0; i < tabPagesContainer.tBodies.length; i++)
{
tabPagesContainer.tBodies[i].className = "tabPageUnSelected";
}
tabPagesContainer.tBodies[n].className = "tabPageSelected";
}

function updateStatus(senID)
{   
   if(confirm("ȷ��Ҫ��Ǵ���Ϊ�Ѹ���?"))
   {
      var obj = document.getElementById("updateID");
	  obj.value = senID;
      return true;
   }
   else
      return false;
}

function batchUpdateStatus(paragID)
{   
   if(confirm("���������д������µķ־��¼Ϊ�Ѹ��£�ȷ�ϼ����˲�����"))
   {
      var obj = document.getElementById("batchUpdateID");
	  obj.value = paragID;
      return true;
   }
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">ҽ��ƥ�����б�</font></div>
<hr>
<table class="tabTitlesContainer">
<tr id="tabTitles">
<td class="tabTitleSelected" onclick="tabPageControl(0)">������</td>
<td class="tabTitleUnSelected" onclick="tabPageControl(1)">�Ѹ���</td>
</tr>
</table>
<table id="tabPagesContainer">
<tbody class="tabPageSelected">
<tr class="tabPage">
<td>
<form method="POST" action="Match_Update.asp" name="un" >
  <input type="hidden" id="batchUpdateID" name="batchUpdateID" value="">
  <input type="hidden" id="updateID" name="updateID" value="">
  <table width="95%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="38%" class="main">����</td>
      <td width="45%" class="main">�־�</td>
	  <td width="10%" class="main">ƥ��ҽ��</td>	  
	  <td width="7%" class="main">����</td>
    </tr>
<%    
	DIM conStr, CONN, parag, count, paragID, senID, sentence,doctors,docNo, url, SQLforUpdate1, RSforUpdate1, SQLforUpdate2, RSforUpdate2, SQLUpdated, RSUpdated, SQLDoctors, RSDoctors, SQLUpdate
	conStr = "provider=sqloledb;data source=(local);uid=sa;pwd=123456;database=HYapp"
	Set CONN = Server.CreateObject("ADODB.Connection")
	Set RSforUpdate1 = Server.CreateObject("ADODB.RecordSet")
	Set RSforUpdate2 = Server.CreateObject("ADODB.RecordSet")
	Set RSUpdated = Server.CreateObject("ADODB.RecordSet")
	Set RSDoctors = Server.CreateObject("ADODB.RecordSet")
	SQLforUpdate1 = "SELECT P.[ID] PID, P.[INFO_DESC] Parag, COUNT(L.[ID]) Number, P.[CREATE_DATE] FROM [A_LINSHI] L, [A_PARAG] P WHERE L.[STATUS] = 0 AND L.[P_ID] = P.[ID] GROUP BY P.[ID], P.[INFO_DESC], P.[CREATE_DATE] ORDER BY P.[CREATE_DATE] DESC"
	SQLUpdated = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, L.[DOCTORS] Doctors  FROM [A_LINSHI] L WHERE L.[STATUS] = 2 ORDER BY L.[UPDATE_DATE] DESC"
    CONN.open CONNSTR,"",""
    '��Ӧ�û���������״̬
	IF REQUEST("batchUpdateID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 2, [UPDATE_DATE] ='"&now()&"' WHERE [STATUS] = 0 AND [P_ID] = '"&REQUEST("batchUpdateID")&"'"
		CONN.Execute(SQLUpdate)
		response.Write("����״̬�ɹ���")
	ELSEIF REQUEST("updateID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 2, [UPDATE_DATE] ='"&now()&"' WHERE [ID] = " & REQUEST("updateID")
		CONN.Execute(SQLUpdate)
		response.Write("����״̬�ɹ���")
	END IF		
		'��ѯҪ���µľ�����������������
		RSforUpdate1.Open SQLforUpdate1,CONN,1,1		
		'ѭ��ÿƪ����		
		DO WHILE NOT RSforUpdate1.EOF
			paragID = RSforUpdate1(0)			
			parag = RSforUpdate1(1)	
			count = RSforUpdate1(2)+1
			'��ʾ����
%>
    <tr bgcolor="#FFFFFF"> 
      <td rowspan="<%=count%> "  width="38%" class="main">
	    <%=parag%> 
	  </td>
	  <td colspan="3" width="62%" style="height:1px;text-align:right;">
	  <input type="submit" name="batchUpdate" value="����ƪ�������з־䶼���Ϊ�Ѹ���" onClick="return batchUpdateStatus('<%=paragID%>')";>
	  </td>
    </tr>
<%		
			'��ѯ��ѭ���������е����о���
			SQLforUpdate2 = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, L.[DOCTORS] Doctors  FROM [A_LINSHI] L WHERE L.[STATUS] = 0 AND L.[P_ID] = '" & paragID & "'"			
			RSforUpdate2.Open SQLforUpdate2,CONN,1,1
			DO WHILE NOT RSforUpdate2.EOF
				senID = RSforUpdate2(0)
				sentence = RSforUpdate2(1)			
				doctors = RSforUpdate2(2)			
				'��ʾÿ������
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="45%" class="main">
	    <%=sentence%> 
	  </td>
	  <td width="10%" class="main">
<%

		'ѭ��ÿ��ƥ��ҽ��
		 IF ISNULL(doctors) or doctors = ""  THEN
		 ELSE
			For each doc in Split(doctors, ",", -1)
				SQLDoctors = "SELECT [NO] FROM [D_DOCTOR] WHERE [XM] = '" & doc & "'"	
				RSDoctors.Open SQLDoctors,CONN,1,1
				DO WHILE NOT RSDoctors.EOF
					docNo = RSDoctors(0)
					url = "http://dc.huiyi.net:6789/manage/d_doctor/doctor_modi.asp?no=" & docNo
					'��ʾ��ƥ��ҽ��
%>
			<a target="_blank" href="<%=url%>"><%=doc%>&nbsp;</a>
<%
					RSDoctors.MoveNext
				LOOP
				RSDoctors.Close
			NEXT
		END IF	
%> 
	  </td>	  	  
	  <td width="7%" class="main">
	  <input type="submit" name="update" value="���Ϊ�Ѹ���" onClick="return updateStatus(<%=senID%>)";>
	  </td>
    </tr> 			
<%				
			RSforUpdate2.MoveNext
		LOOP
		RSforUpdate2.Close
		RSforUpdate1.MoveNext
	LOOP
	RSforUpdate1.Close	
%>  
</table>
</form>

</td>
</tr>
</tbody>
<tbody class="tabPageUnSelected">
<tr class="tabPage">
<td>

  <table width="90%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF">
      <td width="80%" class="main">�־�</td>
	  <td width="20%" class="main">ƥ��ҽ��</td>
    </tr>
<%
	RSUpdated.Open SQLUpdated,CONN,1,1
		DO WHILE NOT RSUpdated.EOF
			sentence = RSUpdated(1)			
			doctors = RSUpdated(2)			
			'��ʾÿ������
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="80%" class="main">
	    <%=sentence%> 
	  </td>
	  <td width="20%" class="main">
<%

		'ѭ��ÿ��ƥ��ҽ��
		IF ISNULL(doctors) or doctors = ""  THEN
		ELSE		
			For each doc in Split(doctors, ",", -1)
				SQLDoctors = "SELECT [NO] FROM [D_DOCTOR] WHERE [XM] = '" & doc & "'"	
				RSDoctors.Open SQLDoctors,CONN,1,1
				DO WHILE NOT RSDoctors.EOF
					docNo = RSDoctors(0)
					url = "http://dc.huiyi.net:6789/manage/d_doctor/doctor_modi.asp?no=" & docNo
					'��ʾ��ƥ��ҽ��
%>
			<a target="_blank" href="<%=url%>"><%=doc%>&nbsp;</a>
<%
					RSDoctors.MoveNext
				LOOP
				RSDoctors.Close
			NEXT
		END IF	
%> 
	  </td>	
    </tr> 			
<%				
		RSUpdated.MoveNext
	LOOP
	RSUpdated.Close
	CONN.Close
%>  
  </table>

</td>
</tr>
</tbody>
</table>



</body>
</html>
