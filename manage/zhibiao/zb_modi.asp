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
<title>体检指标修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统修改 </font></div>
<hr>
<form method="POST" action="zb_save_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标名称：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbmc" size="50" value="<%=rs("zbmc")%>">
       
          </td>
    </tr>
	  
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标单位：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbdw" size="50"  value="<%=rs("zbdw")%>">
       
          </td>
    </tr>
	  
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标上限：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbsx" size="50"  value="<%=rs("zbsx")%>">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标下限：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zbxx" size="50"  value="<%=rs("zbxx")%>">
        
          </td>
    </tr>
	  
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标概述：</td>
      <td width="79%" class="main"> 
            <textarea name="zbgs" rows="10" cols="60"><%=rs("zbgs")%></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标偏高原因：</td>
      <td width="79%" class="main"> 
           <textarea name="zbpgyy" rows="10" cols="60"><%=rs("zbpgyy")%></textarea>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标偏低原因：</td>
      <td width="79%" class="main"> 
        <textarea name="zbpdyy" rows="10" cols="60"><%=rs("zbpdyy")%></textarea>
      </td>
    </tr>
	  
	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">指标补充说明：</td>
      <td width="79%" class="main"> 
        <textarea name="ZBBCSM" rows="10" cols="60"><%=rs("ZBBCSM")%></textarea>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">对应疾病（用-分开）：</td>
      <td width="79%" class="main"> 
        <textarea name="dyjb" rows="10" cols="60"><%=rs("dyjb")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否常见指标：</td>
      <td width="79%" class="main">
        <select name="cjzb" >
	       
        <option value="是" >是</option>
		 <option value="否" >否</option>
		 <option value="<%=rs("cjzb")%>" selected><%=rs("cjzb")%></option>
		 
        </select>
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="提交申请" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="重填信息">
          <input type="button" name="home" value="返    回" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
