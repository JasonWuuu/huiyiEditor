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
	IF Request("hs_no") <> "" Then
	MYDQ = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","TYPE")  
	End if
	%> 
<html>
<head>
<title>医生增加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<script language="javascript">
function GoToURL()
{
  
  var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
 // var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLB()
{
  
  var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL3= "&ysclass="+document.un.ysclass.options[document.un.ysclass.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
  document.location=tURL+tURL1+tURL2+tURL3;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_add.asp?yy="+document.un.yy.value;
  document.location=tURL1;
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


	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统增加 </font></div>
<hr>
<form method="POST" action="doctor_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main">
       <select name="hs_no"  onChange="GoToURL()">
	
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
        <option value="<%=RS1("HS_NO")%>" selected>
	
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
        <%
		  ELSE
		  %>
		  
		   <option value="<%=RS1("HS_NO")%>" >
	
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
		  <%
				END IF
				I = I + 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		 
       <input type="text" name="yy" size="10">
		 <input type="button" name="yx" value="查询" onClick=GoToURLA();>
		 <a href="/manage/hosptial/hosptial_add.asp" target="_blank">增加医院</a>
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室：</td>
      <td width="79%" class="main"> 
        <select name="class_no"   onChange="GoToURLB()">
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
        <option value="<%=RS1("CLASS_NO")%>"  selected>
				<%
				else
				%>
				  <option value="<%=RS1("CLASS_NO")%>" >
				<%
				end if
				%>
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=MID(RS1("CLASS_NAME"),1,50)%>
		  </option>
        <%
		  J= J+ 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		   <a href="/manage/d_class/d_class_add.asp" target="_blank">增加科室</a>
      </td>
    </tr>
   <%
   If request("hs_no") = "" then
 	MYDQ = DISPLAY_NAME("HOSPTIAL",MY_HS_NO,"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",MY_HS_NO,"HS_NO","TYPE")  
  End if
   %>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">姓名：</td>
      <td width="79%" class="main"> 
        <input type="text" name="xm" size="50">
       
          </td>
    </tr>
	  
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医生类别：</td>
      <td width="79%" class="main"> 
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
      <td width="21%" class="main">地区：</td>
      <td width="79%" class="main"> 
        <input type="text" name="dq" size="50" value="<%=MYDQ%>">
        
          </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">出诊时间：</td>
      <td width="79%" class="main"> 
        <input type="text" name="worktime" size="50" value="未知">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">行政职务：</td>
      <td width="79%" class="main"> 
      
        <textarea name="zw" rows="5" cols="60"><%=MYXZZW%></textarea>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">工作职称：</td>
      <td width="79%" class="main"> 
	  <%
	  If Request("ysclass") = "研究学者" Then
	  %>
	   <input type="text" name="zch" size="50" value="研究员">
	   <%
	   else
	   %>
        <input type="text" name="zch" size="50" value="主任医师">
     <%
	 End if
	 %>   
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职称：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zc" size="50" value="教授">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术称号：</td>
      <td width="79%" class="main"> 
        <input type="text" name="xs" size="50"  value="博士生导师">
        
          </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学历与其他：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="edu_others" size="46">
       </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">人物概述：</td>
      <td width="79%" class="main"> 
            <textarea name="rwgs" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI概述：</td>
      <td width="79%" class="main"> 
           <textarea name="jcips" rows="10" cols="60"></textarea>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗特长：</td>
      <td width="79%" class="main"> 
        <textarea name="zltc" rows="10" cols="60"></textarea>
      </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">中医/西医：</td>
      <td width="79%" class="main"> 
         <select name="ZYXY" >
     <option value="<%=MYZYXY%>" selected><%=MYZYXY%></option>
        <option value="中医" > 中医</option>
		   <option value="西医" > 西医</option>
			 <option value="中西医结合" >中西医结合</option>
		  </select>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗阶段：</td>
      <td width="79%" class="main"> 
  
        <select name="zljd" >
   <option value="诊治" > 诊治</option>
			
        <option value="诊断" > 诊断</option>
		  
		  </select>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗方式：</td>
      <td width="79%" class="main"> 
        <input type="text" name="zlfs" size="50">
        
          </td>
    </tr>
	 
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位1：</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxta" size="50">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位2：</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxtb" size="50">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位3：</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxtc" size="50">
        
          </td>
    </tr>
	   
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称1：</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCA" size="50">
        
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称2：</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCB" size="50">
        
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称3：</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCC" size="50">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科研方向：</td>
      <td width="79%" class="main"> 
        <textarea name="kyfx" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际任职：</td>
      <td width="79%" class="main"> 
             <textarea name="GJLY_RZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际奖项：</td>
      <td width="79%" class="main"> 
               <textarea name="GJLY_JX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：学术活动：</td>
      <td width="79%" class="main"> 
            <textarea name="GJLY_XS" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：国家级：</td>
      <td width="79%" class="main"> 
		<textarea name="XSZW_GJA" rows="10" cols="60"></textarea>
         
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：省市级：</td>
      <td width="79%" class="main"> 
		<textarea name="XSZW_SS" rows="10" cols="60"></textarea>
        
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：院校级：</td>
      <td width="79%" class="main"> 
        
       <textarea name="XSZW_YX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：杂志任职：</td>
      <td width="79%" class="main"> 
      
        <textarea name="XSZW_ZZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">项目成果：</td>
      <td width="79%" class="main"> 
       
        <textarea name="XMCG_GJ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：国家级：</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_GJA" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：省市级：</td>
      <td width="79%" class="main"> 
       
         <textarea name="JLQK_SS" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：院校级：</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_YX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：其他：</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_QT" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：主要著作：</td>
      <td width="79%" class="main"> 
         <textarea name="ZYLZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：论文发表：</td>
      <td width="79%" class="main"> 
           <textarea name="LWFB" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">病例备忘：</td>
      <td width="79%" class="main"> 
           <textarea name="BLBW" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">重要报道：</td>
      <td width="79%" class="main"> 
          <textarea name="ZYBD" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">社会荣誉：</td>
      <td width="79%" class="main"> 
		 <textarea name="shry" rows="10" cols="60"></textarea>
		
       </td>
    </tr>
	  
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资讯来源：</td>
      <td width="79%" class="main"> 
       
       <textarea name="zxly" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
      
         <textarea name="zlly" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	   
	  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否是HTML方式：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="是">
        是 
        <input type="radio" name="if_html" value="否" checked>
        否 </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30">
     
       
      </td>
    </tr>
    
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">头像图片：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="zp" size="16"><font color=red>输入名次就可以了，FTP上传，制作小的图片400X600的，可以为空</font>
       </td>
    </tr>

	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46"  value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46"  value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46"  value="100000">
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
