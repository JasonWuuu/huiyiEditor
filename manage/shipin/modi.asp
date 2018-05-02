<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别

 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
	
	SQL = "SELECT TOP 1 * FROM SHIPIN WHERE ID = " & REQUEST("ID") & ""
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	
	
	%> 
<html>
<head>
<title>首页视频图片修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）首页视频图片修改</font></div>
<hr>
<form method="POST" action="save_up.asp" name="un">
<input type="hidden" name="id" value="<%=Request("id")%>">
<input type="hidden" name="wz" value="<%=rs("wz")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">位置：</td>
      <td width="79%" class="main">
        <%
		  SELECT CASE RS("WZ")
					CASE "Z"
						Response.Write("左边")
					CASE "Y"
						Response.Write("右边")
			END SELECT
		  %>
      
          </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">视频网址：</td>
      <td width="79%" class="main">
        <input type="text" name="url" size="150" value="<%=RS("url")%>">
      
          </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">图片名不变：</td>
      <td width="79%" class="main">
       请用FTP更新该图片
      
          </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="提交申请" >
          <input type="reset" name="Submit2" value="重填信息">
          <input type="button" name="home" value="返    回" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
