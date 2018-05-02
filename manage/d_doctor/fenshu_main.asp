<!-- #include virtual = "/include/wsql.asp" -->
 <!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->

 <%
 
'作者：马洪岩  于 2002-4-21 编写
'功能：文章的查询条件
'操作：本脚本任何人操作

	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>医生查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）医生内容查询 </font></div>
<hr size="1">
<form method="POST" action="fenshu_search.asp" name="un">
  <table width="1140" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main">查询说明：</td>
      <td colspan="3" class="main">如果不选择条件，系统默认全部符合</td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
     
      
    <td width="12%" class="main"> 
      <div align="right">分数>=：</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="num1" size="20">
		  </td>
     
    <td width="11%" class="main"> 
      <div align="right">分数<：</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="num2" size="20">
      </td>
     
    </tr>
   
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">输入人员：</div>
      </td>
      
    <td width="51%" class="main"> 
      <select name="username" >
		 <option value="">全部</option>
           <%
        SQL = "SELECT * FROM PERSON"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("user_name")%>" >
		 
		  <%=RS1("user_name")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		  </td>
    
       
    <td width="11%" class="main"> 
      <div align="right">医生类别：</div>
      </td>
      
    <td width="26%" class="main"> 
      <select name="ysclass" >
		  <option value="" selected>全部</option>
        <option value="首席大医生" > 首席大医生</option>
		   <option value="大医生" > 大医生</option>
			 <option value="研究学者" >研究学者</option>
		  </select>
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="submit" name="search" value="进行查询" >
          <input type="reset" name="Submit2" value="重填信息">
          <input type="submit" name="home" value="返回主页">
        </div>
      </td>
  </table>
</form>
</body>
</html>
