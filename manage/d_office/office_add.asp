<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

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
<title>医院科室增加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

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
    
   
    if( document.un.xm.value.length <1) {
      alert("姓名必须填写");
      document.un.xm.focus();
      return false;
   }


	if( document.un.info_find.value.length <1) {
      alert("查找字符一定要有，查询什么能查到该文章");
      document.un.info_find.focus();
      return false;
   }
  
	
	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章系统增加 </font></div>
<hr>
<form method="POST" action="office_save.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室：</td>
      <td width="79%" class="main"> 
        <select name="class_no" >
           <%
        SQL = "SELECT * FROM D_CLASS ORDER BY CLASS_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("CLASS_NO")%>" >
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=RS1("CLASS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院：</td>
      <td width="79%" class="main"><small><font face="Verdana"> 
       <select name="hs_no" >
           <%
        SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("HS_NO")%>" >
	
		  <%=RS1("HS_NAME")%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        </font></small>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">科室简介：</td>
      <td width="79%" class="main"> 
        <textarea name="class_desc" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否是HTML方式：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="是">
        是 
        <input type="radio" name="if_html" value="否" checked>
        否 </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">查找字符串：</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main"><font color=red>相关查询字符：</font></td>
      <td width="79%" class="main">       <%
				SQL1 = "SELECT * FROM A_CORRE ORDER BY CLASS_NO"
				RS1.Open SQL1,CONN,adOpenKeyset ,adLockReadOnly
					DO WHILE NOT RS1.EOF 
						FOR I = 1 TO RS1("JIBIE")
							Response.Write("---")
						NEXT
            %>
			  <input type="checkbox" name="info_corre" value="<%=RS1("corre_name")%>"  ID="Checkbox15"><%=RS1("corre_name")%>
			  <br>
              <%
					RS1.MoveNext 
					LOOP
					RS1.Close 
              %> 
        <span class="main"> （ 如果没有，请到相关字符处增加）</span></td>
    </tr>
    
	  
<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">本地排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bd_pm" size="46">
       </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46">
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
