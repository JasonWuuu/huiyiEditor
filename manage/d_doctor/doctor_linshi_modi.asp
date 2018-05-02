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
	IF Request("hs_no") <> "" Then
	MYDQ = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","TYPE")  
	End if
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR_LINSHI WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>医生信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<script language="javascript">
function GoToURLB()
{
  
  var tURL= "doctor_linshi_modi.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL3= "&ysclass="+document.un.ysclass.options[document.un.ysclass.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
   var tURL4 = "&no="+document.un.no.value;
  document.location=tURL+tURL1+tURL2+tURL3+tURL4;
}
</script>
<script language="javascript">
function GoToURL()
{
  
  var tURL= "doctor_linshi_modi.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "&no="+document.un.no.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_linshi_modi.asp?yy="+document.un.yy.value;
  var tURL2 = "&no="+document.un.no.value;
  document.location=tURL1+tURL2;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
      if( document.un.class_no.options[document.un.class_no.selectedIndex].value <1) {
      alert("科室必须选择");
      document.un.class_no.focus();
      return false;
   }
    
    if( document.un.hs_no.options[document.un.hs_no.selectedIndex].value <1) {
      alert("医院必须选择");
      document.un.hs_no.focus();
      return false;
   }
    
   
   
    if( document.un.xm.value.length <1) {
      alert("姓名必须填写");
      document.un.xm.focus();
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统修改（*）部分算绩效考核 </font></div>
<hr>
<form method="POST" action="doctor_linshi_save.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1072" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">医院：</td>
      <td width="55%" class="main"> 
        <select name="hs_no"  onChange="GoToURL()">
          <option value="" selected>请选择医院</option>
          <%
			  if request("yy") <> "" then
			   SQL = "SELECT * FROM HOSPTIAL WHERE HS_NAME LIKE '%" & Request("yy") & "%' or alice_name like '%" & Request("yy") & "%' ORDER BY HS_NAME"
			  else
			   SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
			  end if
       
        RS1.OPEN SQL,CONN,1,1
		  I = 1
        DO WHILE NOT RS1.EOF 
							  IF I = 1 AND Request("hs_no") = "" THEN
							  MY_HS_NO = RS1("HS_NO")
							  MYXZZW = RS1("HS_NAME")
							  ELSE
									if Request("hs_no") <> "" then
									MY_HS_NO = Request("hs_no")
									end if
							  END IF
		  		IF Request("HS_NO") = RS1("HS_NO") THEN
						MYXZZW = RS1("HS_NAME")
        %> 
          <option value="<%=RS1("HS_NO")%>" selected> <%=MID(RS1("HS_NAME"),1,50)%></option>
          <%
		  ELSE
		  %> 
          <option value="<%=RS1("HS_NO")%>" > <%=MID(RS1("HS_NAME"),1,50)%></option>
          <%
				END IF
				I = I + 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="查询" onClick=GoToURLA();> <a href="/manage/hosptial/hosptial_add.asp" target="_blank">增加医院</a>
      </td>
      <td width="35%" class="main"><b><font color="#FF3300">原内容</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">科室：</td>
      <td width="55%" class="main"> 
        <select name="class_no"   onChange="GoToURLB()">
          <option value="" selected>请选择科室</option>
          <%
        SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & MY_HS_NO & "' ORDER BY CLASS_NAME"
        RS1.OPEN SQL,CONN,1,1
		  	J = 1
        DO WHILE NOT RS1.EOF 
								IF J = 1 AND Request("class_no") = "" THEN
							  MY_CH_NO = RS1("CLASS_NO")
							  MYXZZW = MYXZZW & RS1("CLASS_NAME")
							  ELSE
									if Request("class_no") <> "" then
									MY_CH_NO = Request("class_no")
									end if
							  END IF
				IF REQUEST("CLASS_NO") = RS1("CLASS_NO") THEN
				MYXZZW = MYXZZW & RS1("CLASS_NAME")
        %> 
          <option value="<%=RS1("CLASS_NO")%>"  selected> <%
				else
				%> 
          <option value="<%=RS1("CLASS_NO")%>" > <%
				end if
				%> <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %> <%=MID(RS1("CLASS_NAME"),1,50)%> </option>
          <%
		  J= J+ 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>  <a href="/manage/d_class/d_class_add.asp" target="_blank">增加科室</a>
      </td>
      <td rowspan="11" class="main" valign="top"><%=rs("YNR")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">编号：</td>
      <td width="55%" class="main"> <%=rs("no")%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">姓名：</td>
      <td width="55%" class="main"> 
        <input type="text" name="xm" size="50" value="<%=rs("xm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">医生类别：</td>
      <td width="55%" class="main"> 
        <select name="ysclass" >
          <option value="首席大医生" > 首席大医生</option>
          <option value="大医生" > 大医生</option>
          <option value="研究学者" >研究学者</option>
		    <option value="首席研究学者" >首席研究学者</option>
          <%
			 If request("ysclass") <> "" Then
			 %> 
          <option value="<%=request("ysclass")%>" selected> <%=request("ysclass")%></option>
          <%
			 End if
			 %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">地区：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="dq" size="50" value="<%=MYDQ%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">出诊时间：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="worktime" size="50" value="<%=rs("worktime")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">行政职务：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="zw" rows="5" cols="60"><%=rs("zw")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">工作职称：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zch" size="50" value="<%=rs("zch")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术职称：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zc" size="50" value="<%=rs("zc")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术称号：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="xs" size="50" value="<%=rs("xs")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学历与其他：</td>
      <td width="55%" class="main"> 
        <input type="text" name="edu_others" size="46"  value="<%=rs("edu_others")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">人物概述：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="rwgs" rows="10" cols="60"><%=rs("rwgs")%></textarea>
      </td>
      <td class="main" valign="bottom" width="35%"><b><font color="#FF0000">处理后剩下的内容</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">JCI概述：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="jcips" rows="10" cols="60"><%=rs("jcips")%></textarea>
      </td>
      <td rowspan="36" class="main" valign="top"><%=rs("XNR")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">诊疗特长：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="zltc" rows="10" cols="60"><%=rs("zltc")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">中医/西医：</td>
      <td width="55%" class="main"> 
        <select name="ZYXY" >
          <option value="<%=rs("ZYXY")%>" selected><%=rs("ZYXY")%></option>
          <option value="中医" > 中医</option>
          <option value="西医" > 西医</option>
          <option value="中西医结合" >中西医结合</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">诊疗阶段：(*)</td>
      <td width="55%" class="main"> 
        <select name="zljd" >
          <option value="<%=rs("zljd")%>" selected> <%=rs("zljd")%></option>
          <option value="诊断" > 诊断</option>
          <option value="诊治" > 诊治</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">诊疗方式：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zlfs" size="50"  value="<%=rs("zlfs")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">擅长疾病系统/部位1：(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxta" size="50"  value="<%=rs("jbxta")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">擅长疾病系统/部位2：</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxtb" size="50"  value="<%=rs("jbxtb")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">擅长疾病系统/部位3：</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxtc" size="50"  value="<%=rs("jbxtc")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">疾病名称1：</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCA" size="50"   value="<%=rs("JBMCA")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">疾病名称2：</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCB" size="50"  value="<%=rs("JBMCB")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">疾病名称3：</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCC" size="50" value="<%=rs("JBMCC")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">科研方向：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="kyfx" rows="10" cols="60"><%=rs("kyfx")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">国际领域：国际任职：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_RZ" rows="10" cols="60"><%=rs("GJLY_RZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">国际领域：国际奖项：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_JX" rows="10" cols="60"><%=rs("GJLY_JX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">国际领域：学术活动：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_XS" rows="10" cols="60"><%=rs("GJLY_XS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术职务：国家级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_GJA" rows="10" cols="60"><%=rs("XSZW_GJA")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术职务：省市级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_SS" rows="10" cols="60"><%=rs("XSZW_SS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术职务：院校级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_YX" rows="10" cols="60"><%=rs("XSZW_YX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">学术职务：杂志任职：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_ZZ" rows="10" cols="60"><%=rs("XSZW_ZZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">项目成果：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XMCG_GJ" rows="10" cols="60"><%=rs("XMCG_GJ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">获奖情况：国家级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_GJA" rows="10" cols="60"><%=rs("JLQK_GJA")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">获奖情况：省市级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_SS" rows="10" cols="60"><%=rs("JLQK_SS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">获奖情况：院校级：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_YX" rows="10" cols="60"><%=rs("JLQK_YX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">获奖情况：其他：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_QT" rows="10" cols="60"><%=rs("JLQK_QT")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">主要论著：主要著作：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="ZYLZ" rows="10" cols="60"><%=rs("ZYLZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">主要论著：论文发表：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="LWFB" rows="10" cols="60"><%=rs("LWFB")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">病例备忘：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="BLBW" rows="10" cols="60"><%=rs("BLBW")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">重要报道：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="ZYBD" rows="10" cols="60"><%=rs("ZYBD")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">社会荣誉：(*)</td>
      <td width="55%" class="main"> 
        <textarea name="shry" rows="10" cols="60"><%=rs("shry")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">资讯来源：</td>
      <td width="55%" class="main"> 
        <textarea name="zxly" rows="10" cols="60"><%=rs("zxly")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">资料来源：</td>
      <td width="55%" class="main"> 
        <textarea name="zlly" rows="10" cols="60"><%=rs("zlly")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">查找字符串：</td>
      <td width="55%" class="main"> 
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">头像图片：</td>
      <td width="55%" class="main"> 
        <input type="text" name="zp" size="16" value="<%=rs("zp")%>">
        <font color=red>输入名次就可以了，FTP上传，制作小的图片400X600的，可以为空</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">全国排名：</td>
      <td width="55%" class="main"> 
        <input type="text" name="qg_pm" size="46"  value="<%=rs("qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">北大全国排名：</td>
      <td width="55%" class="main"> 
        <input type="text" name="bj_qg_pm" size="46"  value="<%=rs("bj_qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">JCI全国排名：</td>
      <td width="55%" class="main"> 
        <input type="text" name="jci_qg_pm" size="46"  value="<%=rs("jci_qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="3"> 
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

