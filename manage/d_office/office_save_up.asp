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
		 s_hs_no = request("hs_no")
		 s_class_desc = request("class_desc")
	 s_info_find =  request("info_find")
		 s_info_corre =  request("info_corre")
		 s_bd_pm = request("bd_pm")
		 s_qg_pm = request("qg_pm")
		
		
					SQL = "SELECT TOP 1 * FROM D_office WHERE  hs_no = '" & s_hs_no & "' and class_no = '" & s_class_no & "' and office_no <>'" & request("office_no") & "'"
				RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS.RecordCount >0 THEN
					Response.Write "记录增加重复，医院，科室一样"
					Response.End 
					END IF
				RS.Close 
				
			
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM D_OFFICE WHERE OFFICE_NO = '" & REQUEST("OFFICE_NO") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("hs_no") = s_hs_no
						RS1("class_desc") = s_class_desc
						RS1("info_find") = s_info_find
	  				RS1("info_corre") = s_info_corre
	  			  RS1("BD_PM") = s_bd_pm
						RS1("QG_PM") = s_qg_pm
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				
%>
<html>
<head>
<title>医院科室修改成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）医院科室系统修改 </font></div>
<hr>
<form method="POST" action="office_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">类别：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",s_class_no,"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <%=DISPLAY_NAME("HOSPTIAL",s_hs_no,"HS_NO","HS_NAME")
        %> 
        </font></small>
          </td>
    </tr>
	
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室简介：</td>
      <td width="79%" class="main"> 
       <%
		IF s_if_html = "是" THEN
		Response.Write s_class_desc
		ELSE
		%>&nbsp;&nbsp;&nbsp;&nbsp;
        <%body = replace(s_class_desc,chr(10),"<br>&nbsp;&nbsp;&nbsp;&nbsp;")%>
        <%=body%>&nbsp; 
        <%
        END IF
        %>
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
      <td width="21%" class="main">本地排名：</td>
      <td width="79%" class="main"> 
		 <%=s_bd_pm%>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		<%=s_qg_pm%>
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
