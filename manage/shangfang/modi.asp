<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
 
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ���������
	'���������ű�������Ա����
 '�жϼ���

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")

	
	SQL = "SELECT TOP 1 * FROM SHANGFANG WHERE ID = " & REQUEST("ID") & " AND PERSON = '" & Request.Cookies("user_name") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ�����󣡻�Ǳ�������ļ�¼")
				Response.end 
			END IF
			
	
	
	%> 
	<script language="javascript">

var lsdz = "";
function checkIn()
{
   
   
    if( document.un.DBXM.value.length <1) {
      alert("��������������д");
      document.un.DBXM.focus();
      return false;
   }
  if( document.un.SFZ.value.length <1) {
      alert("���֤���������д");
      document.un.SFZ.focus();
      return false;
   }


	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
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
      <div align="center"><b>������Ա�ǼǱ��޸ģ�</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="900" align="left">
<form id="form1" name="un" method="post" action="save_up.asp">
<input type="hidden" name="id" value="<%=Request("id")%>">
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="900">
    <tr> 
      <td> 
        <div align="right">����</div>
      </td>
      <td><label for="flqx"></label> 
        <select name="KS" id="flqx">
          <option value="ũ��ũҵ">ũ��ũҵ</option>
          <option value="�ǽ���ó">�ǽ���ó</option>
          <option value="��������">��������</option>
          <option value="�ۺ�����">�ۺ�����</option>
			 <option value="<%=RS("KS")%>" selected><%=RS("KS")%></option>
        </select>
      </td>
      <td> 
        <div align="right">˳���</div>
      </td>
      <td><label for="sxh"><%=RS("SXH")%></label> </td>
      <td> 
        <div align="right">����</div>
      </td>
      <td colspan="3"><%=RS("RE_DATE")%></td>
    </tr>
    <tr> 
      <td> 
        <div align="right">��������</div>
      </td>
      <td> 
        <input name="DBXM" type="text" id="dbxm" size="30" maxlength="30" value="<%=rs("dbxm")%>"  />
      </td>
      <td> 
        <div align="right">�Ա�</div>
      </td>
      <td> 
       <%=rs("sex")%></td>
      <td> 
        <div align="right">��ϵ�绰</div>
      </td>
      <td colspan="3"> 
        <input name="LXDH" type="text" id="lxdh" size="20" maxlength="20"  value="<%=rs("lxdh")%>"/>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">���֤����</div>
      </td>
      <td> 
        <input name="SFZ" type="text" id="sfz" size="18" maxlength="18"  value="<%=rs("sfz")%>"/>
      </td>
      <td> 
        <div align="right">סַ</div>
      </td>
      <td colspan="5"> 
        <select name="ZZ" id="zz">
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="ͨ����">ͨ����</option>
          <option value="ګ����">ګ����</option>
          <option value="������">������</option>
          <option value="ѧ����">ѧ����</option>
          <option value="ͬ����">ͬ����</option>
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="�ž���">�ž���</option>
          <option value="������">������</option>
          <option value="�׹���">�׹���</option>
          <option value="ͬ����">ͬ����</option>
          <option value="��ʢ��">��ʢ��</option>
          <option value="����ǳ��">����ǳ��</option>
          <option value="��ͤ�ֵ�">��ͤ�ֵ�</option>
          <option value="ͨ���ֵ�">ͨ���ֵ�</option>
          <option value="����">����</option>
			 <option value="<%=RS("zz")%>" selected><%=RS("zz")%></option>
        </select>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����������</div>
      </td>
      <td colspan="3"> 
        <input name="LFXM" type="text" id="lfxm" size="50" maxlength="100"  value="<%=rs("lfxm")%>"/>
      </td>
      <td> 
        <div align="right">����</div>
      </td>
      <td colspan="3"> 
        <input name="LFRS" type="text" id="lfrs" size="4" maxlength="4"  value="<%=rs("lfrs")%>"/>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">���굽�з��ʴ���</div>
      </td>
      <td> 
        <input name="DSCS" type="text" id="fwcs" size="4" maxlength="4"  value="<%=rs("dscs")%>"/>
      </td>
      <td> 
        <div align="right">������</div>
      </td>
      <td> 
        <input name="QSCS" type="text" id="lfrs2" size="4" maxlength="4"  value="<%=rs("qscs")%>" />
      </td>
      <td> 
        <div align="right">��ʡ</div>
      </td>
      <td> 
        <input name="DHCS" type="text" id="lfrs3" size="4" maxlength="4"  value="<%=rs("dhcs")%>"/>
      </td>
      <td>
        <div align="right">����</div>
      </td>
      <td> 
        <input name="DJCS" type="text" id="lfrs4" size="4" maxlength="4"  value="<%=rs("djcs")%>"/>
      </td>
    </tr>
    <tr> 
      <td rowspan="2"> 
        <div align="right">��ӳ����</div>
      </td>
      <td>
        <div align="right">����ʱ�� ��ʽ��YYYY-MM-DD </div>
      </td>
      <td> 
        <div align="left">
          <input type="text" name="CFSJ" size="20"  value="<%=rs("cfsj")%>">
          
         </div>
      </td>
      <td>
        <div align="right">���ε�λ</div>
      </td>
      <td> 
        <select name="ZRDW" id="zz2">
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="ͨ����">ͨ����</option>
          <option value="ګ����">ګ����</option>
          <option value="������">������</option>
          <option value="ѧ����">ѧ����</option>
          <option value="ͬ����">ͬ����</option>
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="�ž���">�ž���</option>
          <option value="������">������</option>
          <option value="�׹���">�׹���</option>
          <option value="ͬ����">ͬ����</option>
          <option value="��ʢ��">��ʢ��</option>
          <option value="����ǳ��">����ǳ��</option>
          <option value="��ͤ�ֵ�">��ͤ�ֵ�</option>
          <option value="ͨ���ֵ�">ͨ���ֵ�</option>
          <option value="ס����">ס����</option>
          <option value="�滮��">�滮��</option>
          <option value="���հ�">���հ�</option>
          <option value="ũҵ��">ũҵ��</option>
          <option value="��ҵ��">��ҵ��</option>
          <option value="ˮ���">ˮ���</option>
          <option value="������">������</option>
          <option value="ũ����">ũ����</option>
          <option value="��ͨ��">��ͨ��</option>
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="�ǹܾ�">�ǹܾ�</option>
          <option value="�����">�����</option>
          <option value="������">������</option>
          <option value="���ƾ�">���ƾ�</option>
          <option value="��Ժ">��Ժ</option>
          <option value="���Ժ">���Ժ</option>
          <option value="������">������</option>
          <option value="�����">�����</option>
          <option value="������">������</option>
          <option value="˾����">˾����</option>
          <option value="������">������</option>
          <option value="������">������</option>
          <option value="�����">�����</option>
          <option value="��۾�">��۾�</option>
          <option value="���ž�">���ž�</option>
          <option value="��ҵ��">��ҵ��</option>
          <option value="�г���">�г���</option>
          <option value="����">����</option>
			 <option value="<%=rs("zrdw")%>" selected><%=rs("zrdw")%></option>
        </select>
      </td>
      <td>
        <div align="right">�װ�������</div>
      </td>
      <td colspan="2"> 
        <input name="SBZRR" type="text" id="sbzrr" size="20" maxlength="20"  value="<%=rs("sbzrr")%>"/>
      </td>
    </tr>
    <tr> 
      <td colspan="7"><label for="fywt"></label> 
        <textarea name="FYWT" id="fywt" cols="90" rows="4"><%=rs("fywt")%></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">���������һ��</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKA" id="clqka" cols="90" rows="4"><%=rs("clqka")%></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">�������������</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKB" id="clqkb" cols="90" rows="4"><%=rs("clqkb")%></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">�������������</div>
      </td>
      <td colspan="7"> 
        <textarea name="CLQKC" id="clqkc" cols="90" rows="4"><%=rs("clqkc")%></textarea>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">���δ���״̬</div>
      </td>
      <td colspan="3"> 
        <select name="CLZT" id="flqx2">
          <option value="������">������</option>
          <option value="�᰸">�᰸</option>
          <option value="��������">��������</option>
			 <option value="<%=rs("clzt")%>" selected ><%=rs("clzt")%></option>
        </select>
      </td>
      <td>
        <div align="right">������</div>
      </td>
      <td colspan="3"><%=Request.Cookies("user_name")   %></td>
    </tr>
    <tr> 
      <td> 
        <div align="right"></div>
      </td>
      <td colspan="3"> 
        <div align="center"> 
          <input type="submit" name="save" value="�ύ����">
          <input type="reset" name="Reset" value="��������">
			  <input type="button" name="home" value="��    ��" onClick=javascript:window.close();>
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
