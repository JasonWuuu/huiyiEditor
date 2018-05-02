<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 
'作者：马洪岩  于 2002-4-21 编写
'功能：文章的确认
'操作：本脚本由部门经理以上操作

 '判断级别
 	set CONN = Server.CreateObject("ADODB.Connection")
	CONN.open CONNSTR,"",""  
    set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	'判断权限

	%>


<%

'去掉字符串头尾的连续的回车和空格 
function trimVBcrlf(str) 
trimVBcrlf=rtrimVBcrlf(ltrimVBcrlf(str)) 
end function 

'去掉字符串开头的连续的回车和空格 
function ltrimVBcrlf(str) 
dim pos,isBlankChar 
pos=1 
isBlankChar=true 
while isBlankChar 
if mid(str,pos,1)=" " then 
pos=pos+1 
elseif mid(str,pos,2)=VBcrlf then 
pos=pos+2 
else 
isBlankChar=false 
end if 
wend 
ltrimVBcrlf=right(str,len(str)-pos+1) 
end function 

'去掉字符串末尾的连续的回车和空格 
function rtrimVBcrlf(str) 
dim pos,isBlankChar 
pos=len(str) 
isBlankChar=true 
while isBlankChar and pos>=2 
if mid(str,pos,1)=" " then 
pos=pos-1 
elseif mid(str,pos-1,2)=VBcrlf then 
pos=pos-2 
else 
isBlankChar=false 
end if 
wend 
rtrimVBcrlf=rtrim(left(str,pos)) 
end function 
      
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
	Response.Redirect ("article_main.asp")
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

sql = "select top 1 * from a_article_ls where info_no = '" & request("info_no") & "'"
rs9.Open sql,conn,1,1
	if rs9.RecordCount>0 then
    
		 s_class_no = rs9("class_no")
		 s_info_title =  rs9("info_title")
		 s_info_desc = rs9("info_desc")
		 s_if_html =  rs9("if_html")
		 s_info_find =  rs9("info_find")
		' s_info_corre =  request("info_corre")
		 s_info_corre =  rs9("class_no")
		 s_info_source =  rs9("info_source")
		 s_info_file =  rs9("info_file")
		 s_class_corre = rs9("class_corre")
		 s_if_bw = rs9("if_bw")
		 s_sp_url = rs9("sp_url")
		 s_sp_url_out = rs9("sp_url_out")
		 s_zhuanti= rs9("zhuanti")
		 s_if_tj = rs9("if_tj")
		 s_sub_title = rs9("sub_title")
		' s_info_corre = request("info_corre")
s_color_l =  ""
s_color_r = ""
			s_colorxz = rs9("color_l")
			if s_colorxz <>"" Then
			s_color_l = "<font color=red>"
			s_color_r = "</font>"
			
			else
		
			end if
		
			if s_sp_url <> "" then
			pop = 0
			pop = instr(s_sp_url,"http")
			if pop <=0 then
			response.Write("视频URL非法")
			response.end 
			end if
			end if
			
			if s_sp_url_out <> "" then
			pop = 0
			pop = instr(s_sp_url_out,"http")
			if pop <=0 then
			response.Write("视频URL非法")
			response.end 
			end if
			end if
			
				 MHY_S = ""
	 EE = split(s_info_desc,chr(13))
		For EI = 0 To UBound(EE)
		
				if len(EE(EI)) >1 THEN
				
				ss_info_desc=trimVBcrlf(EE(EI))
				
				MHY_S = MHY_S & ss_info_desc &  chr(13)
				
				end if
		next
		

		s_info_desc= MHY_S



end if
rs9.close 

				
					SQL = "SELECT TOP 1 * FROM A_ARTICLE WHERE INFO_TITLE = '" & s_info_title & "'"
				RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
					IF RS1.RecordCount >0 THEN
					Response.Write "记录增加重复，请查看是否已经有相同类别，和相同标题的文章，谢谢配合"
					Response.End 
					END IF
				RS1.Close 
				if s_info_corre = "" then
				s_info_corre = "无"
				end if
			
			if s_zhuanti = "" then
				s_zhunati = "无"
				end if
		'			WB_FILE_NO = "A" & ID_NAME("INFO_NO")
					
				MM = MONTH(DATE)
				IF MM <10 THEN
				MM = "0" & MM
				ELSE
				MM = MONTH(DATE)
				END IF
