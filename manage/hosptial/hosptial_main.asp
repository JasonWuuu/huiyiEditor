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
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("jibing_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>疾病查询</title>
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

<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）疾病内容查询 </font></div>
<hr size="1">
<form method="POST" action="hosptial_search.asp" name="un">
  <table width="940" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main">查询说明：</td>
      <td colspan="3" class="main">如果不选择条件，系统默认全部符合</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">擅长疾病：</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="scjb" size="30">
      </td>
    
      <td width="14%" class="main"> 
        <div align="right">医院名称：</div>
      </td>
      <td width="34%" class="main">
        <input type="text" name="hs_name" size="30">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">查找字符串：</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="info_find" size="20">
      </td>
       <td width="17%" class="main"> 
        <div align="right">医院简介：</div>
      </td>
      <td width="35%" class="main"> 
       <input type="text" name="hs_desc" size="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">相关字符：</div>
      </td>
      <td width="34%" class="main">   
        <input type="text" name="info_corre" size="50">
		  </td>
    
      <td width="17%" class="main"> 
        <div align="right">URL：</div>
      </td>
      <td colspan="3" class="main"> 
        <input type="text" name="url" size="50">
      </td>
    </tr>
   
	 <tr bgcolor="#FFFFFF"> 
      <td width="17%" class="main"> 
        <div align="right">全国排名(>=)：</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="qg_pm1" size="20">
      </td>
       <td width="17%" class="main"> 
        <div align="right">全国排名(<)：</div>
      </td>
      <td width="35%" class="main"> 
        <input type="text" name="qg_pm2" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">输入人员：</div>
      </td>
      <td width="34%" class="main">   
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
    
      <td width="17%" class="main"> 
        <div align="right">医种：</div>
      </td>
      <td colspan="3" class="main"> 
         <select name="TYPE" >
			<option value="" >全部</option>
  <option value="西医" > 西医</option>
        <option value="中医" > 中医</option>
		   
			 <option value="中西医结合" >中西医结合</option>
		  </select>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     
      <td width="14%" class="main"> 
        <div align="right">是否有图片：</div>
      </td>
      <td width="34%" class="main">   
       <select name="img" >
		 <option value="">全部</option>
       <option value="是" >是</option>  
		 <option value="否" >否</option>  
        </select>
		  </td>
    
      <td width="17%" class="main"> 
        <div align="right">医种：</div>
      </td>
      <td colspan="3" class="main"> 
        无
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
