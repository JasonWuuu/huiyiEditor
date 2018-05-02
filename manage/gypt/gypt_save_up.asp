<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
   Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
 
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("gypt_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

       
		 s_class = request("class")
		 s_name =  request("name")
		 s_url = request("url")
		 s_img = request("img")
		 s_num = request("num")
		

		 
					SQL = "SELECT TOP 1 * FROM D_gypt WHERE NAME = '" & s_name & "' and  id <>" & request("id") & ""
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "记录增加重复，名称一样"
					Response.End 
					END IF
				RS.Close 
				
			
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_GyPT WHERE ID = " & REQUEST("ID") & ""
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  					RS1("NAME") = S_NAME
	  				RS1("URL") = s_URL
	  				RS1("class") = s_class
						RS1("IMG") = s_IMG
	  				RS1("NUM") = S_NUM
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  		
%>
<html>
<head>
<title>全国购药平台信息修改成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）全国购药平台信息修改 </font></div>
<hr>
<form method="POST" action="gypt_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">类别：</td>
      <td width="68%" class="main"> 
          <%=s_class
        %> 
       
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">名称：</td>
      <td width="79%" class="main">
       <%=s_name%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">URL：</td>
      <td width="79%" class="main">
       <%=s_url%>
       
          </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">图片：</td>
      <td width="79%" class="main">
      <img src="http://img.dakayi.cc/pic/<%=s_img%>">
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">顺序：</td>
      <td width="79%" class="main">
       <%=s_num%>
       
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
