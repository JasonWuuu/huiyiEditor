<!-- #include virtual = "/include/mylib.asp" -->

<%

'Status = 0 未更新
'Status = 1 未查询
'Status = 2 已更新
'Status = 3 已查阅
'Status = 4 已删除
%>
<html>
<head>
<title>待更新医生</title>
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
   if(confirm("确认要标记此条为已更新?"))
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
   if(confirm("将会标记所有此文章下的分句记录为已更新，确认继续此操作？"))
   {
      var obj = document.getElementById("batchUpdateID");
	  obj.value = paragID;
      return true;
   }
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">医生匹配结果列表</font></div>
<hr>
<table class="tabTitlesContainer">
<tr id="tabTitles">
<td class="tabTitleSelected" onclick="tabPageControl(0)">待更新</td>
<td class="tabTitleUnSelected" onclick="tabPageControl(1)">已更新</td>
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
      <td width="38%" class="main">文章</td>
      <td width="45%" class="main">分句</td>
	  <td width="10%" class="main">匹配医生</td>	  
	  <td width="7%" class="main">操作</td>
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
    '响应用户操作更新状态
	IF REQUEST("batchUpdateID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 2, [UPDATE_DATE] ='"&now()&"' WHERE [STATUS] = 0 AND [P_ID] = '"&REQUEST("batchUpdateID")&"'"
		CONN.Execute(SQLUpdate)
		response.Write("更新状态成功！")
	ELSEIF REQUEST("updateID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 2, [UPDATE_DATE] ='"&now()&"' WHERE [ID] = " & REQUEST("updateID")
		CONN.Execute(SQLUpdate)
		response.Write("更新状态成功！")
	END IF		
		'查询要更新的句子所属的所有文章
		RSforUpdate1.Open SQLforUpdate1,CONN,1,1		
		'循环每篇文章		
		DO WHILE NOT RSforUpdate1.EOF
			paragID = RSforUpdate1(0)			
			parag = RSforUpdate1(1)	
			count = RSforUpdate1(2)+1
			'显示文章
%>
    <tr bgcolor="#FFFFFF"> 
      <td rowspan="<%=count%> "  width="38%" class="main">
	    <%=parag%> 
	  </td>
	  <td colspan="3" width="62%" style="height:1px;text-align:right;">
	  <input type="submit" name="batchUpdate" value="将这篇文章所有分句都标记为已更新" onClick="return batchUpdateStatus('<%=paragID%>')";>
	  </td>
    </tr>
<%		
			'查询并循环该文章中的所有句子
			SQLforUpdate2 = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, L.[DOCTORS] Doctors  FROM [A_LINSHI] L WHERE L.[STATUS] = 0 AND L.[P_ID] = '" & paragID & "'"			
			RSforUpdate2.Open SQLforUpdate2,CONN,1,1
			DO WHILE NOT RSforUpdate2.EOF
				senID = RSforUpdate2(0)
				sentence = RSforUpdate2(1)			
				doctors = RSforUpdate2(2)			
				'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="45%" class="main">
	    <%=sentence%> 
	  </td>
	  <td width="10%" class="main">
<%

		'循环每个匹配医生
		 IF ISNULL(doctors) or doctors = ""  THEN
		 ELSE
			For each doc in Split(doctors, ",", -1)
				SQLDoctors = "SELECT [NO] FROM [D_DOCTOR] WHERE [XM] = '" & doc & "'"	
				RSDoctors.Open SQLDoctors,CONN,1,1
				DO WHILE NOT RSDoctors.EOF
					docNo = RSDoctors(0)
					url = "http://dc.huiyi.net:6789/manage/d_doctor/doctor_modi.asp?no=" & docNo
					'显示该匹配医生
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
	  <input type="submit" name="update" value="标记为已更新" onClick="return updateStatus(<%=senID%>)";>
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
      <td width="80%" class="main">分句</td>
	  <td width="20%" class="main">匹配医生</td>
    </tr>
<%
	RSUpdated.Open SQLUpdated,CONN,1,1
		DO WHILE NOT RSUpdated.EOF
			sentence = RSUpdated(1)			
			doctors = RSUpdated(2)			
			'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="80%" class="main">
	    <%=sentence%> 
	  </td>
	  <td width="20%" class="main">
<%

		'循环每个匹配医生
		IF ISNULL(doctors) or doctors = ""  THEN
		ELSE		
			For each doc in Split(doctors, ",", -1)
				SQLDoctors = "SELECT [NO] FROM [D_DOCTOR] WHERE [XM] = '" & doc & "'"	
				RSDoctors.Open SQLDoctors,CONN,1,1
				DO WHILE NOT RSDoctors.EOF
					docNo = RSDoctors(0)
					url = "http://dc.huiyi.net:6789/manage/d_doctor/doctor_modi.asp?no=" & docNo
					'显示该匹配医生
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
