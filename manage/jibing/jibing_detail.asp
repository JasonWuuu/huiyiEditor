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
	
	SQL = "SELECT TOP 1 * FROM JIBING WHERE JB_NO = '" & REQUEST("JB_NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>疾病信息详细内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）疾病系统-详细内容 </font></div>
<hr>
<form method="POST" action="jibing_save_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室：</td>
      <td width="79%" class="main"> 
        <%=DISPLAY_NAME("FD_CLASS",rs("fd_no"),"FD_NO","FD_NAME")
        %> 
      </td>
    </tr>
   
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">就诊一级科室：</td>
      <td width="79%" class="main">
       <%=rs("p_class_no")%>
       
          </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">就诊二级科室：</td>
      <td width="79%" class="main">
       <%=rs("class_no")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病别名：</td>
      <td width="79%" class="main">
       <%=rs("jb_bm")%>
       
          </td>
    </tr>
	 
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">部位：</td>
      <td width="79%" class="main">
       <%=rs("bw")%>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">症状列表：</td>
      <td width="79%" class="main">
        <%
	=rs("zzlb")
        %>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">常见症状：</td>
      <td width="79%" class="main">
        <%
	=rs("cjzz")
        %>
       
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">常见病因：</td>
      <td width="79%" class="main">
        <%
		=rs("cjby")
		
        %>
       
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">辅助判断：</td>
      <td width="79%" class="main"> 
       <%
		=rs("fzpd")
		
        %>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否传染：</td>
      <td width="79%" class="main"> 
        <%=rs("sfcr")%>
      </td>
    </tr>
   
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <%=rs("info_find")%>
      </td>
    </tr>
    
	 <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">推广地址：</td>
      <td width="68%" class="main"> 
     http://www.dakayi.net/jibing/J<%=REQUEST("JB_NO")%>.html
        
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
	 <td width="32%" class="main">现在推广:</td>
      <td width="68%" class="main"> 
     <a href="http://zhanzhang.baidu.com/linksubmit/url" target='_blank'>打开百度推广</a> （复制上面的网址进行提交）
        
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
