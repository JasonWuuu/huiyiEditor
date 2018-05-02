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

    '前字符不能有内容的几个字段
	  If Request("zd") = "MYZCH" OR Request("ZD") = "MYXS" OR Request("ZD") = "MYZC"  Then
	  
	  If Request("qzf") <> "" Then
			Response.Write("该字段的设置是不允许有前字符的")
			Response.end 
	  End if
	  
	  End if
	  

'判断文章的相关字符
	SQL = "SELECT TOP 1 * FROM GUOLV WHERE QZF ='" & request("qzf") & "' AND hzf ='" & request("hzf") & "' and zd = '" & request("zd") & "' and id <>" & request("id") & ""
		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "这个类别已经存在，请更改其他的类别名称"
			Response.End 
			END IF
		RS.Close 
	
	  	
	  				SQL = "SELECT top 1 * FROM GUOLV WHERE ID = " & REQUEST("ID") & ""
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
					 	RS1("zdmc") = DISPLAY_NAME("GUOLV_zd",REQUEST("ZD"),"ZD","zdmc")
	  				RS1("ZD") = REQUEST("ZD")
	  				RS1("QZF") = REQUEST("QZF")
	  				RS1("HZF") = REQUEST("HZF")
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  			
			
%>
<html>
<head>
<title>科室类别增加成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）科室类别系统增加 </font></div>
<hr>
<form method="POST" action="a_corre_main.asp" name="un" >
 <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">字段名称：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("GUOLV_zd",REQUEST("ZD"),"ZD","zdmc")
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
          <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
