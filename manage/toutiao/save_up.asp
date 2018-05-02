<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
   
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("article_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		
					'增加记录
					
					SQL = "SELECT TOP 1 INFO_TITLE,INFO_FILE FROM A_ARTICLE WHERE INFO_NO = '" & REQUEST("NO") & "'"
					RS.Open SQL,CONN,1,1
						IF RS.RecordCount>0 THEN
						TITLE = RS("INFO_TITLE")
						IMG = "http://img.huiyi.net/pic/" & RS("INFO_FILE")
						END IF
					RS.CLOSE 
	  		
	  				SQL = "SELECT top 1 * FROM TOUTIAO WHERE ID=" & REQUEST("ID") & ""
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  				RS1("NO") = Request("no")
	  				RS1("title") = TITLE
	  				RS1("img") = IMG
						RS1.UpdateBatch 
	  				RS1.Close 
	  				
%>
<html>
<head>
<title>首页图片新闻-内容与文章修改成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）首页图片新闻-内容与文章系统修改 </font></div>
<hr>
<form method="POST" action="article_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">文章的编号：</td>
      <td width="68%" class="main"> 
          <%=Request("no")
        %> 
        
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">资料标题：</td>
      <td width="68%" class="main">
      <%=Request("title")%>
       </td>
    </tr>
   
    </tr>
      <tr bgcolor="#FFFFFF">
      <td width="32%" class="main">图片名称：</td>
      <td width="68%" class="main">
      <img src="http://img.huiyi.net/pic/<%=Request("img")%>">
        
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
