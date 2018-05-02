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
	SQL = "SELECT TOP 1 * FROM D_BODYREPORT WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
	%> 
<html>
<head>
<title>体检指标详细内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统详细内容 </font></div>
<hr>
>
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标名称：</td>
      <td width="79%" class="main"> 
        <%=rs("zbmc")%>
       
          </td>
    </tr>
	  
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标单位：</td>
      <td width="79%" class="main"> 
        <%=rs("zbdw")%>
       
          </td>
    </tr>
	  
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标上限：</td>
      <td width="79%" class="main"> 
       <%=rs("zbsx")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标下限：</td>
      <td width="79%" class="main"> 
     <%=rs("zbxx")%>
        
          </td>
    </tr>
	  
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标概述：</td>
      <td width="79%" class="main"> 
           <%=rs("zbgs")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标偏高原因：</td>
      <td width="79%" class="main"> 
       <%=rs("zbpgyy")%>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标偏低原因：</td>
      <td width="79%" class="main"> 
       <%=rs("zbpdyy")%>
      </td>
    </tr>
	  
	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标补充说明：</td>
      <td width="79%" class="main"> 
   <%=rs("ZBBCSM")%>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">对应疾病（用-分开）：</td>
      <td width="79%" class="main"> 
        <%=rs("dyjb")%>
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
