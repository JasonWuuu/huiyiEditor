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
<title>医院增加</title>
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
  
  var tURL= "hosptial_add.asp?sf="+document.un.sf.options[document.un.sf.selectedIndex].value;
 // var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL1 = "&hs_name="+document.un.hs_name.value;
  var tURL2 = "&alice_name="+document.un.alice_name.value;
  var tURL3 = "&hs_desc="+document.un.hs_desc.value;
  var tURL4 = "&scjb="+document.un.scjb.value;
  document.location=tURL+tURL1+tURL2+tURL3+tURL4;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
    
   
    if( document.un.hs_name.value.length <1) {
      alert("医院名称必须填写");
      document.un.hs_name.focus();
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
<form method="POST" action="hosptial_save.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地区：</td>
      <td width="79%" class="main"> 
        <select name="sf"   onChange="GoToURL()">
		  	<option value="" >省份</option>
		  <%
		  SQL = "SELECT DISTINCT ID,M_STATE FROM D_STATE ORDER BY ID"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						IF REQUEST("SF") = RS("M_STATE") THEN
						%>
						<option value="<%=rs("m_state")%>" selected><%=rs("m_state")%></option>
						<%
						ELSE
						
					%>
						<option value="<%=rs("m_state")%>" ><%=rs("m_state")%></option>
					<%
					END IF
					RS.MoveNext
					LOOP
				RS.CLOSE 
		  %>
			
   
		  </select>
		  
		  <select name="cs" >
		
		  <%
		  SQL = "SELECT * FROM D_STATE where M_STATE = '" & REQUEST("SF") & "'"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						%>
						<option value="<%=rs("m_CITY")%>" ><%=rs("m_CITY")%></option>
					<%
					RS.MoveNext
					LOOP
				RS.CLOSE 
		  %>
			
   
		  </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院名称：</td>
      <td width="79%" class="main">
        <input type="text" name="hs_name" size="50" value="<%=Request("hs_name")%>">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院别名：</td>
      <td width="79%" class="main">
       
        <textarea name="alice_name" rows="3" cols="60"><%=Request("alice_name")%></textarea>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院照片：</td>
      <td width="79%" class="main"> 
        <input type="text" name="img" size="30" value="">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院简介：</td>
      <td width="79%" class="main"> 
        <textarea name="hs_desc" rows="10" cols="60"><%=Request("hs_desc")%></textarea>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">擅长的疾病：</td>
      <td width="79%" class="main"> 
        <textarea name="scjb" rows="10" cols="60"><%=Request("scjb")%></textarea>
      </td>
    </tr>
	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院所属高校：</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_fs" size="30">
     
       
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院等级：</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_dj" size="30" value="三级甲等">
     
       
      </td>
    </tr>
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">经营性质：</td>
      <td width="79%" class="main"> 
        <input type="text" name="PROPERTY" size="30">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">是否部队：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="SF_TROOPS" value="是">
        是 
        <input type="radio" name="SF_TROOPS" value="否" checked>
        否 
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">综合/专科：</td>
      <td width="79%" class="main"> 
        <input type="radio" name="ZHMODE" value="综合">
        综合 
        <input type="radio" name="ZHMODE" value="专科" checked>
        专科 
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医种：</td>
      <td width="79%" class="main"> 
     
       <select name="TYPE" >
  <option value="西医" > 西医</option>
        <option value="中医" > 中医</option>
		   
			 <option value="中西医结合" >中西医结合</option>
		  </select>
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">医院网站地址：</td>
      <td width="79%" class="main"> 
        <input type="text" name="url" size="30">
     
       
      </td>
    </tr>

	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">电话：</td>
      <td width="79%" class="main"> 
        <input type="text" name="TEL" size="30">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">挂号链接：</td>
      <td width="79%" class="main"> 
        <input type="text" name="SEND_URL" size="50">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">地址：</td>
      <td width="79%" class="main"> 
        <input type="text" name="address" size="50">
     
       
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
      <td width="21%" class="main">全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="6" value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">北大全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="6" value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI全国排名：</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="6" value="100000">
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
