<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
 
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM SHANGFANG WHERE ID =" & REQUEST("ID") & " AND  PERSON = '" & Request.Cookies("user_name") & "'"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
						NO = RS1("SXH")
	  					RS1("KS") = Request("KS")
	  			'	RS1("SXH") = NO
	  				RS1("DBXM") = Request("DBXM")
	  				'RS1("SEX") = Request("SEX")
						SEX = RS1("SEX")
	  				RS1("LXDH") = Request("LXDH")
	  				RS1("SFZ") = Request("SFZ")
	  				RS1("ZZ") = Request("ZZ")
	  				RS1("LFXM") = Request("LFXM")
						RS1("LFRS") = Request("LFRS")
						RS1("DSCS") = Request("DSCS")
	  				RS1("QSCS") = Request("QSCS")
						RS1("DHCS") = Request("DHCS")
						RS1("DJCS") = Request("DJCS")
						RS1("CFSJ") = Request("CFSJ")
						RS1("ZRDW") = Request("ZRDW")
						RS1("SBZRR") = Request("SBZRR")
						RS1("FYWT") = Request("FYWT")
						RS1("CLQKA") = Request("CLQKA")
						RS1("CLQKB") = Request("CLQKB")
						RS1("CLQKC") = Request("CLQKC")
						RS1("CLZT") = Request("CLZT")
						RS1.UpdateBatch 
	  				RS1.Close 
	  				
					
					
					'增加记录
	  		
	  				SQL = "SELECT top 1 * FROM SHANGFANG_DESC"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
	  				RS1("KS") = Request("KS")
	  				RS1("SXH") = NO
	  				RS1("DBXM") = Request("DBXM")
	  				RS1("SEX") = SEX
	  				RS1("LXDH") = Request("LXDH")
	  				RS1("SFZ") = Request("SFZ")
	  				RS1("ZZ") = Request("ZZ")
	  				RS1("LFXM") = Request("LFXM")
						RS1("LFRS") = Request("LFRS")
						RS1("DSCS") = Request("DSCS")
	  				RS1("QSCS") = Request("QSCS")
						RS1("DHCS") = Request("DHCS")
						RS1("DJCS") = Request("DJCS")
						RS1("CFSJ") = Request("CFSJ")
						RS1("ZRDW") = Request("ZRDW")
						RS1("SBZRR") = Request("SBZRR")
						RS1("FYWT") = Request("FYWT")
						RS1("CLQKA") = Request("CLQKA")
						RS1("CLQKB") = Request("CLQKB")
						RS1("CLQKC") = Request("CLQKC")
						RS1("CLZT") = Request("CLZT")
						RS1("PERSON") = Request.Cookies("user_name")
						
	  				RS1.UpdateBatch 
	  				RS1.Close 
					
					
					
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
      <td width="137"><%=Request("KS")%> </td>
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
      <td width="137"><%=Request("DBXM")%> </td>
      <td width="80"> 
        <div align="right">性别</div>
      </td>
      <td width="118"> <%=Request("SEX")%></td>
      <td width="123"> 
        <div align="right">联系电话</div>
      </td>
      <td colspan="3"><%=Request("LXDH")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">身份证号码</div>
      </td>
      <td width="137"><%=Request("SFZ")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">住址</div>
      </td>
      <td colspan="5"><%=Request("ZZ")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">来访人姓名</div>
      </td>
      <td colspan="3"><%=Request("LFXM")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">人数</div>
      </td>
      <td colspan="3"><%=Request("LFRS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">本年到市访问次数</div>
      </td>
      <td width="137"><%=Request("DSCS")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">到齐市</div>
      </td>
      <td width="118"><%=Request("QSCS")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">到省</div>
      </td>
      <td width="75"><%=Request("DHCS")%>&nbsp; </td>
      <td width="69"> 
        <div align="right">到京</div>
      </td>
      <td width="163"><%=Request("DJCS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td rowspan="2" width="92"> 
        <div align="right">反映问题</div>
      </td>
      <td width="137"> 
        <div align="right">初访时间</div>
      </td>
      <td width="80"> 
        <div align="left"> <%=Request("CFSJ")%></div>
      </td>
      <td width="118"> 
        <div align="right">责任单位</div>
      </td>
      <td width="123"><%=Request("ZRDW")%>&nbsp; </td>
      <td width="75"> 
        <div align="right">首办责任人</div>
      </td>
      <td colspan="2"><%=Request("SBZRR")%>&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="7"><%=Request("FYWT")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（一）</div>
      </td>
      <td colspan="7"><%=Request("CLQKA")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（二）</div>
      </td>
      <td colspan="7"><%=Request("CLQKB")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">处理情况（三）</div>
      </td>
      <td colspan="7"><%=Request("CLQKC")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">本次处理状态</div>
      </td>
      <td colspan="3"><%=Request("CLZT")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">操作人</div>
      </td>
      <td colspan="3"><%=Request.Cookies("user_name")%></td>
    </tr>
    <tr> 
      <td width="92"> 
        <input type="button" name="add" value="关闭窗口" onclick=self.close();> 
      </td>
      <td colspan="3"> 
       &nbsp;
      </td>
      <td width="123">
      <td colspan="3">&nbsp;</td>
    </tr>
  </table>
  <hr width="900" size="1" align="left">
</form>

</body>
</html>
