<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ���
'���������ű��κ��˲�����ԭ�������Լ�ɾ���Լ��ļ�¼

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("doctor_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
	
	CAOZUO = TRIM(REQUEST("CAOZUO"))
	POP = INSTR(CAOZUO,",")
		I = 0
		WHILE POP >0
			LK(I) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			I = I + 1
		WEND
		LK(I)=TRIM(MID(CAOZUO,1))
	FOR J = 0 TO I
		
	  SQL = "SELECT * FROM D_DOCTOR WHERE NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM D_DOCTOR WHERE NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'��ѯ
	IF REQUEST("CLASS_NO") <> "" THEN
		MYA = " AND CLASS_NO LIKE '%" & REQUEST("CLASS_NO") & "%' "
		ELSE
		MYA = "  "
	
	END IF

	IF REQUEST("XM") <> "" THEN
	MYB = " AND XM  LIKE '%" & REQUEST("XM") & "%' "
	END IF
	IF REQUEST("info_find") <> "" THEN
	MYC = " AND info_find  '%" & REQUEST("info_find") & "%' "
	END IF
	IF REQUEST("info_source") <> "" THEN
	MYD = " AND info_source LIKE  '%" & REQUEST("info_source") & "%' "
	END IF

	IF REQUEST("HS_NO") <> "" THEN
	MYF = " AND HS_NO =  '" & REQUEST("HS_NO") & "' "
	END IF
	IF REQUEST("zw") <> "" THEN
	MYG = " AND zw LIKE  '%" & REQUEST("zw") & "%' "
	END IF
	IF REQUEST("XSZW_GJA") <> "" THEN
	MYH = " AND XSZW_GJA LIKE  '%" & REQUEST("XSZW_GJA") & "%' "
	END IF
	IF REQUEST("ZC") <> "" THEN
	MYI = " AND ZC LIKE  '%" & REQUEST("ZC") & "%' "
	END IF
	IF REQUEST("GJLY_RZ") <> "" THEN
	MYJ = " AND GJLY_RZ LIKE  '%" & REQUEST("GJLY_RZ") & "%' "
	END IF
	IF REQUEST("jbxt") <> "" THEN
	MYK = " AND (jbxta LIKE  '%" & REQUEST("jbxt") & "%' or jbxtb like '%" & REQUEST("jbxt") & "%' or jbxtc like '%" & REQUEST("jbxt") & "%') "
	END IF
	IF REQUEST("jbmc") <> "" THEN
	MYL = " AND (jbmca LIKE  '%" & REQUEST("jbmc") & "%' or jbmcb like '%" & REQUEST("jbmc") & "%' or jbmcc like '%" & REQUEST("jbmc") & "%') "
	END IF
	IF REQUEST("ZLTC") <> "" THEN
	MYM = " AND ZLTC LIKE  '%" & REQUEST("ZLTC") & "%' "
	END IF
	IF REQUEST("ysclass") <> "" THEN
	MYN = " AND ysclass LIKE  '%" & REQUEST("ysclass") & "%' "
	END IF
	IF REQUEST("dq") <> "" THEN
	MYO = " AND dq LIKE  '%" & REQUEST("dq") & "%' "
	END IF
	IF REQUEST("zp") <> "" THEN
		if request("zp") = "��" then 
		MYP = " AND zp <> '' "
		else
		MYP = " AND ZP ='' "
		END IF
	END IF
	
	IF REQUEST("QG_PM1") <> "" THEN
	MYR = " AND QG_PM >=  " & REQUEST("QG_PM1") & " "
	END IF
	IF REQUEST("QG_PM2") <> "" THEN
	MYS = " AND QG_PM <  " & REQUEST("QG_PM2") & " "
	END IF
	IF REQUEST("username") <> "" THEN
	MYT = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END If
	IF REQUEST("NO") <> "" THEN
	MYU = " AND NO LIKE '%" & Request("NO") & "%' "
	END IF
	
	PXZD = Request("pxzd")
	
	IF PXZD = "YSNR" THEN
	PXZD = "LEN(xm+dq++zch+zc+xs+jbxta+jbxtb+jbxtc+zljd+zlfs+zltc+kyfx++ysgs+gjly_rz+gjly_jx+gjly_xs+xszw_gja+xszw_ss+xszw_yx+xszw_zz+xmcg_gj+jlqk_gja+jlqk_ss+jlqk_yx+jlqk_qt+zylz+lwfb+blbw+zybd+zyxy+jbmca+jbmcb+jbmcc+rwgs+JCIPS+zw)"
	ELSE
	PXZD = Request("pxzd")
	END IF
	
	SQL = "SELECT  * FROM D_DOCTOR WHERE NO <> ''  " & MYA & MYB & MYC & MYD & MYE & MYF & MYG & MYH & MYI & MYJ & MYK & MYL & MYM & MYN & MYO & MYP & MYQ & MYR & MYS & MYT & MYU & " ORDER BY " & PXZD & " " & Request("pxff") & " "


RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				IF REQUEST("PageNo") = "" THEN
				PageNo = Request("PageNo")
				
				if PageNo <> "" Then
					
				else
					PageNo=1
				
				End if
				ELSE
				PageNo = Request("PageNo1")
				END IF
			
				
				
%>

<html>
<head>
<title>ҽ�����ϲ�ѯϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
<script language="javascript">
var lsdz = "";
function checkIn()
{    
   if(confirm("���������Ҫɾ����ѡ��ļ�¼��?"))
      return true
   else
      return false;
}
</script>
<p align="center" class="main">�ڲ���������ϵͳ���ݣ�ÿҳ20����¼�� 
<form method="post" action="doctor_search.asp" name="un">
   <input type=hidden name="class_no" value="<%=REQUEST("class_no")%>">
  <input type=hidden name="xm" value="<%=REQUEST("xm")%>">
 <input type=hidden name="info_find" value="<%=REQUEST("info_find")%>">
  <input type=hidden name="info_corre" value="<%=REQUEST("info_corre")%>">
  <input type=hidden name="hs_no" value="<%=REQUEST("hs_no")%>">
  <input type=hidden name="zw" value="<%=REQUEST("zw")%>">
  <input type=hidden name="zch" value="<%=REQUEST("zch")%>">
  <input type=hidden name="zc" value="<%=REQUEST("zc")%>">
  <input type=hidden name="cj" value="<%=REQUEST("cj")%>">
  <input type=hidden name="zlal" value="<%=REQUEST("zlal")%>">
  <input type=hidden name="zxdt" value="<%=REQUEST("zxdt")%>">
  <input type=hidden name="zltc" value="<%=REQUEST("zltc")%>">
  <input type=hidden name="cjry" value="<%=REQUEST("cjry")%>">
  <input type=hidden name="ADDR" value="<%=REQUEST("ADDR")%>">
  <input type=hidden name="BD_PM1" value="<%=REQUEST("BD_PM1")%>">
  <input type=hidden name="BD_PM2" value="<%=REQUEST("BD_PM2")%>">
  <input type=hidden name="QG_PM1" value="<%=REQUEST("QG_PM1")%>">
  <input type=hidden name="QG_PM2" value="<%=REQUEST("QG_PM2")%>">
  <input type=hidden name="pxzd" value="<%=REQUEST("pxzd")%>">
  <input type=hidden name="pxff" value="<%=REQUEST("pxff")%>">
  <input type=hidden name="ysclass" value="<%=REQUEST("ysclass")%>">
  <input type=hidden name="username" value="<%=REQUEST("username")%>">
<table width="1200" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#CCCCCC"> 
      
    <td width="4%"> 
      <div align="center"><font color="#0000FF">ɾ��</font></div>
      </td>
      
    <td width="3%"><font color="#0000FF">�޸�</font></td>
      
      
    <td width="6%"><font color="#0000FF">����</font></td>
      
    <td width="19%"> 
      <div align="center"><font color="#0000FF">ҽԺ</font></div>
      </td>
		
    <td width="7%"> 
      <div align="center"><font color="#0000FF">���</font></div>
      </td>
      
    <td width="8%"> 
      <div align="center"><font color="#0000FF">����</font></div>
      </td>
      <td width="8%"> 
      <div align="center"><font color="#0000FF">һ������</font></div>
      </td>
    <td width="10%"> 
      <div align="center"><font color="#0000FF">���ִҽ</font></div>
      </td>
      
    <td width="7%"> 
      <div align="center"><font color="#0000FF">��������</font></div>
      </td>
	  
    <td width="7%"> 
      <div align="center"><font color="#0000FF">�������</font></div>
      </td>
		
    <td width="8%"><font color="#0000FF">�ύ����</font></td>
		
    <td width="7%"><font color="#0000FF">�޸�����</font></td>
		
    <td width="9%"><font color="#0000FF">����޸���</font></td>
	 
    <td width="5%"><font color="#0000FF">����</font></td>
    </tr>
    <%
		'�ж���ʾ����ҳ��
			RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 20	'ÿҳһ10��
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      
    <td width="4%" height="34"> 
      <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("no")%>>
          &nbsp; </div>
      </td>
      
    <td width="3%" height="34"> <a href="doctor_modi.asp?no=<%=RS("no")%>" target="_blank">Go!</a> 
      &nbsp; </td>
         
    <td width="6%" height="34"> <%
      IF RS("CLASS_NO") <> "" THEN
      S_N = DISPLAY_NAME("D_CLASS",RS("CLASS_NO"),"CLASS_NO","CLASS_NAME")
      Response.Write  S_N
      ELSE
      Response.Write "�ڲ�"
      END IF
      %> </td>
      
    <td width="19%" height="34"> 
      <div align="center"><%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")%></div>
      </td>
		 
    <td width="7%" height="34"> 
      <div align="center"> <%=RS("NO")%> </div>
      </td>
      
    <td width="8%" height="34"> 
      <div align="center"><a href="doctor_detail.asp?no=<%=RS("no")%>" target='blank'><%=RS("xm")%></a>&nbsp;&nbsp;<a href="doctor_baidu.asp?xm=<%=rs("xm")%>" target="_blank">Baidu</a></div>
      </td>
		 
    <td width="10%" height="34"> 
      <div align="center"><a href="doctor_enter.asp?no=<%=RS("no")%>" target='blank'>һ��</a></div>
      </td>
    	 <td width="10%" height="34"> 
      <div align="center"><a href="doctor_zy.asp?no=<%=RS("no")%>" target='blank'>���</a></div>
      </td>
    	 
    <td width="7%" height="34"> 
      <div align="center"><%=rs("jci_qg_pm")%></div>
      </td>
	  	 
    <td width="7%" height="34"> 
      <div align="center"><a href="doctor_fenshu.asp?no=<%=RS("no")%>" target='blank'>Go</a></div>
      </td>
      
    <td width="8%" height="34"> 
      <div align="center"><%=RS("re_date")%></div>
      </td>
	   
    <td width="7%" height="34"> 
      <div align="center">
		<%=RS("GX_date")%>
		</div>
      </td>
	   
    <td width="9%" height="34"> 
      <div align="center">
		<%=RS("GX_USER")%>
		</div>
      </td>
		 
    <td width="5%" height="34"> 
      <div align="center">
		<a href="doctor_lici.asp?No=<%=RS("NO")%>" target="_blank">Go!</a>
		</div>
      </td>
		
       </tr>
    <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
  </table>


  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">�ܼƣ�</font></div>
      </td>
      <td width="11%"><font color="#000000"><font color=red><%=PAGE%></font>ҳ</font></td>
      <td width="11%"> 
        <div align="center">��ǰ<font color=red><%=PageNo%></font>ҳ</div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="��ҳ">
          </font></div>
      </td>
		<td width="8%"> 
        <div align="center"> <font color="#000000"> 
         <a href="doctor_baidu.asp?xm=<%=request("xm")%>" target="_blank">������</a>
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Del" value="ɾ��" onClick="return checkIn();">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="����" onClick=history.back()>
          </font></div>
      </td>
      <td width="20%"> 
        <div align="center"><font color="#000000">��ʾ 
          <input type="text" name="PageNo" size="4" maxlength="6">
          ҳ 
          <input type="submit" name="Search" value="Go">
          </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) >1 THEN
                %><a href="doctor_search.asp?bd_pm1=<%request("bd_pm1")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&class_no=<%=request("class_no")%>&xm=<%=request("xm")%>&ADDR=<%=request("ADDR")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&hs_no=<%=request("hs_o")%>&zch=<%=request("zch")%>&zc=<%=request("zc")%>&cj=<%=request("cj")%>&zxdt=<%=request("zxdt")%>&zltc=<%=request("zltc")%>&cjry=<%=request("cjry")%>&username=<%=Request("username")%>&pxzd=<%=request("pxzd")%>&pxff=<%=request("pxff")%>&ysclass=<%=request("ysclass")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="doctor_search.asp?bd_pm1=<%request("bd_pm1")%>&bd_pm2=<%request("bd_pm2")%>&qg_pm2=<%request("qg_pm2")%>&qg_pm1=<%request("qg_pm1")%>&class_no=<%=request("class_no")%>&xm=<%=request("xm")%>&ADDR=<%=request("ADDR")%>&info_find=<%=request("info_find")%>&info_corre=<%=request("info_corre")%>&hs_no=<%=request("hs_no")%>&zch=<%=request("zch")%>&zc=<%=request("zc")%>&cj=<%=request("cj")%>&zxdt=<%=request("zxdt")%>&zltc=<%=request("zltc")%>&cjry=<%=request("cjry")%>&username=<%=Request("username")%>&pxzd=<%=request("pxzd")%>&pxff=<%=request("pxff")%>&ysclass=<%=request("ysclass")%>&PageNo=<%=PageNo+1%>&search=all"> 
          ��һҳ</a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
