<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
            
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

'北大排名
SQL = "SELECT * FROM MY_BDKSPM"
RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
			HS_NO = ""
			SQL1 = "SELECT HS_NO FROM HOSPTIAL WHERE HS_NAME = '" & RS("医院") & "'"
			RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
			IF RS1.RecordCount >0 Then
			HS_NO = RS1("HS_NO")
			Else
			Response.write(RS("医院") & "<p>")
			End If
			RS1.CLOSE 
			FD_NO = ""
			SQL1 = "SELECT FD_NO FROM FD_CLASS WHERE FD_NAME = '" & RS("对应复旦科室") & "'"
			RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
			IF RS1.RecordCount >0 Then
			FD_NO = RS1("FD_NO")
			Else
			Response.write(RS("医院") & "-"  & RS("对应复旦科室") &  "<p>")
			End If
			RS1.CLOSE 

			SQL2 = "UPDATE D_CLASS SET BJ_QG_PM = " & RS("排名") & " WHERE HS_NO = '" & HS_NO & "' AND FD_NO = '" & FD_NO & "'"
			CONN.EXECUTE(SQL2)
			'增加复旦科室排名
			SQL3 = "INSERT INTO BJKSPM (HS_NO,HS_NAME,PM,FD_NO,FD_NAME) VALUES('" & HS_NO & "','" & RS("医院") & "'," & RS("排名") & ",'" & FD_NO & "','" & RS("对应复旦科室") & "')"
			CONN.EXECUTE(SQL3)

		RS.MoveNext
		LOOP
		RS.CLOSE 
 RESPONSE.END    


'复旦排名
SQL = "SELECT * FROM MY_FDKSPM"
RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
			HS_NO = ""
			SQL1 = "SELECT HS_NO FROM HOSPTIAL WHERE HS_NAME = '" & RS("医院名字") & "'"
			RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
			IF RS1.RecordCount >0 Then
			HS_NO = RS1("HS_NO")
			Else
			Response.write(RS("医院名字") & "<p>")
			End If
			RS1.CLOSE 
			FD_NO = ""
			SQL1 = "SELECT FD_NO FROM FD_CLASS WHERE FD_NAME = '" & RS("科室类别") & "'"
			RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
			IF RS1.RecordCount >0 Then
			FD_NO = RS1("FD_NO")
			Else
			Response.write(RS("医院名字") & "-"  & RS("科室类别") &  "<p>")
			End If
			RS1.CLOSE 

			SQL2 = "UPDATE D_CLASS SET QG_PM = " & RS("排名") & " WHERE HS_NO = '" & HS_NO & "' AND FD_NO = '" & FD_NO & "'"
			CONN.EXECUTE(SQL2)

			'增加复旦科室排名
			SQL3 = "INSERT INTO FDKSPM (HS_NO,HS_NAME,PM,FD_NO,FD_NAME) VALUES('" & HS_NO & "','" & RS("医院名字") & "'," & RS("排名") & ",'" & FD_NO & "','" & RS("科室类别") & "')"
			CONN.EXECUTE(SQL3)
		RS.MoveNext
		LOOP
		RS.CLOSE 
 RESPONSE.END    




SQL = "SELECT * FROM FD_CLASS"
	RS.Open SQL,CONN,1,1
		DO WHILE NOT RS.EOF 
		SQL1 = "UPDATE FDKSPM SET FD_NO = '" & RS("FD_NO") & "' WHERE FD_NAME = '" & RS("FD_NAME") & "'"
		CONN.Execute(SQL1)
		RS.MoveNext
		LOOP
	RS.CLOSE 
 RESPONSE.END    
		 s_hs_name = request("hs_name")
		 s_fd_name =  request("fd_name")
		 s_pm = request("pm")
	

'判断文章的相关字符
	SQL = "SELECT TOP 1 * FROM FDKSPM WHERE HS_NAME='" & s_hs_name & "' AND FD_NAME = '" & S_FD_NAME & "'"
		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "这个科室排名已经存在了，请选择其他的科室"
			Response.End 
			END IF
		RS.Close 
	
	  	
	
	  				SQL = "SELECT top 1 * FROM FDKSPM"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("hs_name") = s_hs_name
	  				RS1("fd_name") = s_fd_name
	  				RS1("pm") = s_pm
						RS1.UpdateBatch 
	  				RS1.Close 
	  			
				SQL = "SELECT TOP 1 * FROM FDKSPM WHERE HS_NAME='" & s_hs_name & "' AND FD_NAME = '" & S_FD_NAME & "'"
				RS.Open SQL,CONN,1,1
					IF RS.RecordCount>0 THEN
					N_hs_name = RS("hs_name")
					N_fd_name = RS("fd_name")
					N_pm = RS("pm")
									
					END IF
				RS.CLOSE 
%>
<html>
<head>
<title>科室排名增加成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）科室排名系统增加 </font></div>
<hr>
<form method="POST" action="fdkspm_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">医院：</td>
      <td width="68%" class="main"> 
          <%=n_hs_name
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">名次：</td>
      <td width="68%" class="main"> 
         <%=N_pm
        %> 
        </select>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">对应复旦科室：</td>
      <td width="68%" class="main"> 
         <%=N_fd_name
        %> 
        </select>
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="add" value="继续申请">
            <input type="submit" name="home" value="返回主页">
          <input type="submit" name="search" value="进入查询">
        </div>
      </td>
		</tr>
  </table>
</form>
</body>
</html>
