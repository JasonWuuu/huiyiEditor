<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
    
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("add.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<html>
<head>
<title>来访人员登记表查询</title>
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
      <div align="center"><b>来访人员登记查询</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="900" align="left">
<form id="form1" name="form1" method="post" action="search.asp">
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="900">
    <tr> 
      <td>请选择查询条件：</td>
      <td colspan="3">系统默认全部符合</td>
    </tr>
    <tr> 
      <td> 
        <div align="right">科室</div>
      </td>
      <td><label for="flqx"></label> 
        <select name="KS" id="flqx">
          <option value="农村农业">农村农业</option>
          <option value="城建商贸">城建商贸</option>
          <option value="工交文卫">工交文卫</option>
          <option value="综合其他">综合其他</option>
          <option value="" selected>全部</option>
        </select>
      </td>
      <td> 
        <div align="right">代表姓名</div>
      </td>
      <td><label for="sxh"> 
        <input name="DBXM" type="text" id="dbxm" size="30" maxlength="30" />
        </label> </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">身份证号码</div>
      </td>
      <td> 
        <input name="SFZ" type="text" id="sfz" size="18" maxlength="18" />
      </td>
      <td> 
        <div align="right">住址</div>
      </td>
      <td> <label for="sex"> 
        <select name="ZZ" id="zz">
          <option value="拉哈镇">拉哈镇</option>
          <option value="老莱镇">老莱镇</option>
          <option value="通南镇">通南镇</option>
          <option value="讷南镇">讷南镇</option>
          <option value="龙河镇">龙河镇</option>
          <option value="学田镇">学田镇</option>
          <option value="同义镇">同义镇</option>
          <option value="六合镇">六合镇</option>
          <option value="长发镇">长发镇</option>
          <option value="九井镇">九井镇</option>
          <option value="兴旺乡">兴旺乡</option>
          <option value="孔国乡">孔国乡</option>
          <option value="同心乡">同心乡</option>
          <option value="和盛乡">和盛乡</option>
          <option value="二克浅镇">二克浅镇</option>
          <option value="雨亭街道">雨亭街道</option>
          <option value="通江街道">通江街道</option>
          <option value="其他">其他</option>
          <option value="" selected>全部</option>
        </select>
        </label></td>
    </tr>
    <tr> 
      <td> 
        <div align="right">来访人姓名</div>
      </td>
      <td> 
        <input name="LFXM" type="text" id="lfxm" size="20" maxlength="100" />
      </td>
      <td> 
        <div align="right">责任单位</div>
      </td>
      <td> 
        <select name="ZRDW" id="zz2">
							<option value="" selected>全部</option>
          <option value="拉哈镇">拉哈镇</option>
          <option value="老莱镇">老莱镇</option>
          <option value="通南镇">通南镇</option>
          <option value="讷南镇">讷南镇</option>
          <option value="龙河镇">龙河镇</option>
          <option value="学田镇">学田镇</option>
          <option value="同义镇">同义镇</option>
          <option value="六合镇">六合镇</option>
          <option value="长发镇">长发镇</option>
          <option value="九井镇">九井镇</option>
          <option value="兴旺乡">兴旺乡</option>
          <option value="孔国乡">孔国乡</option>
          <option value="同心乡">同心乡</option>
          <option value="和盛乡">和盛乡</option>
          <option value="二克浅镇">二克浅镇</option>
          <option value="雨亭街道">雨亭街道</option>
          <option value="通江街道">通江街道</option>
          <option value="住建局">住建局</option>
          <option value="规划局">规划局</option>
          <option value="征收办">征收办</option>
          <option value="农业局">农业局</option>
          <option value="林业局">林业局</option>
          <option value="水务局">水务局</option>
          <option value="畜牧局">畜牧局</option>
          <option value="农机局">农机局</option>
          <option value="交通局">交通局</option>
          <option value="教育局">教育局</option>
          <option value="民政局">民政局</option>
          <option value="城管局">城管局</option>
          <option value="人社局">人社局</option>
          <option value="环保局">环保局</option>
          <option value="卫计局">卫计局</option>
          <option value="法院">法院</option>
          <option value="检察院">检察院</option>
          <option value="公安局">公安局</option>
          <option value="移民办">移民办</option>
          <option value="国土局">国土局</option>
          <option value="司法局">司法局</option>
          <option value="供销社">供销社</option>
          <option value="商粮局">商粮局</option>
          <option value="文体局">文体局</option>
          <option value="物价局">物价局</option>
          <option value="工信局">工信局</option>
          <option value="电业局">电业局</option>
          <option value="市场局">市场局</option>
          <option value="其他">其他</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">到亰</div>
      </td>
      <td> 
        <select name="DJCS1">
             <option value="" selected>不限</option>
			 <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&gt;=) </td>
      <td> 
        <div align="right">到亰</div>
      </td>
      <td> 
        <select name="DJCS2">
          <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">到省</div>
      </td>
      <td> 
        <select name="DHCS1">
             <option value="" selected>不限</option>
         <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&gt;=) </td>
      <td> 
        <div align="right">到省</div>
      </td>
      <td> 
        <select name="DHCS2">
            <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">到齐市</div>
      </td>
      <td> 
        <select name="QSCS1">
              <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&gt;=) </td>
      <td> 
        <div align="right">到齐市</div>
      </td>
      <td> 
        <select name="QSCS2">
            <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">到市</div>
      </td>
      <td> 
        <select name="DSCS1">
             <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&gt;=) </td>
      <td> 
        <div align="right">到市</div>
      </td>
      <td> 
        <select name="DSCS2">
             <option value="" selected>不限</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        （&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">初访时间</div>
      </td>
      <td> 
        <input type="text" name="CFSJ1" size="20">
        （&gt;=) 格式：YYYY-MM-DD</td>
      <td> 
        <div align="right">初访时间</div>
      </td>
      <td> 
        <input type="text" name="CFSJ2" size="20">
        （&lt;) 格式：YYYY-MM-DD</td>
    </tr>
    <tr> 
      <td> 
        <div align="right">处理日期</div>
      </td>
      <td> 
        <input type="text" name="RE_DATE1" size="20">
        （&gt;=) 格式：YYYY-MM-DD</td>
      <td> 
        <div align="right">处理日期</div>
      </td>
      <td> 
        <input type="text" name="RE_DATE2" size="20">
        （&lt;) 格式：YYYY-MM-DD</td>
    </tr>
    <tr> 
      <td> 
        <div align="right">处理状态</div>
      </td>
      <td> 
        <select name="CLZT" id="flqx2">
          <option value="办理中">办理中</option>
          <option value="结案">结案</option>
          <option value="不予受理">不予受理</option>
          <option value="" selected>全部</option>
        </select>
      </td>
      <td> 
        <div align="right">操作人</div>
      </td>
      <td> 
        <select name="PERSON" id="flqx2">
		  <option value="" selected>全部</option>
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
        </select>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">反映问题</div>
      </td>
      <td> 
        <input name="FYWT" type="text" id="fwcs" size="20" />
      </td>
      <td> 
        <div align="right">处理情况</div>
      </td>
      <td> 
        <input name="CLQK" type="text" id="lfrs2" size="30" />
      </td>
    </tr>
    <tr> 
      <td colspan="4">以下只在生成表格有用</td>
    </tr>
    <tr> 
      <td>表格的标题</td>
      <td colspan="3">
        <input type="text" name="BGBT" size="80">
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right"></div>
      </td>
      <td colspan="3"> 
        <div align="center"> 
          <input type="submit" name="search" value="进行查询">
          <input type="submit" name="scbg" value="报表制作">
          <input type="reset" name="Reset" value="重新输入">
			  <input type="submit" name="add" value="继续增加">
        </div>
      </td>
    </tr>
  </table>
  <hr width="900" size="1" align="left">
</form>
</body>
</html>
