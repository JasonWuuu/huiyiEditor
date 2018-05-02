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
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			MY_HS_NO = RS("HS_NO")
				ELSE
				Response.Write("数据库出错误！")
				Response.end 
			END IF
		
	%> 
<html>
<head>
<title>医生多点执医</title>
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
  
  var tURL= "doctor_zy.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "&no="+document.un.no.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_zy.asp?yy="+document.un.yy.value;
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
    
   
  
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>


<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统修改（*）部分算绩效考核 </font></div>
<%
SQL2 = "SELECT * FROM ZYDD WHERE NO = '" & REQUEST("NO") & "'"
RS2.Open SQL2,CONN,1,1
	
%>
<table width="1200" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#CCCCCC"> 
      
    <td width="4%"> 
      <div align="center"><font color="#0000FF">删除</font></div>
      </td>
  
      
    <td width="19%"> 
      <div align="center"><font color="#0000FF">医院</font></div>
      </td>
		
    <td width="7%"> 
      <div align="center"><font color="#0000FF">科室</font></div>
      </td>
      
    <td width="8%"> 
      <div align="center"><font color="#0000FF">姓名</font></div>
      </td>
      <td width="8%"> 
      <div align="center"><font color="#0000FF">工作时间</font></div>
      </td>
    <td width="10%"> 
      <div align="center"><font color="#0000FF">顺序</font></div>
      </td>
     
    </tr>
    <%
	
		Do While Not RS2.EOF 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      
    <td width="4%" height="34"> 
      <div align="center"> 
           <a href="doctor_zy_dele.asp?id=<%=RS2("id")%>&no=<%=rs2("no")%>">Go!</a> </div>
      </td>
      
    
    <td width="8%" height="34"> 
      <div align="center"><%=display_name("hosptial",RS2("hs_no"),"hs_no","hs_name")%></div>
      </td>
		  <td width="8%" height="34"> 
      <div align="center"><%=display_name("d_class",RS2("class_no"),"class_no","class_name")%></div>
      </td>
    <td width="10%" height="34"> 
      <div align="center"><%=display_name("d_doctor",RS2("no"),"no","xm")%></div>
      </td>
    	<td width="10%" height="34"> 
      <div align="center"><%=rs2("worktime")%></div>
      </td>
    	 
    <td width="7%" height="34"> 
      <div align="center"><%=rs2("num")%></div>
      </td>
	  
       </tr>
    <%
			RS2.MoveNext
		
			Loop
			RS2.Close 
			%> 
  </table>



<hr>
<form method="POST" action="doctor_zy_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
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
        DO WHILE NOT RS1.EOF 
					IF REQUEST("HS_NO") <> "" THEN
					%>
									<%
									IF RS1("HS_NO") = REQUEST("HS_NO") THEN
						  %>
						  <option value="<%=RS1("HS_NO")%>" selected>
								<%
								ELSE
								%>
								<option value="<%=RS1("HS_NO")%>" >
								<%
								END IF
								%>
								  <%=MID(RS1("HS_NAME"),1,50)%></option>
					<%
					ELSE
					IF RS1("HS_NO") = RS("HS_NO") THEN
        %>
        <option value="<%=RS1("HS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("HS_NO")%>" >
				<%
				END IF
				%>
		  
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
        <%
				END IF
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
         <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="查询" onClick=GoToURLA();> &nbsp;&nbsp;<a href="/manage/hosptial/hosptial_add.asp" target="_blank">增加医院</a>
          </td>
    </tr>   
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
          <%
			 IF REQUEST("HS_NO") <> "" THEN
			 SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & REQUEST("HS_NO") & "' ORDER BY CLASS_NAME"
			 ELSE
			 SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & MY_HS_NO & "'ORDER BY CLASS_NAME"
			 END IF
        
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
				
					IF RS1("CLASS_NO") = RS("CLASS_NO") THEN
        %>
        <option value="<%=RS1("CLASS_NO")%>" selected>
				<%
				ELSE
				%>
				<option value="<%=RS1("CLASS_NO")%>" >
				<%
				END IF
				%>
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=MID(RS1("CLASS_NAME"),1,50)%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>&nbsp;&nbsp;<a href="/manage/d_class/d_class_add.asp" target="_blank">增加科室</a>
      </td>
    </tr>
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">工作时间：(*)</td>
      <td width="79%" class="main"> 
        <input type="text" name="worktime" size="50" value="">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">顺序：(*)</td>
      <td width="79%" class="main"> 
          <select name="num" >
  <option value="1" selected> 1</option>
        <option value="2" > 2</option>
		   <option value="3" > 3</option>
			<option value="4" > 4</option>
			<option value="5" > 5</option>
			<option value="6" > 6</option>
			<option value="7" > 7</option>
		  </select>
        
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
