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
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR_DESC WHERE id = '" & REQUEST("id") & "'"

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

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统-详细内容 </font></div>
<hr>
<form method="POST" action="doctor_save_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1180" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">科室：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",rs("class_no"),"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">姓名：</td>
      <td width="79%" class="main"> 
       <%=rs("xm")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"> 
        <%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")
        %> 
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医生类别：</td>
      <td width="79%" class="main"> 
        <%=rs("YSCLASS")%>
        
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地区：</td>
      <td width="79%" class="main"> 
        <%=rs("dq")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">行政职务：</td>
      <td width="79%" class="main"> 
        <%=rs("zw")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">工作职称：</td>
      <td width="79%" class="main"> 
       <%=rs("zch")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职称：</td>
      <td width="79%" class="main"> 
      <%=rs("zc")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术称号：</td>
      <td width="79%" class="main"> 
       <%=rs("XS")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学历与其他：</td>
      <td width="79%" class="main"> 
       <%=rs("edu_others")%>
      </td>
    </tr>
	 
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">中医/西医：</td>
      <td width="79%" class="main"> 
        <%=rs("ZYXY")%>
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗特长：</td>
      <td width="79%" class="main"> 
       <%=rs("zltc")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗阶段：</td>
      <td width="79%" class="main"> 
       <%=rs("ZLJD")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗方式：</td>
      <td width="79%" class="main"> 
       <%=rs("ZLFS")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位1：</td>
      <td width="79%" class="main"> 
        <%=rs("JBXTA")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位2：</td>
      <td width="79%" class="main"> 
        <%=rs("JBXTB")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位3：</td>
      <td width="79%" class="main"> 
       <%=rs("JBXTC")%>
        
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称1：</td>
      <td width="79%" class="main"> 
           <%=rs("JBMCA")%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称2：</td>
      <td width="79%" class="main"> 
         <%=rs("JBMCB")%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称3：</td>
      <td width="79%" class="main"> 
        <%=rs("JBMCC")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科研方向：</td>
      <td width="79%" class="main"> 
      <%=rs("kyfx")%>
      </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">人物概述：</td>
      <td width="79%" class="main"> 
         <%=rs("rwgs")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI概述：</td>
      <td width="79%" class="main"> 
          <%=rs("jcips")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医生概述：</td>
      <td width="79%" class="main"> 
         <%=rs("ysgs")%>
          </td>
    </tr>
	  
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际任职：</td>
      <td width="79%" class="main"> 
          <%=rs("GJLY_RZ")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际奖项：</td>
      <td width="79%" class="main"> 
            <%=rs("GJLY_JX")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：学术活动：</td>
      <td width="79%" class="main"> 
          <%=rs("GJLY_XS")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：国家级：</td>
      <td width="79%" class="main"> 
          <%=rs("XSZW_GJA")%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：省市级：</td>
      <td width="79%" class="main"> 
          <%=rs("XSZW_SS")%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：院校级：</td>
      <td width="79%" class="main"> 
         <%=rs("XSZW_YX")%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：杂志任职：</td>
      <td width="79%" class="main"> 
         <%=rs("XSZW_ZZ")%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">项目成果：</td>
      <td width="79%" class="main"> 
         <%=rs("XMCG_GJ")%>
          </td>
    </tr>
	 	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：国家级：</td>
      <td width="79%" class="main"> 
          <%=rs("JLQK_GJA")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：省市级：</td>
      <td width="79%" class="main"> 
           <%=rs("JLQK_SS")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：院校级：</td>
      <td width="79%" class="main"> 
            <%=rs("JLQK_YX")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：其他：</td>
      <td width="79%" class="main"> 
             <%=rs("JLQK_QT")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：主要著作：</td>
      <td width="79%" class="main"> 
            <%=rs("ZYLZ")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：论文发表：</td>
      <td width="79%" class="main"> 
           <%=rs("LWFB")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">病例备忘：</td>
      <td width="79%" class="main"> 
         <%=rs("BLBW")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">重要报道：</td>
      <td width="79%" class="main"> 
          <%=rs("ZYBD")%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">社会荣誉：</td>
      <td width="79%" class="main"> 
        <%=rs("shry")%>
      </td>
    </tr>
	 	 
	  	
	 
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资讯来源：</td>
      <td width="79%" class="main"> 
        <%=rs("zxly")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
        <%=rs("zlly")%>
        
          </td>
    </tr>
    
	

	 
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <%=rs("info_find")%>
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">头像图片：</td>
      <td width="79%" class="main"> 
		 <img src=/pic/<%=rs("zp")%><font color=red>输入名次就可以了，FTP上传，制作小的图片400X600的，可以为空</font>
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
