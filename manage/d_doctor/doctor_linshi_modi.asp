<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���
 Function check_op(s_chr,d_chr)
 	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		check_op = "checked"
		ELSE
		check_op = ""
		END IF	
 End Function

 Function if_opa(s_chr,d_chr)
	POP = INSTR(s_chr,d_chr)
		IF POP >0 THEN
		if_opa = "checked"
		ELSE
		if_opa = ""
		END IF	
 End Function
 
 Function if_checkbox(s_chr,d_chr)
	POP = INSTR(s_chr,"PZ"&d_chr&"ED")
		IF POP >0 THEN
		if_checkbox = "checked"
		ELSE
		if_checkbox = ""
		END IF	
 End Function 
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	IF Request("hs_no") <> "" Then
	MYDQ = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","TYPE")  
	End if
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR_LINSHI WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>ҽ����Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<script language="javascript">
function GoToURLB()
{
  
  var tURL= "doctor_linshi_modi.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL3= "&ysclass="+document.un.ysclass.options[document.un.ysclass.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
   var tURL4 = "&no="+document.un.no.value;
  document.location=tURL+tURL1+tURL2+tURL3+tURL4;
}
</script>
<script language="javascript">
function GoToURL()
{
  
  var tURL= "doctor_linshi_modi.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "&no="+document.un.no.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_linshi_modi.asp?yy="+document.un.yy.value;
  var tURL2 = "&no="+document.un.no.value;
  document.location=tURL1+tURL2;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
      if( document.un.class_no.options[document.un.class_no.selectedIndex].value <1) {
      alert("���ұ���ѡ��");
      document.un.class_no.focus();
      return false;
   }
    
    if( document.un.hs_no.options[document.un.hs_no.selectedIndex].value <1) {
      alert("ҽԺ����ѡ��");
      document.un.hs_no.focus();
      return false;
   }
    
   
   
    if( document.un.xm.value.length <1) {
      alert("����������д");
      document.un.xm.focus();
      return false;
   }


	if( document.un.info_find.value.length <1) {
      alert("�����ַ�һ��Ҫ�У���ѯʲô�ܲ鵽������");
      document.un.info_find.focus();
      return false;
   }
  
	
	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ�޸ģ�*�������㼨Ч���� </font></div>
<hr>
<form method="POST" action="doctor_linshi_save.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1072" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ҽԺ��</td>
      <td width="55%" class="main"> 
        <select name="hs_no"  onChange="GoToURL()">
          <option value="" selected>��ѡ��ҽԺ</option>
          <%
			  if request("yy") <> "" then
			   SQL = "SELECT * FROM HOSPTIAL WHERE HS_NAME LIKE '%" & Request("yy") & "%' or alice_name like '%" & Request("yy") & "%' ORDER BY HS_NAME"
			  else
			   SQL = "SELECT * FROM HOSPTIAL ORDER BY HS_NAME"
			  end if
       
        RS1.OPEN SQL,CONN,1,1
		  I = 1
        DO WHILE NOT RS1.EOF 
							  IF I = 1 AND Request("hs_no") = "" THEN
							  MY_HS_NO = RS1("HS_NO")
							  MYXZZW = RS1("HS_NAME")
							  ELSE
									if Request("hs_no") <> "" then
									MY_HS_NO = Request("hs_no")
									end if
							  END IF
		  		IF Request("HS_NO") = RS1("HS_NO") THEN
						MYXZZW = RS1("HS_NAME")
        %> 
          <option value="<%=RS1("HS_NO")%>" selected> <%=MID(RS1("HS_NAME"),1,50)%></option>
          <%
		  ELSE
		  %> 
          <option value="<%=RS1("HS_NO")%>" > <%=MID(RS1("HS_NAME"),1,50)%></option>
          <%
				END IF
				I = I + 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
        <input type="text" name="yy" size="10">
        <input type="button" name="yx" value="��ѯ" onClick=GoToURLA();> <a href="/manage/hosptial/hosptial_add.asp" target="_blank">����ҽԺ</a>
      </td>
      <td width="35%" class="main"><b><font color="#FF3300">ԭ����</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���ң�</td>
      <td width="55%" class="main"> 
        <select name="class_no"   onChange="GoToURLB()">
          <option value="" selected>��ѡ�����</option>
          <%
        SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & MY_HS_NO & "' ORDER BY CLASS_NAME"
        RS1.OPEN SQL,CONN,1,1
		  	J = 1
        DO WHILE NOT RS1.EOF 
								IF J = 1 AND Request("class_no") = "" THEN
							  MY_CH_NO = RS1("CLASS_NO")
							  MYXZZW = MYXZZW & RS1("CLASS_NAME")
							  ELSE
									if Request("class_no") <> "" then
									MY_CH_NO = Request("class_no")
									end if
							  END IF
				IF REQUEST("CLASS_NO") = RS1("CLASS_NO") THEN
				MYXZZW = MYXZZW & RS1("CLASS_NAME")
        %> 
          <option value="<%=RS1("CLASS_NO")%>"  selected> <%
				else
				%> 
          <option value="<%=RS1("CLASS_NO")%>" > <%
				end if
				%> <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %> <%=MID(RS1("CLASS_NAME"),1,50)%> </option>
          <%
		  J= J+ 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>  <a href="/manage/d_class/d_class_add.asp" target="_blank">���ӿ���</a>
      </td>
      <td rowspan="11" class="main" valign="top"><%=rs("YNR")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��ţ�</td>
      <td width="55%" class="main"> <%=rs("no")%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">������</td>
      <td width="55%" class="main"> 
        <input type="text" name="xm" size="50" value="<%=rs("xm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ҽ�����</td>
      <td width="55%" class="main"> 
        <select name="ysclass" >
          <option value="��ϯ��ҽ��" > ��ϯ��ҽ��</option>
          <option value="��ҽ��" > ��ҽ��</option>
          <option value="�о�ѧ��" >�о�ѧ��</option>
		    <option value="��ϯ�о�ѧ��" >��ϯ�о�ѧ��</option>
          <%
			 If request("ysclass") <> "" Then
			 %> 
          <option value="<%=request("ysclass")%>" selected> <%=request("ysclass")%></option>
          <%
			 End if
			 %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">������(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="dq" size="50" value="<%=MYDQ%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����ʱ�䣺(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="worktime" size="50" value="<%=rs("worktime")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����ְ��(*)</td>
      <td width="55%" class="main"> 
        <textarea name="zw" rows="5" cols="60"><%=rs("zw")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����ְ�ƣ�(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zch" size="50" value="<%=rs("zch")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ��ְ�ƣ�(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zc" size="50" value="<%=rs("zc")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ���ƺţ�(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="xs" size="50" value="<%=rs("xs")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ����������</td>
      <td width="55%" class="main"> 
        <input type="text" name="edu_others" size="46"  value="<%=rs("edu_others")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="rwgs" rows="10" cols="60"><%=rs("rwgs")%></textarea>
      </td>
      <td class="main" valign="bottom" width="35%"><b><font color="#FF0000">�����ʣ�µ�����</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">JCI������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="jcips" rows="10" cols="60"><%=rs("jcips")%></textarea>
      </td>
      <td rowspan="36" class="main" valign="top"><%=rs("XNR")%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�����س���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="zltc" rows="10" cols="60"><%=rs("zltc")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��ҽ/��ҽ��</td>
      <td width="55%" class="main"> 
        <select name="ZYXY" >
          <option value="<%=rs("ZYXY")%>" selected><%=rs("ZYXY")%></option>
          <option value="��ҽ" > ��ҽ</option>
          <option value="��ҽ" > ��ҽ</option>
          <option value="����ҽ���" >����ҽ���</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���ƽ׶Σ�(*)</td>
      <td width="55%" class="main"> 
        <select name="zljd" >
          <option value="<%=rs("zljd")%>" selected> <%=rs("zljd")%></option>
          <option value="���" > ���</option>
          <option value="����" > ����</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���Ʒ�ʽ��(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="zlfs" size="50"  value="<%=rs("zlfs")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�ó�����ϵͳ/��λ1��(*)</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxta" size="50"  value="<%=rs("jbxta")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�ó�����ϵͳ/��λ2��</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxtb" size="50"  value="<%=rs("jbxtb")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�ó�����ϵͳ/��λ3��</td>
      <td width="55%" class="main"> 
        <input type="text" name="jbxtc" size="50"  value="<%=rs("jbxtc")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��������1��</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCA" size="50"   value="<%=rs("JBMCA")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��������2��</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCB" size="50"  value="<%=rs("JBMCB")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��������3��</td>
      <td width="55%" class="main"> 
        <input type="text" name="JBMCC" size="50" value="<%=rs("JBMCC")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���з���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="kyfx" rows="10" cols="60"><%=rs("kyfx")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�������򣺹�����ְ��(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_RZ" rows="10" cols="60"><%=rs("GJLY_RZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�������򣺹��ʽ��(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_JX" rows="10" cols="60"><%=rs("GJLY_JX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��������ѧ�����(*)</td>
      <td width="55%" class="main"> 
        <textarea name="GJLY_XS" rows="10" cols="60"><%=rs("GJLY_XS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ��ְ�񣺹��Ҽ���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_GJA" rows="10" cols="60"><%=rs("XSZW_GJA")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ��ְ��ʡ�м���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_SS" rows="10" cols="60"><%=rs("XSZW_SS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ��ְ��ԺУ����(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_YX" rows="10" cols="60"><%=rs("XSZW_YX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ѧ��ְ����־��ְ��(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XSZW_ZZ" rows="10" cols="60"><%=rs("XSZW_ZZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��Ŀ�ɹ���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="XMCG_GJ" rows="10" cols="60"><%=rs("XMCG_GJ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����������Ҽ���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_GJA" rows="10" cols="60"><%=rs("JLQK_GJA")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�������ʡ�м���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_SS" rows="10" cols="60"><%=rs("JLQK_SS")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�������ԺУ����(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_YX" rows="10" cols="60"><%=rs("JLQK_YX")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�������������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="JLQK_QT" rows="10" cols="60"><%=rs("JLQK_QT")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��Ҫ��������Ҫ������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="ZYLZ" rows="10" cols="60"><%=rs("ZYLZ")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��Ҫ���������ķ���(*)</td>
      <td width="55%" class="main"> 
        <textarea name="LWFB" rows="10" cols="60"><%=rs("LWFB")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="BLBW" rows="10" cols="60"><%=rs("BLBW")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��Ҫ������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="ZYBD" rows="10" cols="60"><%=rs("ZYBD")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">���������(*)</td>
      <td width="55%" class="main"> 
        <textarea name="shry" rows="10" cols="60"><%=rs("shry")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">��Ѷ��Դ��</td>
      <td width="55%" class="main"> 
        <textarea name="zxly" rows="10" cols="60"><%=rs("zxly")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">������Դ��</td>
      <td width="55%" class="main"> 
        <textarea name="zlly" rows="10" cols="60"><%=rs("zlly")%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">�����ַ�����</td>
      <td width="55%" class="main"> 
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ͷ��ͼƬ��</td>
      <td width="55%" class="main"> 
        <input type="text" name="zp" size="16" value="<%=rs("zp")%>">
        <font color=red>�������ξͿ����ˣ�FTP�ϴ�������С��ͼƬ400X600�ģ�����Ϊ��</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">ȫ��������</td>
      <td width="55%" class="main"> 
        <input type="text" name="qg_pm" size="46"  value="<%=rs("qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">����ȫ��������</td>
      <td width="55%" class="main"> 
        <input type="text" name="bj_qg_pm" size="46"  value="<%=rs("bj_qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="10%" class="main">JCIȫ��������</td>
      <td width="55%" class="main"> 
        <input type="text" name="jci_qg_pm" size="46"  value="<%=rs("jci_qg_pm")%>">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="3"> 
        <div align="center"><br>
          <input type="submit" name="Submit" value="�ύ����" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="button" name="home" value="��    ��" onClick=history.back();>
        </div>
      </td>
  </table>
</form>
</body>
</html>

