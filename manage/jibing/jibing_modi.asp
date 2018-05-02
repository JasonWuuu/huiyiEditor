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
<title>疾病信息修改</title>
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
     if( document.un.fd_no.options[document.un.fd_no.selectedIndex].value <1) {
      alert("科室必须选择");
      document.un.fd_no.focus();
      return false;
   }
    
   
   
    if( document.un.jb_name.value.length <1) {
      alert("疾病必须填写");
      document.un.jb_name.focus();
      return false;
   }


	if( document.un.info_find.value.length <1) {
      alert("查找字符一定要有，查询什么能查到该文章");
      document.un.info_find.focus();
      return false;
   }
  
	
	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统增加 </font></div>
<hr>
<form method="POST" action="jibing_save_up.asp" name="un">
<input type="hidden" name="jb_no" value="<%=Request("jb_no")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室：</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
          <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF RS1("FD_NO") = RS("FD_NO") THEN
        %>
        <option value="<%=RS1("FD_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("FD_NO")%>" >
				<%
				END IF
				%>
		  
		  <%=RS1("FD_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">就诊一级科室：</td>
      <td width="79%" class="main">
        <input type="text" name="p_class_no" size="50" value="<%=rs("p_class_no")%>">
      
          </td>
    </tr>
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">就诊二级科室：</td>
      <td width="79%" class="main">
        <input type="text" name="class_no" size="50" value="<%=rs("class_no")%>">
      
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称：</td>
      <td width="79%" class="main">
        <input type="text" name="jb_name" size="50" value="<%=rs("jb_name")%>">
       
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">部位：</td>
      <td width="79%" class="main">
        <input type="text" name="bw" size="50" value="<%=rs("bw")%>">
       
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病别名：</td>
      <td width="79%" class="main">
        <input type="text" name="jb_bm" size="50" value="<%=rs("jb_bm")%>">
       
          </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">症状列表：</td>
      <td width="79%" class="main"> 
        <textarea name="zzlb" rows="10" cols="60"><%=rs("zzlb")%></textarea>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">常见症状：</td>
      <td width="79%" class="main"> 
        <textarea name="cjzz" rows="10" cols="60"><%=rs("cjzz")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">常见病因：</td>
      <td width="79%" class="main"> 
        <textarea name="cjby" rows="10" cols="60"><%=rs("cjby")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">辅助判断：</td>
      <td width="79%" class="main"> 
        <textarea name="fzpd" rows="10" cols="60"><%=rs("fzpd")%></textarea>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否传染：</td>
      <td width="79%" class="main">
        <input type="text" name="sfcr" size="10" value="<%=rs("sfcr")%>">
       
          </td>
    </tr>
	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否常见疾病：</td>
      <td width="79%" class="main">
        <select name="cjjb" >
	       
        <option value="是" >是</option>
		 <option value="否" >否</option>
		 <option value="<%=rs("cjjb")%>" selected><%=rs("cjjb")%></option>
		 
        </select>
          </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
     
       
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">显示顺序：</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="30" value="<%=rs("num")%>">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病报告：</td>
      <td width="79%" class="main"> 
        <textarea name="jbbg" rows="10" cols="60"><%=rs("jbbg")%></textarea>
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
