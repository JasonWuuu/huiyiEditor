<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

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
	SQL = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & REQUEST("CLASS_NO") & "'"
	RS.Open SQL,CONN,1,1
		IF RS.RecordCount >0 THEN
		N_P_CLASS_NO = RS("P_CLASS_NO")
					N_CLASS_NO = RS("CLASS_NO")
					N_CLASS_NAME = RS("CLASS_NAME")
					N_NUM = RS("NUM")
					N_FD_NO = RS("FD_NO")
					N_CLASS_DESC = RS("CLASS_DESC")
					'N_BD_PM = RS("BD_PM")
					N_QG_PM = RS("QG_PM")
					'N_bj_BD_PM = RS("bj_BD_PM")
					N_bj_QG_PM = RS("bj_QG_PM")
					'N_jci_BD_PM = RS("jci_BD_PM")
					N_jci_QG_PM = RS("jci_QG_PM")
					N_URL = RS("URL")
		END IF
	RS.CLOSE 
	%> 
<html>
<head>
<title>科室类别修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<script language="javascript">

var lsdz = "";
function checkIn()
{
   
    if( document.un.class_name.value.length <1) {
      alert("标题必须填写");
      document.un.class_name.focus();
      return false;
   }

	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="d_class_save_up.asp" name="un">
  <table width="1053" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <input type=hidden name="class_no" value="<%=Request("class_no")%>">
   <input type=hidden name="hs_no" value="<%=N_HS_NO%>">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">名称（不能修改）：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="class_name" value="<%=N_CLASS_NAME%>" size="90">
        </font></small></td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室简介：</td>
      <td width="79%" class="main"> 
		<%
		N_class_desc = REPLACE(N_class_desc,"<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>",chr(13))
		N_class_desc = REPLACE(N_class_desc,"</span></p>",chr(13))
		%>	
        <textarea name="class_desc" rows="10" cols="60"><%=N_class_desc%></textarea>
      </td>
    </tr>

	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46" value="<%=N_qg_pm%>">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46" value="<%=N_jci_qg_pm%>">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46" value="<%=N_bj_qg_pm%>">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室挂号连接URL：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="url" size="46" value="<%=N_url%>">
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">显示顺序：</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="40" value="<%=N_NUM%>"> 
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">对应复旦科室（不能修改）：</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
			
				IF RS1("FD_NO") = N_FD_NO THEN
        %>
		   
        <option value="<%=RS1("FD_NO")%>" selected><%
		
		  %><%=RS1("FD_NAME")%></option>
        <%
		  ELSE
		  %>
		    
        <option value="<%=RS1("FD_NO")%>" ><%
		
		  %><%=RS1("FD_NAME")%></option>
		  <%
		  END IF
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="提交申请" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="重填信息">
           <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
