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
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "对不起，您只能进行审核，请使用您增加内容的帐号进行登录，谢谢"
'	Response.End 
'	END IF
	
	%> 
	<script language="javascript">

var lsdz = "";
function checkIn()
{
   
   
    if( document.un.DBXM.value.length <1) {
      alert("代表姓名必须填写");
      document.un.DBXM.focus();
      return false;
   }
  if( document.un.SFZ.value.length <1) {
      alert("身份证号码必须填写");
      document.un.SFZ.focus();
      return false;
   }


  
		if( document.un.CFSJ.value.length <1) {
      alert("初访时间必须填写");
      document.un.CFSJ.focus();
      return false;
   }
  
	
   if(confirm("你现在要提交吗?"))
      return true
   else
      return false;
}
</script>
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
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="900">
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
        </select>
      </td>
      <td> 
        <div align="right">顺序号</div>
      </td>
      <td><label for="sxh">待定</label> </td>
      <td> 
        <div align="right">日期</div>
      </td>
      <td colspan="3"><%=Date%></td>
    </tr>
    <tr> 
      <td> 
        <div align="right">代表姓名</div>
      </td>
      <td> 
        <input name="DBXM" type="text" id="dbxm" size="30" maxlength="30" />
      </td>
      <td> 
        <div align="right">性别</div>
      </td>
      <td> 
        <input name="sex" type="radio" id="radio" value="男" checked />
        <label for="sex">男 
        <input type="radio" name="sex" id="radio2" value="女" />
        女</label></td>
      <td> 
        <div align="right">联系电话</div>
      </td>
      <td colspan="3"> 
        <input name="LXDH" type="text" id="lxdh" size="20" maxlength="20" />
      </td>
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
      <td colspan="5"> 
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
        </select>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">来访人姓名</div>
      </td>
      <td colspan="3"> 
        <input name="LFXM" type="text" id="lfxm" size="50" maxlength="100" />
      </td>
      <td> 
        <div align="right">人数</div>
      </td>
      <td colspan="3"> 
        <input name="LFRS" type="text" id="lfrs" size="4" maxlength="4" value="0"/>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">本年到市访问次数</div>
      </td>
      <td> 
        <input name="DSCS" type="text" id="fwcs" size="4" maxlength="4"  value="0"/>
      </td>
      <td> 
        <div align="right">到齐市</div>
      </td>
      <td> 
        <input name="QSCS" type="text" id="lfrs2" size="4" maxlength="4" value="0"/>
      </td>
      <td> 
        <div align="right">到省</div>
      </td>
      <td> 
        <input name="DHCS" type="text" id="lfrs3" size="4" maxlength="4"  value="0"/>
      </td>
      <td>
        <div align="right">到京</div>
      </td>
      <td> 
        <input name="DJCS" type="text" id="lfrs4" size="4" maxlength="4"  value="0"/>
      </td>
    </tr>
    <tr> 
      <td rowspan="2"> 
        <div align="right">反映问题</div>
      </td>
      <td>
        <div align="right">初访时间 
          格式：YYYY-MM-DD</div>
      </td>
      <td> 
        <div align="left">
          <input type="text" name="CFSJ" size="20">
          </div>
      </td>
      <td>
        <div align="right">责任单位</div>
      </td>
      <td> 
        <select name="ZRDW" id="zz2">
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
      <td>
        <div align="right">首办责任人</div>
      </td>
      <td colspan="2"> 
        <input name="SBZRR" type="text" id="sbzrr" size="20" maxlength="20" />
      </td>
    </tr>
    <tr> 
      <td colspan="7"><label for="fywt"></label> 
        <textarea name="FYWT" id="fywt" cols="90" rows="4"></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">处理情况（一）</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKA" id="clqka" cols="90" rows="4"></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">处理情况（二）</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKB" id="clqkb" cols="90" rows="4"></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">处理情况（三）</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKC" id="clqkc" cols="90" rows="4"></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">本次处理状态</div>
      </td>
      <td colspan="3"> 
        <select name="CLZT" id="flqx2">
          <option value="办理中">办理中</option>
          <option value="结案">结案</option>
          <option value="不予受理">不予受理</option>
        </select>
      </td>
      <td>
        <div align="right">操作人</div>
      </td>
      <td colspan="3"><%=Request.Cookies("user_name")   %></td>
    </tr>
    <tr> 
      <td> 
        <div align="right"></div>
      </td>
      <td colspan="3"> 
        <div align="center"> 
          <input type="submit" name="save" value="提交保存"  onClick="return checkIn();">
          <input type="reset" name="Reset" value="重新输入">
			  <input type="button" name="home" value="返    回" onClick=history.back();>
        </div>
      </td>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
  </table>
  <hr width="900" size="1" align="left">
</form>
</body>
</html>
