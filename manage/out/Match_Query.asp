<!-- #include virtual = "/include/mylib.asp" -->

<%

'Status = 0 未更新
'Status = 1 未查询
'Status = 2 已更新
'Status = 3 待新增
'Status = 4 已删除
'Status = 5 已新增
%>
<html>
<head>
<title>待更新医生</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<link href="tab.css" rel="stylesheet" type="text/css" />
<style type="text/css">
html,body {height:100%; margin:0px;}
.mydiv {
background-color: #FFFFFF;
border: 1px solid #FFCC66;
text-align: center;
line-height: 40px;
font-size: 12px;
font-weight: bold;
z-index:999;
width: 50%;
height: 50%;
left:25%;
top:20%;
position:fixed!important;
padding: 20px;
}

#popDiv td{
padding:5px;
font-size:15px;
}

#popDiv input{
width:500px;
height:30px;
}

.bg,.popIframe {
background-color: #666; display:none;
width: 100%;
height: 100%;
left:0;
top:0;
filter:alpha(opacity=50);/*IE*/
opacity:0.5;/*FF*/
z-index:1;
position:fixed!important;
}
.popIframe {
filter:alpha(opacity=0);/*IE*/
opacity:0;/*FF*/
}
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

function deleteItem(senID)
{   
   if(confirm("确认要删除此句?"))
   {
      var obj = document.getElementById("deleteID");
	  obj.value = senID;
      return true;
   }
   else
      return false;
}

function batchUpdateStatus(paragID)
{   
   if(confirm("将会标记所有此文章下的分句记录为待新增，确认继续此操作？"))
   {
      var obj = document.getElementById("batchUpdateID");
	  obj.value = paragID;
      return true;
   }
   else
      return false;
}



function batchDeleteItems(paragID)
{   
   if(confirm("将会删除所有此文章下的分句记录，确认继续此操作？"))
   {
      var obj = document.getElementById("batchDeleteID");
	  obj.value = paragID;
      return true;
   }
   else
      return false;
}

function updateStatus(senID)
{	
	showDiv();
	var objID = document.getElementById("updateID");
	objID.value = senID;	
	return false;
}


function insertedStatus(senID)
{
   if(confirm("确认您已经将该医生新增至数据库，并从此列表中移除该条记录？"))
   {
      var obj = document.getElementById("insertedID");
	  obj.value = senID;
      return true;
   }
   else
      return false;
}

function showDiv(){
document.getElementById('popDiv').style.display='block';
document.getElementById('popIframe').style.display='block';
document.getElementById('bg').style.display='block';
}

function closeDiv(flag){
document.getElementById('popDiv').style.display='none';
document.getElementById('bg').style.display='none';
document.getElementById('popIframe').style.display='none';
if(flag == 1)
{
	document.getElementById('un').submit();
}
else
{
	var objID = document.getElementById("updateID");
	objID.value = "";
}
}

</script>
<div align="center"><font color="#0000FF" class="main">医生未匹配结果列表</font></div>
<hr>
<table class="tabTitlesContainer">
<tr id="tabTitles">
<td class="tabTitleSelected" onclick="tabPageControl(0)">未处理</td>
<td class="tabTitleUnSelected" onclick="tabPageControl(1)">待新增</td>
<td class="tabTitleUnSelected" onclick="tabPageControl(2)">已新增</td>
<td class="tabTitleUnSelected" onclick="tabPageControl(3)">已删除</td>
</tr>
</table>
<table id="tabPagesContainer">
<tbody class="tabPageSelected">
<tr class="tabPage">
<td>
<form method="POST" action="Match_Query.asp" name="un" id="un" >
<div id="popDiv" class="mydiv" style="display:none;">
<h2>添加待新增医生</h2>
<table>
<tr>
<td>姓名：</td>
<td>
<input type="text" id="txtName" name="txtName" >
</td>
</tr>
<tr>
<td>职务描述：</td>
<td>
<input type="text" id="txtTitle" name="txtTitle" >
</td>
</tr>
<tr>
<td>官网链接：</td>
<td>
<input type="text" id="urlOffical" name="urlOffical" >
</td>
</tr>
<tr>
<td>科室链接：</td>
<td>
<input type="text" id="urlDept" name="urlDept" >
</td>
</tr>
<tr>
<td>好大夫链接：</td>
<td>
<input type="text" id="urlHdf" name="urlHdf" >
</td>
</tr>
<tr>
<td>寻医问药链接：</td>
<td>
<input type="text" id="urlXywy" name="urlXywy" >
</td>
</tr>
<tr>
<td>百度百科链接：</td>
<td>
<input type="text" id="urlBaike" name="urlBaike" >
</td>
</tr>
<tr>
<td>其他链接：</td>
<td>
<textarea rows="4" cols="80" id="urlOthers" name="urlOthers"></textarea>
</td>
</tr>
</table>
<a style="font-size:18px;" href="http://dc.huiyi.net:6789/manage/d_doctor/doctor_main.asp">查询医生</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a style="font-size:18px;" href="javascript:closeDiv(1)">提交保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a style="font-size:18px;" href="javascript:closeDiv(0)">返回</a>
</div>