ELSE
%>
<html>
<head>
<title>û�в�ѯ��<%=request("xm")%>��¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<p>û�в�ѯ��<%=request("xm")%>��¼</p>
<table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr> 
    <td width="26%">���������վ����</td>
    <td width="74%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">1</td>
    <td width="74%"><a href="https://www.baidu.com/s?wd=<%=Request("xm")%>" target="_blank">�ٶ�</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">2</td>
    <td width="74%"><a href="https://baike.baidu.com/item/<%=Request("xm")%>"  target="_blank">�ٶȰٿ�</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">3</td>
    <td width="74%"><a href="http://so.haodf.com/index/search?type=&kw=<%=Request("xm")%>"  target="_blank">�ô��</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">4</td>
    <td width="74%"><a href="http://so.xywy.com/comse.php?keyword=<%=Request("xm")%>&ie=utf-8&src=xywyhome"  target="_blank">Ѱҽ��ҩ</a>&nbsp;</td>
  </tr>
  <tr>
    <td width="26%">5</td>
    <td width="74%"><a href="https://www.sogou.com/web?query=<%=Request("xm")%>"  target="_blank">sogou</a>&nbsp;</td>
  </tr>
  <tr> 
    <td width="26%">6</td>
    <td width="74%"><a href="http://weixin.sogou.com/weixin?p=01030402&query=<%=Request("xm")%>"  target="_blank">sogou΢��</a>&nbsp;</td>
  </tr>
</table>

<p><input type=button name=back value="����" onclick=history.back();></p>
</body>
<%
END IF

%>
