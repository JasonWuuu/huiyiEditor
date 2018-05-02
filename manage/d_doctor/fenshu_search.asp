<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询结果
'操作：本脚本任何人操作，原则上是自己删除自己的记录

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	
	%> 
<%

'查询
	IF REQUEST("NUM1") <> "" THEN
		MYA = " AND NUM >=" & REQUEST("NUM1") & " "
	
	END IF
	IF REQUEST("NUM2") <> "" THEN
		MYB = " AND NUM <" & REQUEST("NUM2") & " "
	
	END IF
	IF REQUEST("USERNAME") <> "" THEN
	MYC = " AND USER_NAME = '" & REQUEST("USERNAME") & "' "
	END IF
	IF REQUEST("YSCLASS") <> "" THEN
	MYD = " AND YSCLASS = '" & REQUEST("YSCLASS") & "' "
	END IF
	
	SQL = "SELECT  * FROM FENSHU_DESC WHERE NO <> ''  " & MYA & MYB & ""


RS1.Open SQL,CONN,adOpenKeyset ,adLockReadOnly

				
				
%>

<html>
<head>
<title>医生资料查询系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>

<p align="center" class="main">内部资料数据系统内容（每页20条记录） 

<table width="1200" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#CCCCCC"> 
      
   
      
    <td width="6%"><font color="#0000FF">科室</font></td>
      
    <td width="19%"> 
      <div align="center"><font color="#0000FF">医院</font></div>
      </td>
		
    <td width="7%"> 
      <div align="center"><font color="#0000FF">编号</font></div>
      </td>
      
    <td width="8%"> 
      <div align="center"><font color="#0000FF">姓名</font></div>
      </td>
      <td width="8%"> 
      <div align="center"><font color="#0000FF">多点执医</font></div>
      </td>
    <td width="10%"> 
      <div align="center"><font color="#0000FF">一健发送</font></div>
      </td>
      
    <td width="7%"> 
      <div align="center"><font color="#0000FF">云栖排名</font></div>
      </td>
	  
    <td width="7%"> 
      <div align="center"><font color="#0000FF">分数情况</font></div>
      </td>
		
    <td width="8%"><font color="#0000FF">提交日期</font></td>
		
    <td width="7%"><font color="#0000FF">修改日期</font></td>
		
    <td width="9%"><font color="#0000FF">最后修改人</font></td>
	 
    <td width="5%"><font color="#0000FF">历次</font></td>
    </tr>
    <%
		'判断显示的总页数
		
		Do While Not RS1.EOF 
		
		SQL1  = "SELECT TOP 1 * FROM D_DOCTOR WHERE NO = '" & RS1("NO") & "' " & MYC & MYD & ""
		RS.Open SQL1,CONN,1,1
		IF RS.RecordCount>0 THEN
    %> 
    <tr bgcolor="#FFFFFF"> 
      
   
         
    <td width="6%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("D_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "内部"
      END IF
      %> </td>
      
    <td width="19%" height="34"> 
      <div align="center"><%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")%></div>
      </td>
		 
    <td width="7%" height="34"> 
      <div align="center"> <%=RS("NO")%> </div>
      </td>
      
    <td width="8%" height="34"> 
      <div align="center"><a href="doctor_detail.asp?no=<%=RS("no")%>" target='blank'><%=RS("xm")%></a></div>
      </td>
		 
    <td width="10%" height="34"> 
      <div align="center"><a href="doctor_enter.asp?no=<%=RS("no")%>" target='blank'>一键</a></div>
      </td>
    	 <td width="10%" height="34"> 
      <div align="center"><a href="doctor_zy.asp?no=<%=RS("no")%>" target='blank'>多点</a></div>
      </td>
    	 
    <td width="7%" height="34"> 
      <div align="center"><%=rs("jci_qg_pm")%></div>
      </td>
	  	 
    <td width="7%" height="34"> 
      <div align="center"><a href="doctor_fenshu.asp?no=<%=RS("no")%>" target='blank'>Go</a></div>
      </td>
      
    <td width="8%" height="34"> 
      <div align="center"><%=RS("re_date")%></div>
      </td>
	   
    <td width="7%" height="34"> 
      <div align="center">
		<%=RS("GX_date")%>
		</div>
      </td>
	   
    <td width="9%" height="34"> 
      <div align="center">
		<%=RS("GX_USER")%>
		</div>
      </td>
		 
    <td width="5%" height="34"> 
      <div align="center">
		<a href="doctor_lici.asp?No=<%=RS("NO")%>" target="_blank">Go!</a>
		</div>
      </td>
       </tr>
    <%
	 END IF
	 RS.CLOSE 
			RS1.MoveNext
		
			Loop
			RS1.Close 
			%> 
  </table>


  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">总计：</font></div>
      </td>
      <td width="11%"><font color="#000000"><font color=red><%=PAGE%></font>页</font></td>
      <td width="11%"> 
        <div align="center">当前<font color=red><%=PageNo%></font>页</div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="主页">
          </font></div>
      </td>
     
    </tr>
  </table>
</form>
</body>
</html>

