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

					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM SHANGFANG WHERE ID =" & REQUEST("ID") & "" 
						RS.Open SQL,CONN,1,1
							IF RS.RecordCount >0 THEN
	  				
%>
<html>
<head>
<title>������Ա�ǼǱ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-family: "����"; font-size: 9pt; line-height: 21pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="980" border="0" cellspacing="0" cellpadding="5" class="main">
  <tr>
    <td class="wz">
      <div align="center"><b>������Ա�ǼǱ�</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="900" align="left">
<form id="form1" name="un" method="post" action="save.asp">
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="907">
    <tr> 
      <td width="92"> 
        <div align="right">����</div>
      </td>
      <td width="137"><%=RS("KS")%> </td>
      <td width="80"> 
        <div align="right">˳���</div>
      </td>
      <td width="118"><%=NO%> </td>
      <td width="123"> 
        <div align="right">����</div>
      </td>
      <td colspan="3"><%=Date%> <%=time()%></td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">��������</div>
      </td>
      <td width="137"><%=RS("DBXM")%> </td>
      <td width="80"> 
        <div align="right">�Ա�</div>
      </td>
      <td width="118"> <%=RS("SEX")%></td>
      <td width="123"> 
        <div align="right">��ϵ�绰</div>
      </td>
      <td colspan="3"><%=RS("LXDH")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">���֤����</div>
      </td>
      <td width="137"><%=RS("SFZ")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">סַ</div>
      </td>
      <td colspan="5"><%=RS("ZZ")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">����������</div>
      </td>
      <td colspan="3"><%=RS("LFXM")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">����</div>
      </td>
      <td colspan="3"><%=RS("LFRS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">���굽�з��ʴ���</div>
      </td>
      <td width="137"><%=RS("DSCS")%>&nbsp; </td>
      <td width="80"> 
        <div align="right">������</div>
      </td>
      <td width="118"><%=RS("QSCS")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">��ʡ</div>
      </td>
      <td width="75"><%=RS("DHCS")%>&nbsp; </td>
      <td width="69"> 
        <div align="right">����</div>
      </td>
      <td width="163"><%=RS("DJCS")%>&nbsp; </td>
    </tr>
    <tr> 
      <td rowspan="2" width="92"> 
        <div align="right">��ӳ����</div>
      </td>
      <td width="137"> 
        <div align="right">����ʱ��</div>
      </td>
      <td width="80"> 
        <div align="left"> <%=RS("CFSJ")%></div>
      </td>
      <td width="118"> 
        <div align="right">���ε�λ</div>
      </td>
      <td width="123"><%=RS("ZRDW")%>&nbsp; </td>
      <td width="75"> 
        <div align="right">�װ�������</div>
      </td>
      <td colspan="2"><%=RS("SBZRR")%>&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="7"><%=RS("FYWT")%> </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">���������һ��</div>
      </td>
      <td colspan="7"><%=RS("CLQKA")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">�������������</div>
      </td>
      <td colspan="7"><%=RS("CLQKB")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">�������������</div>
      </td>
      <td colspan="7"><%=RS("CLQKC")%>&nbsp; </td>
    </tr>
    <tr> 
      <td width="92"> 
        <div align="right">���δ���״̬</div>
      </td>
      <td colspan="3"><%=RS("CLZT")%>&nbsp; </td>
      <td width="123"> 
        <div align="right">������</div>
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
