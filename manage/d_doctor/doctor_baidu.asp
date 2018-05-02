<html>
<head>
<title>没有查询到<%=request("xm")%>记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<p>没有查询到<%=request("xm")%>记录</p>
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr> 
    <td width="26%">相关资料网站看看</td>
    <td width="74%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">1</td>
    <td width="74%"><a href="https://www.baidu.com/s?wd=<%=Request("xm")%>" target="_blank">百度</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">2</td>
    <td width="74%"><a href="https://baike.baidu.com/item/<%=Request("xm")%>"  target="_blank">百度百科</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">3</td>
    <td width="74%"><a href="http://so.haodf.com/index/search?type=&kw=<%=Request("xm")%>"  target="_blank">好大夫</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">4</td>
    <td width="74%"><a href="http://so.xywy.com/comse.php?keyword=<%=Request("xm")%>&ie=utf-8&src=xywyhome"  target="_blank">寻医问药</a>&nbsp;</td>
  </tr>
  <tr>
    <td width="26%">5</td>
    <td width="74%"><a href="https://www.sogou.com/web?query=<%=Request("xm")%>"  target="_blank">sogou</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">6</td>
    <td width="74%"><a href="http://weixin.sogou.com/weixin?p=01030402&query=<%=Request("xm")%>"  target="_blank">sogou微信</a>&nbsp;</td>
  </tr>
</table>

<p><input type=button name=back value="返回" onclick="javascript:window.close();"></p>
</body>