<div id="bg" class="bg" style="display:none;"></div>
<iframe id='popIframe' class='popIframe' frameborder='0' ></iframe>

<div style="width:96%;text-align:right;padding:5px;">
<a target="_blank" href="http://dc.huiyi.net:6789/manage/d_doctor/doctor_main.asp">查询医生</a>
</div>
  <input type="hidden" id="updateID" name="updateID" value="">
  <input type="hidden" id="batchDeleteID" name="batchDeleteID" value="">
  <input type="hidden" id="deleteID" name="deleteID" value="">
  <table width="95%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="40%" class="main">文章</td>
      <td width="46%" class="main">分句</td>	  
	  <td width="14%" class="main">操作</td>
    </tr>
<%    
	DIM conStr, CONN, parag, count, paragID, senID, sentence,doctors,docNo, url, SQLforUpdate1, RSforUpdate1, SQLforUpdate2, RSforUpdate2, SQLUpdated, RSUpdated,SQLDeleted, RSDeleted, SQLDoctors, RSDoctors, SQLUpdate
	conStr = "provider=sqloledb;data source=(local);uid=sa;pwd=123456;database=HYapp"
	Set CONN = Server.CreateObject("ADODB.Connection")
	Set RSforUpdate1 = Server.CreateObject("ADODB.RecordSet")
	Set RSforUpdate2 = Server.CreateObject("ADODB.RecordSet")
	Set RSUpdated = Server.CreateObject("ADODB.RecordSet")
	Set RSDeleted = Server.CreateObject("ADODB.RecordSet")
	Set RSDoctors = Server.CreateObject("ADODB.RecordSet")
	SQLforUpdate1 = "SELECT P.[ID] PID, P.[INFO_DESC] Parag, COUNT(L.[ID]) Number, P.[CREATE_DATE] FROM [A_LINSHI] L, [A_PARAG] P WHERE L.[STATUS] = 1 AND L.[P_ID] = P.[ID] GROUP BY P.[ID], P.[INFO_DESC], P.[CREATE_DATE] ORDER BY P.[CREATE_DATE] DESC"
	SQLUpdated = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, L.[DOCTORS] Doctors, L.[UPDATE_DATE] datetime FROM [A_LINSHI] L WHERE L.[STATUS] = 5 ORDER BY L.[UPDATE_DATE] DESC"
	SQLDeleted = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, L.[UPDATE_DATE] datetime  FROM [A_LINSHI] L WHERE L.[STATUS] = 4 ORDER BY L.[UPDATE_DATE] DESC"
    CONN.open CONNSTR,"",""
    '响应用户操作更新状态
	IF REQUEST("insertedID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 5, [UPDATE_DATE] ='"&now()&"' WHERE [ID] = "&REQUEST("insertedID")
		CONN.Execute(SQLUpdate)
		response.Write("移动到已新增列表成功！")		
	ELSEIF REQUEST("batchDeleteID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 4, [UPDATE_DATE] ='"&now()&"' WHERE [STATUS] = 1 AND [P_ID] = '"&REQUEST("batchDeleteID")&"'"
		CONN.Execute(SQLUpdate)
		response.Write("批量删除成功！")
	ELSEIF REQUEST("updateID") <> "" AND REQUEST("txtName") <> ""  THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 3, [DOCTORS] = '"& REQUEST("txtName") &"', [UPDATE_DATE] ='"&now()&"' WHERE [ID] = " & REQUEST("updateID") & "; INSERT INTO [dbo].[D_CANDIDATE] VALUES  ('"&REQUEST("txtName")&"','"&REQUEST("txtTitle")&"',"&REQUEST("updateID")&",'"&REQUEST("urlOffical")&"','"&REQUEST("urlDept")&"','"&REQUEST("urlHdf")&"','"&REQUEST("urlXywy")&"','"&REQUEST("urlBaike")&"','"&REQUEST("urlOthers")&"','"&now()&"','"&now()&"');"
		CONN.Execute(SQLUpdate)
		response.Write("添加到待新增成功！")
	ELSEIF REQUEST("deleteID") <> "" THEN	
		SQLUpdate = "UPDATE A_LINSHI SET [STATUS] = 4, [UPDATE_DATE] ='"&now()&"' WHERE [ID] = " & REQUEST("deleteID")
		CONN.Execute(SQLUpdate)
		response.Write("删除成功！")
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
      <td rowspan="<%=count%> "  width="40%" class="main">
	    <%=parag%> 
	  </td>
	  <td colspan="2" width="60%" style="height:1px;text-align:right;">
	  <!--<label>为这篇文章所有分句进行：</label>
	  <input type="submit" name="batchUpdate" value="批量标记为待新增" onClick="return batchUpdateStatus('')";>&nbsp;&nbsp; -->
	  <input type="submit" name="batchDelete" value="批量删除" onClick="return batchDeleteItems('<%=paragID%>')";>
	  </td>
    </tr>
<%		
			'查询并循环该文章中的所有句子
			SQLforUpdate2 = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence FROM [A_LINSHI] L WHERE L.[STATUS] = 1 AND L.[P_ID] = '" & paragID & "'"			
			RSforUpdate2.Open SQLforUpdate2,CONN,1,1
			DO WHILE NOT RSforUpdate2.EOF
				senID = RSforUpdate2(0)
				sentence = RSforUpdate2(1)			
				'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="46%" class="main">
	    <%=sentence%> 
	  </td> 	  
	  <td width="14%" class="main" style="text-align:center;">
	  <input type="submit" name="update" value="标记为待新增" onClick="return updateStatus(<%=senID%>)";>&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="submit" name="delete" value="删除" onClick="return deleteItem(<%=senID%>)";>
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
<form method="POST" action="Match_Query.asp" name="insert" id="insert" >

  <input type="hidden" id="insertedID" name="insertedID" value="">
  <table width="98%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF">
      <td width="25%" class="main">文章</td>
      <td width="12%" class="main">分句</td>
	  <td width="7%" class="main">医生</td>
	  <td width="7%" class="main">职务</td>
	  <td width="7%" class="main">官方链接</td>
	  <td width="7%" class="main">科室链接</td>
	  <td width="7%" class="main">好大夫链接</td>
	  <td width="7%" class="main">寻医问药链接</td>
	  <td width="7%" class="main">百科链接</td>
	  <td width="7%" class="main">其他链接</td>
	  <td width="7%" class="main">操作</td>
    </tr>
	
<%	
		'查询待新增的医生所在的句子及文章
		SQLforUpdate1 = "SELECT P.[ID] PID, P.[INFO_DESC] Parag, COUNT(L.[ID]) Number, P.[CREATE_DATE] FROM [A_LINSHI] L, [A_PARAG] P WHERE L.[STATUS] = 3 AND L.[P_ID] = P.[ID] GROUP BY P.[ID], P.[INFO_DESC], P.[CREATE_DATE] ORDER BY P.[CREATE_DATE] DESC"
		RSforUpdate1.Open SQLforUpdate1,CONN,1,1		
		'循环每篇文章		
		DO WHILE NOT RSforUpdate1.EOF
			paragID = RSforUpdate1(0)			
			parag = RSforUpdate1(1)	
			count = RSforUpdate1(2)+1
			'显示文章
%>
    <tr bgcolor="#FFFFFF"> 
      <td rowspan="<%=count%> "  width="25%" class="main">
	    <%=parag%> 
	  </td>
	  <td colspan="10" width="76%" style="height:1px;text-align:right;">
	  <!--	
	  <input type="submit" name="batchDelete" value="批量标记为已新建" onClick="return batchDeleteItems('<%=paragID%>')";> -->
	  </td>
    </tr>
<%		
			'查询并循环该文章中的相关句子
			SQLforUpdate2 = "SELECT L.[ID] LID, L.[INFO_DESC] Sentence, C.[NAME] Doctor, C.[TITLE], C.[URL_OFFC], C.[URL_DEPT], C.[URL_HDF], C.[URL_XYWY], C.[URL_BK], C.[URL_OTHR] FROM [D_CANDIDATE] C LEFT JOIN [A_LINSHI] L ON C.[SOURCE_ID] = L.[ID] WHERE L.[STATUS] = 3 AND L.[P_ID] = '" & paragID & "'"			
			RSforUpdate2.Open SQLforUpdate2,CONN,1,1
			Dim Doctor,TITLE,URL_OFFC,URL_DEPT,URL_HDF,URL_XYWY,URL_BK,URL_OTHR
			DO WHILE NOT RSforUpdate2.EOF			
				senID = RSforUpdate2(0)
				sentence = RSforUpdate2(1)			
				Doctor = RSforUpdate2(2)		
				TITLE = RSforUpdate2(3)				
				URL_OFFC = RSforUpdate2(4)				
				URL_DEPT = RSforUpdate2(5)				
				URL_HDF = RSforUpdate2(6)				
				URL_XYWY = RSforUpdate2(7)				
				URL_BK = RSforUpdate2(8)				
				URL_OTHR = RSforUpdate2(9)					
				'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="12%" class="main">
	    <%=sentence%> 
	  </td>
      <td width="7%" class="main">
	    <%=Doctor%> 
	  </td> 
      <td width="7%" class="main">
	    <%=TITLE%> 
	  </td> 
      <td width="7%"  class="main">
	    <%=URL_OFFC%> 
	  </td> 
      <td  width="7%" class="main">
	    <%=URL_DEPT%> 
	  </td> 
      <td width="7%"  class="main">
	    <%=URL_HDF%> 
	  </td> 
      <td width="7%"  class="main">
	    <%=URL_XYWY%> 
	  </td> 
      <td width="7%"  class="main">
	    <%=URL_BK%> 
	  </td> 
      <td width="7%"  class="main">
	    <%=URL_OTHR%> 
	  </td>  	  
	  <td width="7%" class="main" style="text-align:center;">
	  <input type="submit" name="inserted" value="标记为已新增" onClick="return insertedStatus(<%=senID%>)";>
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
      <td width="60%" class="main">来源</td>
	  <td width="20%" class="main">医生</td>
	  <td width="20%" class="main">新增时间</td>
    </tr>
<%
	RSUpdated.Open SQLUpdated,CONN,1,1
		DO WHILE NOT RSUpdated.EOF
			sentence = RSUpdated(1)
			doctors = RSUpdated(2)				
			datetime = RSUpdated(3)			
			'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="60%" class="main">
	    <%=sentence%> 
	  </td>
      <td width="20%" class="main">
  
<%
	IF ISNULL(doctors) or doctors = ""  THEN
	ELSE	
		SQLDoctors = "SELECT [NO] FROM [D_DOCTOR] WHERE [XM] = '" & doctors & "'"	
		RSDoctors.Open SQLDoctors,CONN,1,1
		IF RSDoctors.RecordCount > 0 THEN
			docNo = RSDoctors(0)
			url = "http://dc.huiyi.net:6789/manage/d_doctor/doctor_modi.asp?no=" & docNo		
%>
			<a target="_blank" href="<%=url%>"><%=doctors%></a>
<%
		END IF
		RSDoctors.Close	
	END IF 
%> 
	  </td>
	  <td width="20%" class="main">
	    <%=datetime%> 
	  </td>	
    </tr> 			
<%				
		RSUpdated.MoveNext
	LOOP
	RSUpdated.Close
%>  
  </table>

</td>
</tr>
</tbody>

<tbody class="tabPageUnSelected">
<tr class="tabPage">
<td>

  <table width="90%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF">
      <td width="80%" class="main">分句</td>
	  <td width="20%" class="main">删除时间</td>
    </tr>
<%
	RSUpdated.Open SQLDeleted,CONN,1,1
		DO WHILE NOT RSUpdated.EOF
			sentence = RSUpdated(1)			
			datetime = RSUpdated(2)			
			'显示每个句子
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="80%" class="main">
	    <%=sentence%> 
	  </td>
	  <td width="20%" class="main">
	    <%=datetime%> 
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
