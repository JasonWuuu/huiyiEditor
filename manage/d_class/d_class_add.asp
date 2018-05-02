<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->

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
	
	%> 
<html>
<head>
<title>科室类别增加</title>
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
  
  var tURL= "d_class_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
 
  document.location=tURL;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "d_class_add.asp?yy="+document.un.yy.value;
 // var tURL2 = "&no="+document.un.no.value;
  document.location=tURL1;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
   
    if( document.un.class_name.value.length <1) {
      alert("标题必须填写");
      document.un.class_name.focus();
      return false;
   }

	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="d_class_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
       <select name="hs_no"  onChange="GoToURL()">
           <%
         if request("yy") <> "" then
			   SQL = "SELECT * FROM HOSPTIAL WHERE HS_NAME LIKE '%" & Request("yy") & "%' or alice_name like '%" & Request("yy") & "%' ORDER BY HS_NAME"
			  else
			   SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
			  end if
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
					IF Request("HS_NO") = RS1("HS_NO") THEN
					%>
					  <option value="<%=RS1("HS_NO")%>" selected><%=RS1("HS_NAME")%></option>
					<%
					ELSE
					
        %>
        <option value="<%=RS1("HS_NO")%>" ><%=RS1("HS_NAME")%></option>
        <%
				END IF
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        </font></small>
		   <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="查询" onClick=GoToURLA();>
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">上级类别：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
          <option value="000">一级类别</option>
          <%
        SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & Request("HS_NO") & "' ORDER BY CLASS_NO"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
		   
        <option value="<%=RS1("CLASS_NO")%>" ><%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("--")
		  NEXT
		  %><%=RS1("CLASS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">名称：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
        <input type="TEXT" name="class_name" value="" size="80"><br>（只输入科室名次，系统自动加上医院名）
        </font></small></td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室简介：</td>
      <td width="79%" class="main"> 
        <textarea name="class_desc" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">显示顺序：</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="10" value="0"> 
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46" value="100000">
       </td>
    </tr>
	 
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46" value="100000">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46" value="100000">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室挂号连接URL：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="url" size="46" value="http://">
       </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">对应复旦科室：</td>
      <td width="79%" class="main"> 
        <select name="fd_no" >
           <%
        SQL = "SELECT * FROM FD_CLASS ORDER BY FD_NO DESC"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
		   
        <option value="<%=RS1("FD_NO")%>" ><%
		
		  %><%=RS1("FD_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
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
