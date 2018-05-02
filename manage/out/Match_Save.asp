<!-- #include virtual = "/include/mylib.asp" -->

<%

'拆分字符串方法
Function splitContent(str,pattern)
  Dim reg, matchs, match, i, j, k, m, arr(), newArr()
  str = str & vbCrLf
  Set reg = New RegExp
    reg.Global = True
    reg.IgnoreCase =True
    reg.MultiLine = True
    reg.Pattern = pattern
    Set matchs = reg.Execute(str)
	redim arr(matchs.count-1)
	i=0
	j=0
    For Each match in matchs
	  arr(i) = match.Value
	  If Trim(arr(i)) <> "" THEN
	    j=j+1
	  End If
	  i=i+1   	 
	NEXT
	'去掉空值
	IF i <> j THEN
		redim newArr(j-1)
		k=0
		m=0
		For k = 0 to i-1
			If Trim(arr(k)) <> "" THEN
				newArr(m) = arr(k)
				m=m+1
			End If
		Next		
		splitContent=newArr
	Else	
		splitContent=arr
	END If
End Function
%>

<html>
<head>
<title>匹配结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<style type="text/css">
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">医生匹配结果 </font></div>
<hr>
<form method="POST" action="Match.asp" name="un" >
  <table width="90%" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="30%" class="main">分段</td>
      <td width="50%" class="main">分句</td>
	  <td width="20%" class="main">匹配医生</td>
    </tr>
 <%    
	DIM conStr, CONN, RS, sentences,subSentences, status, SQL, SQLcentence, SQLparag, objTypeLib, paragID, doctors
	conStr = "provider=sqloledb;data source=(local);uid=sa;pwd=123456;database=HYapp"
	Set CONN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.RecordSet")
	set objTypeLib = Server.CreateObject("Scriptlet.TypeLib")
	paragID = objTypeLib.Guid

	s_neirong = request("neirong")
	'拆分字符串
		
	sentences = splitContent(s_neirong,"[^\.\?\;\!\。\？\；\！\r\n\v\f]+[\.|\?|\;|\!|\。|\？|\；|\！|\r|\n|\v|\f]{1}")
	'逐条查询匹配并存入数据库	
    CONN.open CONNSTR,"","" 
	'开始事务
	CONN.begintrans
		'存储全文到数据库
		SQLparag = "INSERT INTO [A_PARAG]([INFO_DESC],[ID],[CREATE_DATE]) VALUES('"&s_neirong& "','"&Left(paragID,38)&"','"&now()&"')"
		CONN.Execute(SQLparag)
		'循环每个句子
		For each x in sentences
		    subsentences = splitContent(x,"[^\,\:\.\?\;\!\，\：\、\。\？\；\！\s]+[\,|\:|\.|\?|\;|\!|\，|\：|\、|\。|\？|\；|\！|\s]{1}")
			dim count
            count = ubound(subsentences)+2
%>
    <tr bgcolor="#FFFFFF"> 
      <td rowspan="<%=count%> "  width="30%" class="main">
	    <%=x%> 
	  </td>
	  <td colspan="2" width="70%" class="main">
	  </td>
    </tr>
<%			
		    For each y in subsentences'	
				'查询匹配医生			
				SQL = "SELECT DISTINCT [XM] from [D_DOCTOR] WHERE CHARINDEX([XM],'" & y &"')>0"	
				RS.Open SQL,CONN,1,1
				doctors = ""
				DO WHILE NOT RS.EOF			
					doctors = doctors & RS(0) & "," 	
					RS.MoveNext
				LOOP
				IF RS.RecordCount > 0 THEN
					status = 0
					doctors = Left(doctors, len(doctors)-1)
				Else
					status = 1
				END IF
				RS.CLOSE
				'把句子存入数据表
				SQLcentence = "INSERT INTO [A_LINSHI]([INFO_DESC],[P_ID],[STATUS],[DOCTORS],[CREATE_DATE]) VALUES('" & y &"','" & Left(paragID,38) &"'," & status & ",'"&doctors&"','"&now()&"')"
				CONN.Execute(SQLcentence)
				IF status = 1 THEN
					doctors = "无"
				END IF
				'显示相关信息到页面
%>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" class="main">
	    <%=y%> 
	  </td>
	  <td width="20%" class="main">
	    <%=doctors%> 
	  </td>
    </tr> 			
<%
		   NEXT
		NEXT  
		If CONN.Errors.Count  > 0 Then		
		'回滚事务
    	CONN.RollbackTrans
		response.Write("服务器处理请求出错，请联系管理员。")
		response.end 
		Else
		'提交事务
    	CONN.CommitTrans   
		End If
		Err.Clear
%>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="3"> 
        <div align="center"><br>
          <input type="submit" name="match" value="继续匹配">
          <input type="submit" name="update" value="待更新医生">
          <input type="submit" name="query" value="待查询医生">
        </div>
      </td>
</table>
</form>
</body>
</html>
