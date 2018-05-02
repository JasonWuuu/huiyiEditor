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
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"

		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>医生信息详细内容</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main"><%=RS("XM")%>-详细内容 </font></div>


  <table width="800" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="0" align="center" cellpadding="6" bgcolor="#000000">
   
     <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
       <%=rs("xm")%>&nbsp;&nbsp;<%=rs("JCIPS")%>
   </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
       医生概述：<%=rs("ysgs")%>
        
          </td>
    </tr>
	 
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="79%" class="main"> 
				医学专长：<br>
        诊疗特长：<%=rs("zltc")%><br>
        科研方向：<%=rs("kyfx")%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
		 国际领域：<br>
		 国际任职：<%=rs("GJLY_RZ")%><p>
		 国际奖项：<%=rs("GJLY_JX")%><p>
		 学术活动：<%=rs("GJLY_XS")%><p>
         
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
		 学术职务：<br>
		 国家级：<%=rs("XSZW_GJA")%><p>
		 省市级：<%=rs("XSZW_SS")%><p>
		 院校级：<%=rs("XSZW_YX")%><p>
     杂志任职：<%=rs("XSZW_ZZ")%><p>  
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     <td width="79%" class="main"> 
	   项目成果：<br>
		 <%=rs("XMCG_GJ")%><p>
		
		 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
     获奖情况：<br>
		 国家级：<%=rs("JLQK_GJA")%><p>
		 省市级：<%=rs("JLQK_SS")%><p>
		 院校级：<%=rs("JLQK_YX")%><p>
     其他：<%=rs("JLQK_QT")%><p>  
        
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
     主要论著：<br>
		 主要著作：<%=rs("ZYLZ")%><p>
		 论文发表：<%=rs("LWFB")%><p>
		
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
    
      <td width="79%" class="main"> 
     病例备忘：<%=rs("BLBW")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
        <td width="79%" class="main"> 
      重要报道： <%=rs("ZYBD")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
        <td width="79%" class="main"> 
       社会荣誉：<%=rs("SHRY")%>
        
          </td>
    </tr>
	
    <tr bgcolor="#FFFFFF"> 
      <td > 
        <div align="center"><br>
           <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
