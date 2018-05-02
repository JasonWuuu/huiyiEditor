<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
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
 
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("doctor_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		 s_class_no = request("class_no")
		 s_xm =  request("xm")
		 s_hs_no = request("hs_no")
		 s_ysclass = request("ysclass")
		 s_dq = request("dq")
		 s_zw = request("zw")
		 s_zch = request("zch")
		 s_zc = request("zc")
		 s_xs = request("xs")
		 s_jbxta = request("jbxta")
		 s_jbxtb = request("jbxtb")
		 s_jbxtc = request("jbxtc")
		 s_zltc = request("zltc")
		 s_zljd = request("zljd")
		 s_zlfs = request("zlfs")
		 s_kyfx = request("kyfx")
		  s_jcips = request("jcips")
		  s_worktime = request("worktime")
		 s_ysgs = request("zw") & "；" & Request("zch") & "，" & Request("zc") & "，" & Request("xs") & "；" & Request("rwgs") 
		 s_rwgs = request("rwgs")
		 s_GJLY_RZ = request("GJLY_RZ")
		 s_GJLY_JX = request("GJLY_JX")
		 s_GJLY_XS = request("GJLY_XS")
		 s_XSZW_GJA = request("XSZW_GJA")
		 s_XSZW_SS = request("XSZW_SS")
		 s_XSZW_YX = request("XSZW_YX")
		 s_XSZW_ZZ = request("XSZW_ZZ")
		 s_XMCG_GJ = request("XMCG_GJ")
		 's_XMCG_GJA = request("XMCG_GJA")
		 's_XMCG_SS = request("XMCG_SS")
		 's_XMCG_YX = request("XMCG_YX")
		 s_JLQK_GJA = request("JLQK_GJA")
		 s_JLQK_SS = request("JLQK_SS")
		 s_JLQK_YX = request("JLQK_YX")
			s_JLQK_QT = request("JLQK_QT")
			s_ZYLZ = request("ZYLZ")
			s_LWFB = request("LWFB")
			s_BLBW = request("BLBW")
			s_ZYBD = request("ZYBD")
			s_ZYXY = request("ZYXY")
			s_JBMCA = request("JBMCA")
			s_JBMCB = request("JBMCB")
			s_JBMCC = request("JBMCC")
			s_zxly = request("zxly")
		  s_zlly = request("zlly")
			s_edu_others = request("edu_others")
		  s_shry = request("shry")
		 ' s_sfsx = request("sfsx")
		  s_if_html =  request("if_html")
		 s_info_find =  request("info_find")
		 s_info_corre =  request("info_corre")
		 s_zp =  request("zp")
		 s_bd_pm = request("bd_pm")
		 s_qg_pm = request("qg_pm")
		 s_bj_bd_pm = request("bj_bd_pm")
		 s_bj_qg_pm = request("bj_qg_pm")
		 s_jci_bd_pm = request("jci_bd_pm")
		 s_jci_qg_pm = request("jci_qg_pm")
		

	'先判断一下这个医院科室在科室数据表是否存在

		 	SQL = "SELECT TOP 1 * FROM D_CLASS WHERE hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 Then
					s_info_find = s_info_find & RS("CLASS_NAME") & s_xm
					s_qg_pm = rs("qg_pm")
					ELSE
					Response.Write "在科室数据表中该医院的科室没有录入，请先录入该医院的科室，谢谢！"
					Response.End 
					END IF
				RS.Close 


					SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE XM = '" & s_xm & "' and hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "记录增加重复，姓名，医院，科室一样"
					Response.End 
					END IF
				RS.Close 
				
				WB_FILE_NO = "D" & ID_NAME("DOCTOR_NO")
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_DOCTOR"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("XM") = s_xm
	  				RS1("hs_no") = s_hs_no
					  RS1("ysclass") = s_ysclass
						RS1("dq") = s_dq
						RS1("worktime") = s_worktime
						RS1("zw") = s_zw
						RS1("zch") = s_zch
						RS1("zc") = s_zc
						RS1("XS") = S_XS
						RS1("JBXTA") = S_JBXTA
						RS1("JBXTB") = S_JBXTB
						RS1("JBXTC") = S_JBXTC
						RS1("ZLJD") = S_ZLJD
						RS1("ZLFS") = S_ZLFS
						RS1("KYFX") = S_KYFX
						RS1("zltc") = s_zltc
						RS1("jcips") = S_jcips
						RS1("ysgs") = S_ysgs
						RS1("rwgs") = S_rwgs
						RS1("GJLY_RZ") = S_GJLY_RZ
						RS1("GJLY_JX") = S_GJLY_JX
						RS1("GJLY_XS") = S_GJLY_XS
						RS1("XSZW_GJA") = S_XSZW_GJA
						RS1("XSZW_SS") = S_XSZW_SS
						RS1("XSZW_YX") = S_XSZW_YX
						RS1("XSZW_ZZ") = S_XSZW_ZZ
						RS1("XMCG_GJ") = S_XMCG_GJ
						'RS1("XMCG_GJA") = S_XMCG_GJA
						'RS1("XMCG_SS") = S_XMCG_SS
						'RS1("XMCG_YX") = S_XMCG_YX
						RS1("JLQK_GJA") = S_JLQK_GJA
						RS1("JLQK_SS") = S_JLQK_SS
						RS1("JLQK_YX") = S_JLQK_YX
						RS1("JLQK_QT") = S_JLQK_QT
						RS1("ZYLZ") = S_ZYLZ
						RS1("LWFB") = S_LWFB
						RS1("BLBW") = S_BLBW
						RS1("ZYBD") = S_ZYBD
						RS1("ZYXY") = S_ZYXY
						RS1("JBMCA") = S_JBMCA
						RS1("JBMCB") = S_JBMCB
						RS1("JBMCC") = S_JBMCC
						RS1("ZXLY") = S_ZXLY
						RS1("ZLLY") = S_ZLLY
						RS1("EDU_OTHERS") = S_EDU_OTHERS
						RS1("SHRY") = S_SHRY
						'RS1("SFSX") = S_SFSX
	  				RS1("info_find") = s_info_find & "," & DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME") & "," & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
	  				'RS1("info_corre") = s_info_corre
	  				RS1("NO") = WB_FILE_NO
	  				'RS1("IF_HTML") = s_if_html
						RS1("ZP") = s_zp
						'RS1("BD_PM") = s_bd_pm
						RS1("QG_PM") = s_qg_pm
						'RS1("BJ_BD_PM") = s_bj_bd_pm
						RS1("BJ_QG_PM") = s_bj_qg_pm
						'RS1("JCI_BD_PM") = s_jci_bd_pm
						RS1("JCI_QG_PM") = s_jci_qg_pm
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1("GX_USER") = Request.Cookies("user_name")
					
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				
					
					'增加备注数据表
					
					SQL = "SELECT top 1 * FROM D_DOCTOR_DESC"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("XM") = s_xm
	  				RS1("hs_no") = s_hs_no
					  RS1("ysclass") = s_ysclass
						RS1("dq") = s_dq
						RS1("worktime") = s_worktime
						RS1("zw") = s_zw
						RS1("zch") = s_zch
						RS1("zc") = s_zc
						RS1("XS") = S_XS
						RS1("JBXTA") = S_JBXTA
						RS1("JBXTB") = S_JBXTB
						RS1("JBXTC") = S_JBXTC
						RS1("ZLJD") = S_ZLJD
						RS1("ZLFS") = S_ZLFS
						RS1("KYFX") = S_KYFX
						RS1("zltc") = s_zltc
						RS1("jcips") = S_jcips
						RS1("ysgs") = S_ysgs
						RS1("rwgs") = S_rwgs
						RS1("GJLY_RZ") = S_GJLY_RZ
						RS1("GJLY_JX") = S_GJLY_JX
						RS1("GJLY_XS") = S_GJLY_XS
						RS1("XSZW_GJA") = S_XSZW_GJA
						RS1("XSZW_SS") = S_XSZW_SS
						RS1("XSZW_YX") = S_XSZW_YX
						RS1("XSZW_ZZ") = S_XSZW_ZZ
						RS1("XMCG_GJ") = S_XMCG_GJ
						'RS1("XMCG_GJA") = S_XMCG_GJA
						'RS1("XMCG_SS") = S_XMCG_SS
						'RS1("XMCG_YX") = S_XMCG_YX
						RS1("JLQK_GJA") = S_JLQK_GJA
						RS1("JLQK_SS") = S_JLQK_SS
						RS1("JLQK_YX") = S_JLQK_YX
						RS1("JLQK_QT") = S_JLQK_QT
						RS1("ZYLZ") = S_ZYLZ
						RS1("LWFB") = S_LWFB
						RS1("BLBW") = S_BLBW
						RS1("ZYBD") = S_ZYBD
						RS1("ZYXY") = S_ZYXY
						RS1("JBMCA") = S_JBMCA
						RS1("JBMCB") = S_JBMCB
						RS1("JBMCC") = S_JBMCC
						RS1("ZXLY") = S_ZXLY
						RS1("ZLLY") = S_ZLLY
						RS1("EDU_OTHERS") = S_EDU_OTHERS
						RS1("SHRY") = S_SHRY
						'RS1("SFSX") = S_SFSX
	  				RS1("info_find") = s_info_find & "," & DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME") & "," & DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
	  				'RS1("info_corre") = s_info_corre
	  				RS1("NO") = WB_FILE_NO
	  			'	RS1("IF_HTML") = s_if_html
						RS1("ZP") = s_zp
						RS1("QG_PM") = s_qg_pm
						RS1("BJ_QG_PM") = s_bj_qg_pm
						RS1("JCI_QG_PM") = s_jci_qg_pm
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1("GX_USER") = Request.Cookies("user_name")
						RS1("CAOZUO") = "增加"
	  				RS1.UpdateBatch 
	  				RS1.Close 
					
					SQL = "DELETE FROM D_DOCTOR_LINSHI WHERE NO = '" & REQUEST("NO") & "'"
					CONN.Execute(SQL)
					
					
							XM = s_xm
		YY = ""
		SQL1 = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NO = '" & s_hs_no & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
			YY = RS1("HS_NAME")
			END IF
			RS1.CLOSE 
			KS=""
		SQL1 = "SELECT TOP 1 * FROM D_CLASS WHERE CLASS_NO = '" & s_class_no & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
			KS = RS1("CLASS_NAME")
			END IF
			RS1.CLOSE 
			ZLTC = s_zltc
		jbzz = ""




				SQL = "SELECT top 1 * FROM D_DOCTOR WHERE NO = '" & WB_FILE_NO & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
					RS9("INFO_FIND") = XM & YY & KS & ZLTC 
					RS9.UpdateBatch 
	  				RS9.Close 
					
					
%>
<html>
<head>
<title>内容与文章增加成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统增加 </font></div>
<hr>
<form method="POST" action="doctor_main.asp" name="un" >
  <table width="1180" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">类别：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">姓名：</td>
      <td width="79%" class="main"> 
       <%=s_xm%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"> 
        <%=DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
        %> 
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医生类别：</td>
      <td width="79%" class="main"> 
        <%=s_YSCLASS%>
        
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地区：</td>
      <td width="79%" class="main"> 
        <%=s_dq%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">出诊时间：</td>
      <td width="79%" class="main"> 
        <%=s_worktime%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">行政职务：</td>
      <td width="79%" class="main"> 
        <%=s_zw%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">工作职称：</td>
      <td width="79%" class="main"> 
       <%=s_zch%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职称：</td>
      <td width="79%" class="main"> 
      <%=s_zc%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术称号：</td>
      <td width="79%" class="main"> 
       <%=s_XS%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学历与其他：</td>
      <td width="79%" class="main"> 
       <%=s_edu_others%>
      </td>
    </tr>
	
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">中医/西医：</td>
      <td width="79%" class="main"> 
        <%=s_ZYXY%>
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗特长：</td>
      <td width="79%" class="main"> 
       <%=s_zltc%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗阶段：</td>
      <td width="79%" class="main"> 
       <%=s_ZLJD%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">诊疗方式：</td>
      <td width="79%" class="main"> 
       <%=s_ZLFS%>
        
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位1：</td>
      <td width="79%" class="main"> 
        <%=s_JBXTA%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位2：</td>
      <td width="79%" class="main"> 
        <%=s_JBXTB%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长疾病系统/部位3：</td>
      <td width="79%" class="main"> 
       <%=s_JBXTC%>
        
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称1：</td>
      <td width="79%" class="main"> 
           <%=s_JBMCA%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称2：</td>
      <td width="79%" class="main"> 
         <%=s_JBMCB%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">疾病名称3：</td>
      <td width="79%" class="main"> 
        <%=s_JBMCC%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科研方向：</td>
      <td width="79%" class="main"> 
      <%=s_kyfx%>
      </td>
    </tr>
	  
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI概述：</td>
      <td width="79%" class="main"> 
          <%=s_jcips%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医生概述：</td>
      <td width="79%" class="main"> 
         <%=s_ysgs%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">人物概述：</td>
      <td width="79%" class="main"> 
         <%=s_rwgs%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际任职：</td>
      <td width="79%" class="main"> 
          <%=s_GJLY_RZ%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：国际奖项：</td>
      <td width="79%" class="main"> 
            <%=s_GJLY_JX%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">国际领域：学术活动：</td>
      <td width="79%" class="main"> 
          <%=s_GJLY_XS%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：国家级：</td>
      <td width="79%" class="main"> 
          <%=s_XSZW_GJA%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：省市级：</td>
      <td width="79%" class="main"> 
          <%=s_XSZW_SS%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：院校级：</td>
      <td width="79%" class="main"> 
         <%=s_XSZW_YX%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">学术职务：杂志任职：</td>
      <td width="79%" class="main"> 
         <%=s_XSZW_ZZ%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">项目成果：</td>
      <td width="79%" class="main"> 
         <%=s_XMCG_GJ%>
          </td>
    </tr>
	 
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：国家级：</td>
      <td width="79%" class="main"> 
          <%=s_JLQK_GJA%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：省市级：</td>
      <td width="79%" class="main"> 
           <%=s_JLQK_SS%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：院校级：</td>
      <td width="79%" class="main"> 
            <%=s_JLQK_YX%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">获奖情况：其他：</td>
      <td width="79%" class="main"> 
             <%=s_JLQK_QT%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：主要著作：</td>
      <td width="79%" class="main"> 
            <%=s_ZYLZ%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">主要论著：论文发表：</td>
      <td width="79%" class="main"> 
           <%=s_LWFB%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">病例备忘：</td>
      <td width="79%" class="main"> 
         <%=s_BLBW%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">重要报道：</td>
      <td width="79%" class="main"> 
          <%=s_ZYBD%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">社会荣誉：</td>
      <td width="79%" class="main"> 
        <%=s_shry%>
      </td>
    </tr>
	 	 	
	  	
	 
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资讯来源：</td>
      <td width="79%" class="main"> 
        <%=s_zxly%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">资料来源：</td>
      <td width="79%" class="main"> 
        <%=s_zlly%>
        
          </td>
    </tr>
   
	
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <%=s_info_find%>
      </td>
    </tr>
   
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">头像图片：</td>
      <td width="79%" class="main"> 
		 <img src=/pic/<%=s_zp%><font color=red>输入名次就可以了，FTP上传，制作小的图片400X600的，可以为空</font>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <%=s_qg_pm%>
       </td>
    </tr>
	 
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <%=s_bj_qg_pm%>
       </td>
    </tr>
	 
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <%=s_jci_qg_pm%>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <a href="default.asp">返回主页</a>
        </div>
      </td>
  </table>
</form>
</body>
</html>