'处理文章的标题

IF S_SP_URL_OUT <> "" THEN
		SQL1 = "SELECT TOP 1 * FROM A_CLASS WHERE CLASS_NO='" & S_CLASS_NO & "'"
		RS1.Open SQL1,CONN,1,1
			IF RS1.RecordCount>0 THEN
				S_INFO_TITLE = "《" & RS1("CLASS_NAME") & "》" & S_INFO_TITLE
	
			END IF
			RS1.CLOSE 
END IF
				
					'处理字符
					XTH="<p style='text-indent: 2em; text-align: justify; line-height: 1.5em; margin-bottom: 15px; margin-top: 15px;'>    <span style='color: rgb(0, 0, 0); font-family: 微软雅黑, 'Microsoft YaHei';'>"
					XTHJW = "</span></p>"
					QTP="<center><img src='http://img.dakayi.cc/pic/" & year(date) & MM & "/"
					HTP="' width='100%'/></center>"
					'增加记录
					 s_info_desc=replace(s_info_desc,"#TPT#",QTP)
					 s_info_desc=replace(s_info_desc,"#TPW#",HTP)
					  s_info_desc=replace(s_info_desc,"#BTT#","<b>")
					 s_info_desc=replace(s_info_desc,"#BTW#","</b>")
					 s_info_desc=replace(s_info_desc,"#SPT#","<a href='")
					 s_info_desc=replace(s_info_desc,"#SPW#","'>点击前往观看视频</a>")
					 s_info_desc=replace(s_info_desc,chr(13),XTHJW & XTH)
					 s_info_desc = XTH & s_info_desc & XTHJW
	  				SQL = "SELECT top 1 * FROM A_ARTICLE"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("CLASS_NO") = s_class_no
	  				RS1("info_title") = s_info_title
	  				RS1("info_desc") = s_info_desc
	  				RS1("info_find") = "NO"
	  				'RS1("INFO_FILE") = s_info_file
					  RS1("INFO_FILE") = s_info_file
						RS1("SP_URL") = s_sp_url
						RS1("SP_URL_OUT") = s_sp_url_out
	  				'RS1("info_corre") = s_info_corre
	  				RS1("INFO_NO") = Request("info_no")
	  				RS1("info_source") = s_info_source
						RS1("COLOR_L") = s_color_l
						RS1("COLOR_R") = s_color_r
	  				RS1("IF_HTML") = s_if_html
						RS1("CLASS_CORRE") = s_class_corre
						RS1("USER_NAME") = Request.Cookies("user_name")
						RS1("IF_BW") = s_if_bw
						RS1("ZHUANTI") = s_zhuanti
						RS1("IF_TJ") = s_if_tj
						RS1("SUB_TITLE") = s_sub_title
						RS1("INFO_CORRE") = s_info_corre
						RS1("RE_DATE") = DATE()  & " " & TIME
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  				'处理相关信息
					
					SQL = "DELETE FROM D_CORRE WHERE INFO_NO = '" & WB_FILE_NO & "'"
					CONN.Execute(SQL)
					SQL = "SELECT TOP 5 INFO_NO,INFO_TITLE,INFO_FILE,RE_DATE FROM A_ARTICLE WHERE INFO_NO <> '" & Request("info_no") & "' AND INFO_CORRE LIKE '%" & s_info_corre & "%'"
					RS.Open SQL,CONN,1,1
						DO WHILE NOT RS.EOF 
								SQL = "SELECT top 1 * FROM D_CORRE"
								RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
								RS1.AddNew 
								RS1("INFO_NO") = WB_FILE_NO
								RS1("XG_NO") = RS("INFO_NO")
								RS1("XG_TITLE") = RS("INFO_TITLE")
								RS1("XG_IMG") = RS("INFO_FILE")
								RS1("RE_DATE") = RS("RE_DATE")
								RS1.UpdateBatch 
							RS1.Close 
						RS.MoveNext
						LOOP
					RS.CLOSE 
					
			MYDESC = s_info_title & s_info_desc
					XGNR = ""
    SQL = "SELECT NO,XM,CLASS_NO,HS_NO FROM D_DOCTOR ORDER BY NO "
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF 
				POP = 0
					POP = INSTR(MYDESC,RS("XM"))
						IF POP >0 THEN
						XGNR = XGNR & RS("NO") & "-"
							POP1 = 0
							POP1 = INSTR(XGNR,RS("CLASS_NO"))
							IF POP1 >0 THEN
								ELSE
								XGNR = XGNR & RS("CLASS_NO") & "-"
							END IF
							POP1 = 0
							POP1 = INSTR(XGNR,RS("HS_NO"))
							IF POP1 >0 THEN
								ELSE
								XGNR = XGNR & RS("HS_NO") & "-"
							END IF
						END IF
				
				RS.MoveNext
				LOOP
			RS.CLOSE 
		
		SQL = "SELECT JB_NO,JB_NAME FROM JIBING ORDER BY JB_NO"
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF 
					POP = 0
					'POP = INSTR(MYDESC,RS("JB_NAME"))
					POP = INSTR(S_INFO_TITLE,RS("JB_NAME"))
						IF POP  >0 THEN
							POP1 = 0
							POP1 = INSTR(XGNR,RS("JB_NO"))
								IF POP1>0 THEN
								ELSE
								XGNR = XGNR & RS("JB_NO") & "-"
								END IF
						END IF
				RS.MoveNext
				LOOP
			RS.CLOSE 
			
					
			SQL = "SELECT HS_NO,HS_NAME,ALICE_NAME FROM HOSPTIAL ORDER BY HS_NO"
			RS.Open SQL,CONN,1,1
				DO WHILE NOT RS.EOF 
			
					POP = 0
					POP = INSTR(MYDESC,RS("HS_NAME"))
						IF POP  >0 THEN
						
							POP1 = 0
							POP1 = INSTR(XGNR,RS("HS_NO"))
								IF POP1>0 THEN
								ELSE
								XGNR = XGNR & RS("HS_NO") & "-"
								END IF
						END IF
					A = Split(RS("ALICE_NAME"), "、")
					
							FOR I = 0 TO UBOUND(A)
								IF A(I) <> "无" THEN
									POP = 0
									POP = INSTR(MYDESC,A(I))
									IF POP  >0 THEN
										response.Write A(I) & "<p></p>"
									POP1 = 0
									POP1 = INSTR(XGNR,RS("HS_NO"))
										IF POP1>0 THEN
										ELSE
										XGNR = XGNR & RS("HS_NO") & "-"
										END IF
								   END IF
								END IF
							NEXT
				
				RS.MoveNext
				LOOP
			RS.CLOSE 
			
			
		SQL = "UPDATE A_ARTICLE SET XGNR = '" & XGNR & "' WHERE INFO_NO = '" & Request("info_no") & "'"
		CONN.Execute(SQL)
	SQL = "UPDATE A_ARTICLE_LS SET STATUS = '已' WHERE INFO_NO = '" & Request("info_no") & "'"
		CONN.Execute(SQL)
	SQL = "DELETE FROM A_ARTICLE_LS WHERE INFO_NO = '" & Request("info_no") & "'"
		CONN.Execute(SQL)


		
%>	
<html>
<head>
<title>内容与文章审核结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统审核结果</font></p>
</div>
<hr size="0" width="600">
<form method="POST" action="article_confim_up.asp" name="un" >
  <table width="400" border="1" align="center" bordercolor="#000000" bordercolorlight="#FFFFFF" cellspacing="0" cellpadding="0" class="main">
    <tr> 
      <td colspan="2"><font color="#0000FF">审核记录，请确信您已经仔细的阅读了该篇文章</font></td>
    </tr>
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td width="98">目前状态：</td>
      <td width="296">
      <%=request("status")
      %></td>
    </tr>
   
    <tr> 
      <td width="98">&nbsp;</td>
      <td width="296">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="2">
        <div align="center">
          <input type="button" name="Button" value="关闭窗口" onclick=self.close();>
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
