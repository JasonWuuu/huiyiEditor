<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'作者：马洪岩  于 2002-4-21 编写
	'功能：增加文章
	'操作：本脚本操作人员操作
 '判断级别
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
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
	SQL = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>医院信息详细内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）医院系统-详细内容 </font></div>
<hr>
<form method="POST" action="hosptial_save_up.asp" name="un">
<input type="hidden" name="hs_no" value="<%=Request("hs_no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
 
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院名称：</td>
      <td width="79%" class="main">
        <%=rs("hs_name")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院别名：</td>
      <td width="79%" class="main">
        <%=rs("alice_name")%>
       
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院简介：</td>
      <td width="79%" class="main"> 
        <textarea name="hs_desc" rows="10" cols="60"><%=rs("hs_desc")%></textarea>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病：</td>
      <td width="79%" class="main"> 
        <textarea name="scjb" rows="10" cols="60"><%=rs("scjb")%></textarea>
      </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院地区：</td>
      <td width="79%" class="main"> 
        <%=rs("area")%>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">所属高校：</td>
      <td width="79%" class="main"> 
        <%=rs("yy_fs")%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院等级：</td>
      <td width="79%" class="main"> 
        <%=rs("yy_dj")%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院照片：</td>
      <td width="79%" class="main">
       <img src="http://img.dakayi.net/pic/<%=rs("img")%>">
        
          </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">经营性质：</td>
      <td width="79%" class="main"> 
       <%=rs("PROPERTY")%>
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否部队：</td>
      <td width="79%" class="main"> 
       <%=rs("SF_TROOPS")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">综合/专科：</td>
      <td width="79%" class="main"> 
       <%=rs("ZHMODE")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医种：</td>
      <td width="79%" class="main"> 
       
      <%=rs("TYPE")%>
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">网址：</td>
      <td width="79%" class="main"> 
		 <a href="<%=rs("url")%>" target="_blank"><%=rs("url")%></a>
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">电话：</td>
      <td width="79%" class="main"> 
       
       <%=rs("TEL")%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">挂号链接：</td>
      <td width="79%" class="main"> 
 
     <a href="<%=rs("SEND_URL")%>" target="_blank"><%=rs("SEND_URL")%></a>
       
      </td>
    </tr>
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地址：</td>
      <td width="79%" class="main"> 
 
     <%=rs("address")%>
       
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
       <%=rs("info_find")%>
     
       
      </td>
    </tr>
    
   
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <%=rs("qg_pm")%>
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <%=rs("bj_qg_pm")%>
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <%=rs("jci_qg_pm")%>
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
