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
	set RS9 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		s_hs_name =  request("hs_name")
		s_alice_name =  request("alice_name")
		 s_hs_desc = request("hs_desc")
		 s_scjb = request("scjb")
		 s_if_html =  request("if_html")
		 s_info_find =  request("info_find")
		 s_info_corre =  request("info_corre")
		 s_url= request("url")
		 s_bd_pm = request("bd_pm")
		 s_qg_pm = request("qg_pm")
		 s_area = request("area")
		 s_yy_fs = request("yy_fs")
		 s_yy_dj = request("yy_dj")
		  s_PROPERTY = request("PROPERTY")
		 s_SF_TROOPS = request("SF_TROOPS")
		 s_ZHMODE = request("ZHMODE")
		 s_TYPE = request("TYPE")
		 s_TEL = request("TEL")
		 s_SEND_URL = request("SEND_URL")
		 s_address = Request("address")
		 s_bj_bd_pm = request("bj_bd_pm")
		 s_bj_qg_pm = request("bj_qg_pm")
		 s_jci_bd_pm = request("jci_bd_pm")
		 s_jci_qg_pm = request("jci_qg_pm")
		 s_img = request("img")

		 
					SQL = "SELECT TOP 1 * FROM HOSPTIAL WHERE HS_NAME = '" & s_hs_name & "' and  hs_no <>'" & request("hs_no") & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "记录增加重复，医院名称一样"
					Response.End 
					END IF
				RS.Close 
				
			
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM HOSPTIAL WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  				RS1("scjb") = s_scjb
	  				RS1("hs_name") = s_hs_name
						RS1("alice_name") = s_alice_name
	  				RS1("hs_desc") = s_hs_desc
						RS1("url") = s_url
						RS1("info_find") = s_info_find
	  				'RS1("info_corre") = s_info_corre
						'S1("BD_PM") = s_bd_pm
						RS1("QG_PM") = s_qg_pm
						RS1("AREA") = s_area
						RS1("YY_FS") = s_yy_fs
						RS1("YY_DJ") = s_yy_dj
						RS1("PROPERTY") = S_PROPERTY
						RS1("SF_TROOPS") = S_SF_TROOPS
						RS1("ZHMODE") = S_ZHMODE
						RS1("TYPE") = S_TYPE
						RS1("TEL") = S_TEL
						RS1("SEND_URL") = S_SEND_URL
						'S1("bj_bd_pm") = s_bj_bd_pm
						RS1("bj_qg_pm") = s_bj_qg_pm
						'S1("jci_bd_pm") = s_jci_bd_pm
						RS1("jci_qg_pm") = s_jci_qg_pm
						RS1("ADDRESS") = s_address
						RS1("IMG") = s_img
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  		

			
					YY = s_hs_name
		BM = s_alice_name
		JS = s_hs_desc
		KS = ""
		SQL1 = "SELECT * FROM D_CLASS WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
			RS1.Open SQL1,CONN,1,1
				DO WHILE NOT RS1.EOF 
				KS = KS & RS1("CLASS_NAME")
				SQL2 = "SELECT JB_NAME FROM JIBING WHERE FD_NO = '" & RS1("FD_NO") & "'"
					RS2.Open SQL2,CONN,1,1
						DO WHILE NOT RS2.EOF 
						KS = KS & RS2("JB_NAME")
						RS2.MoveNext
						LOOP
					RS2.CLOSE 
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			XM = ""
			SQL1 = "SELECT * FROM D_DOCTOR WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
			RS1.Open SQL1,CONN,1,1
				DO WHILE NOT RS1.EOF 
				XM = XM & RS1("XM")
				RS1.MoveNext
				LOOP
			RS1.CLOSE 
			
					
						SQL = "SELECT top 1 * FROM HOSPTIAL  WHERE HS_NO = '" & REQUEST("HS_NO") & "'"
	  				RS9.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS9.MoveFirst
						RS9("INFO_FIND") = YY & BM & JS & KS & XM
						RS9.UpdateBatch 
	  				RS9.Close 
					
					
					'修改科室
		
					
		SQL = "UPDATE  D_CLASS SET FIND_INFO = FIND_INFO + '" & s_hs_name & s_alice_name & "' WHERE HS_NO='" & request("hs_no") & "'"
		CONN.Execute(SQL)

					SQL = "UPDATE  D_DOCTOR SET INFO_FIND = INFO_FIND + '" & s_hs_name & s_alice_name & "' WHERE HS_NO='" & request("hs_no") & "'"
					
	CONN.Execute(SQL)

					
%>
<html>
<head>
<title>医院信息修改成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）医院系统修改 </font></div>
<hr>
<form method="POST" action="doctor_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院名称：</td>
      <td width="79%" class="main">
       <%=s_hs_name%>
     
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院别名：</td>
      <td width="79%" class="main">
       <%=s_alice_name%>
     
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院简介：</td>
      <td width="79%" class="main"> 
       <%
		IF s_if_html = "是" THEN
		Response.Write s_hs_desc
		ELSE
		%>&nbsp;&nbsp;&nbsp;&nbsp;
        <%body = replace(s_hs_desc,chr(10),"<br>&nbsp;&nbsp;&nbsp;&nbsp;")%>
        <%=body%>&nbsp; 
        <%
        END IF
        %>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">看这个病的主要医院：</td>
      <td width="79%" class="main"> 
        <%
		IF s_if_html = "是" THEN
		Response.Write s_scjb
		ELSE
		%>&nbsp;&nbsp;&nbsp;&nbsp;
        <%body = replace(s_scjb,chr(10),"<br>&nbsp;&nbsp;&nbsp;&nbsp;")%>
        <%=body%>&nbsp; 
        <%
        END IF
        %>
      </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院地区：</td>
      <td width="79%" class="main"> 
        <%=s_area%>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">所属高校：</td>
      <td width="79%" class="main"> 
        <%=s_yy_fs%>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院等级：</td>
      <td width="79%" class="main"> 
        <%=s_yy_dj%>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院照片：</td>
      <td width="79%" class="main">
       <img src="http://img.dakayi.net/pic/<%=s_img%>">
        
          </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <%=s_info_find%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main"><font color=red>相关查询字符：</font></td>
      <td width="79%" class="main">
        
			  <%=s_info_corre%>
          
        <span class="main"> （ 如果没有，请到相关字符处增加）</span></td>
    </tr>
    
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">网址：</td>
      <td width="79%" class="main"> 
		 <%=s_url%>
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
      <td width="21%" class="main">经营性质：</td>
      <td width="79%" class="main"> 
       <%=S_PROPERTY%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否部队：</td>
      <td width="79%" class="main"> 
       <%=S_SF_TROOPS%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">综合/专科：</td>
      <td width="79%" class="main"> 
       <%=S_ZHMODE%>
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医种：</td>
      <td width="79%" class="main"> 
       <%=S_TYPE%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">电话：</td>
      <td width="79%" class="main"> 
       <%=S_TEL%>
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">挂号链接：</td>
      <td width="79%" class="main"> 
      <%=S_SEND_URL%>
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地址：</td>
      <td width="79%" class="main"> 
      <%=S_address%>
     
       
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
