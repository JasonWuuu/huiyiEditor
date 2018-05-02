<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 


	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM SHANGFANG WHERE ID =" & REQUEST("ID") & "" 
						RS.Open SQL,CONN,1,1
							IF RS.RecordCount >0 THEN
	  				
%>
<html>
<head>
<title>来访人员登记表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-family: "宋体"; font-size: 9pt; line-height: 21pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="980" border="0" cellspacing="0" cellpadding="5" class="main">
  <tr>
    <td class="wz">
      <div align="center"><b>来访人员登记表</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="900" align="left">
<form id="form1" name="un" method="post" action="save.asp">
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="907">
    <tr> 
      <td width="92"> 
        <div align="right">科室</div>
      </td>
      <td width="137"><%=RS("KS")%> </td>
      <td width="80"> 
        <div align="right">顺序号</div>
      </td>
      <td width="118"><%=NO%> </td>
      <td width="123"> 
        <div align="right">日期</div>
      </td>
      <td colspan="3"><%=Date%> <%=time()%></td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">代表姓名</div>
      </td>
      <td width="137"><%=RS("DBXM")%> </td>
      <td width="80"> 
        <div align="right">性别</div>
      </td>
      <td width="118"> <%=RS("SEX")%></td>
      <td width="123"> 
        <div align="right">联系电话</div>
      </td>
      <td colspan="3"><%=RS("LXDH")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">身份证号码</div>
      </td>
      <td width="137"><%=RS("SFZ")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">住址</div>
      </td>
      <td colspan="5"><%=RS("ZZ")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">来访人姓名</div>
      </td>
      <td colspan="3"><%=RS("LFXM")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">人数</div>
      </td>
      <td colspan="3"><%=RS("LFRS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">本年到市访问次数</div>
      </td>
      <td width="137"><%=RS("DSCS")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">到齐市</div>
      </td>
      <td width="118"><%=RS("QSCS")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">到省</div>
      </td>
      <td width="75"><%=RS("DHCS")%>&nbsp; </td>
      <td width="69"> 
        <div align="right">到京</div>
      </td>
      <td width="163"><%=RS("DJCS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td rowspan="2" width="92"> 
        <div align="right">反映问题</div>
      </td>
      <td width="137"> 
        <div align="right">初访时间</div>
      </td>
      <td width="80"> 
        <div align="left"> <%=RS("CFSJ")%></div>
      </td>
      <td width="118"> 
        <div align="right">责任单位</div>
      </td>
      <td width="123"><%=RS("ZRDW")%>&nbsp; </td>
      <td width="75"> 
        <div align="right">首办责任人</div>
      </td>
      <td colspan="2"><%=RS("SBZRR")%>&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="7"><%=RS("FYWT")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（一）</div>
      </td>
      <td colspan="7"><%=RS("CLQKA")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（二）</div>
      </td>
      <td colspan="7"><%=RS("CLQKB")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（三）</div>
      </td>
      <td colspan="7"><%=RS("CLQKC")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">本次处理状态</div>
      </td>
      <td colspan="3"><%=RS("CLZT")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">操作人</div>
      </td>
      <td colspan="3"><%=Request.Cookies("user_name")%></td>
    </tr>
   
  </table>
  <hr width="900" size="1" align="left">
</form>
<%
END IF

%>
</body>
</html>
