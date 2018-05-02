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

    if request("zd") ="" then
	 Response.Write "字段不能为空"
			Response.end 
	 end if
		If Request("qzf") = "" And Request("hzf") = "" Then
		Response.Write "前后字符不能同时为空的"
			Response.end 
		End if
		
	  '前字符不能有内容的几个字段
	  If Request("zd") = "MYZCH" OR Request("ZD") = "MYXS" OR Request("ZD") = "MYZC"  Then
	  
	  If Request("qzf") <> "" Then
			Response.Write("该字段的设置是不允许有前字符的")
			Response.end 
	  End if
	  
	  End if
	  
		
		
		'判断是否重复
		SQL = "SELECT * FROM GUOLV WHERE ZD = '" & REQUEST("ZD") & "' AND QZF = '" & REQUEST("QZF") & "' AND HZF = '" & REQUEST("HZF") & "'"
			RS.Open SQL,CONN,1,1
				IF RS.RecordCount>0 THEN
				Response.Write "相同的记录，已经存在了，请查询修改顺序"
				Response.end 
				END IF
			RS.CLOSE 
	
	  	
	  				SQL = "SELECT top 1 * FROM GUOLV"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("ZDMC") = DISPLAY_NAME("GUOLV_ZD",REQUEST("ZD"),"ZD","ZDMC")
	  				RS1("ZD") = REQUEST("ZD")
	  				RS1("QZF") = REQUEST("QZF")
	  				RS1("HZF") = REQUEST("HZF")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  			
		
%>
<html>
<head>
<title>内容与文章类别增加成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="a_corre_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">字段名称：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("GUOLV",REQUEST("ZD"),"ZD","CH")
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">前字符：</td>
      <td width="68%" class="main"> 
         <%=REQUEST("QZF")
        %> 
       
      </td>
    </tr>
   
   <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">后字符：</td>
      <td width="68%" class="main"> 
         <%=REQUEST("HZF")
        %> 
       
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
  </table>
</form>
</body>
</html>
