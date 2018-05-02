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

    
		 s_hs_no = request("hs_no")
		 s_fd_no =  request("fd_no")
		 s_pm = request("pm")
	

'判断文章的相关字符
	SQL = "SELECT TOP 1 * FROM FDKSPM WHERE HS_NO='" & s_hs_no & "' AND FD_NAME = '" & S_FD_NAME & "'"
		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "这个科室排名已经存在了，请选择其他的科室"
			Response.End 
			END IF
		RS.Close 
	
	  	
	
	  				SQL = "SELECT top 1 * FROM FDKSPM"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("hs_no") = s_hs_no
					  RS1("hs_name") = display_name("hosptial",s_hs_no,"hs_no","hs_name")
	  				RS1("fd_no") = s_fd_no
						RS1("fd_name") = display_name("fd_class",s_fd_no,"fd_no","fd_name")
	  				RS1("pm") = s_pm
						RS1.UpdateBatch 
	  				RS1.Close 
	  			'调整科室排名
				
						SQL = "UPDATE D_CLASS SET QG_PM = " & S_PM & " WHERE FD_NO = '" & S_FD_NO & "' AND HS_NO = '" & S_HS_NO & "'"
						CONN.Execute(SQL)
						SQL = "SELECT * FROM D_CLASS WHERE FD_NO = '" & S_FD_NO & "' AND HS_NO = '" & S_HS_NO & "'"
							RS.Open SQL,CONN,1,1
								DO WHILE NOT RS.EOF 
									SQL1 = "UPDATE D_DOCTOR SET QG_PM = " & RS("QG_PM") & " WHERE CLASS_NO = '" & RS("CLASS_NO") & "'"
									CONN.Execute(SQL1)
								RS.MoveNext
								LOOP
							RS.CLOSE 
						
				
				SQL = "SELECT TOP 1 * FROM FDKSPM WHERE HS_no='" & s_hs_no & "' AND FD_no = '" & S_FD_no & "'"
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
