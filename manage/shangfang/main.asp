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
<title>������Ա�ǼǱ��ѯ</title>
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
      <div align="center"><b>������Ա�Ǽǲ�ѯ</b></div>
    </td>
  </tr>
</table>
<hr size="1" width="900" align="left">
<form id="form1" name="form1" method="post" action="search.asp">
  <table border="1" cellspacing="0" cellpadding="2" bordercolorlight="#FFFFFF" class="main" width="900">
    <tr> 
      <td>��ѡ���ѯ������</td>
      <td colspan="3">ϵͳĬ��ȫ������</td>
    </tr>
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
          <option value="" selected>ȫ��</option>
        </select>
      </td>
      <td> 
        <div align="right">��������</div>
      </td>
      <td><label for="sxh"> 
        <input name="DBXM" type="text" id="dbxm" size="30" maxlength="30" />
        </label> </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">���֤����</div>
      </td>
      <td> 
        <input name="SFZ" type="text" id="sfz" size="18" maxlength="18" />
      </td>
      <td> 
        <div align="right">סַ</div>
      </td>
      <td> <label for="sex"> 
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
          <option value="" selected>ȫ��</option>
        </select>
        </label></td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����������</div>
      </td>
      <td> 
        <input name="LFXM" type="text" id="lfxm" size="20" maxlength="100" />
      </td>
      <td> 
        <div align="right">���ε�λ</div>
      </td>
      <td> 
        <select name="ZRDW" id="zz2">
							<option value="" selected>ȫ��</option>
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
        </select>
      </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����</div>
      </td>
      <td> 
        <select name="DJCS1">
             <option value="" selected>����</option>
			 <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&gt;=) </td>
      <td> 
        <div align="right">����</div>
      </td>
      <td> 
        <select name="DJCS2">
          <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">��ʡ</div>
      </td>
      <td> 
        <select name="DHCS1">
             <option value="" selected>����</option>
         <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&gt;=) </td>
      <td> 
        <div align="right">��ʡ</div>
      </td>
      <td> 
        <select name="DHCS2">
            <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">������</div>
      </td>
      <td> 
        <select name="QSCS1">
              <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&gt;=) </td>
      <td> 
        <div align="right">������</div>
      </td>
      <td> 
        <select name="QSCS2">
            <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����</div>
      </td>
      <td> 
        <select name="DSCS1">
             <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&gt;=) </td>
      <td> 
        <div align="right">����</div>
      </td>
      <td> 
        <select name="DSCS2">
             <option value="" selected>����</option>
          <%
			 FOR I = 1 TO 100
			 %>
          <option value="<%=I%>"><%=I%></option>
			 <%
			 NEXT
			 %>
        </select>
        ��&lt;) </td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����ʱ��</div>
      </td>
      <td> 
        <input type="text" name="CFSJ1" size="20">
        ��&gt;=) ��ʽ��YYYY-MM-DD</td>
      <td> 
        <div align="right">����ʱ��</div>
      </td>
      <td> 
        <input type="text" name="CFSJ2" size="20">
        ��&lt;) ��ʽ��YYYY-MM-DD</td>
    </tr>
    <tr> 
      <td> 
        <div align="right">��������</div>
      </td>
      <td> 
        <input type="text" name="RE_DATE1" size="20">
        ��&gt;=) ��ʽ��YYYY-MM-DD</td>
      <td> 
        <div align="right">��������</div>
      </td>
      <td> 
        <input type="text" name="RE_DATE2" size="20">
        ��&lt;) ��ʽ��YYYY-MM-DD</td>
    </tr>
    <tr> 
      <td> 
        <div align="right">����״̬</div>
      </td>
      <td> 
        <select name="CLZT" id="flqx2">
          <option value="������">������</option>
          <option value="�᰸">�᰸</option>
          <option value="��������">��������</option>
          <option value="" selected>ȫ��</option>
        </select>
      </td>
      <td> 
        <div align="right">������</div>
      </td>
      <td> 
        <select name="PERSON" id="flqx2">
		  <option value="" selected>ȫ��</option>
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
        <div align="right">��ӳ����</div>
      </td>
      <td> 
        <input name="FYWT" type="text" id="fwcs" size="20" />
      </td>
      <td> 
        <div align="right">�������</div>
      </td>
      <td> 
        <input name="CLQK" type="text" id="lfrs2" size="30" />
      </td>
    </tr>
    <tr> 
      <td colspan="4">����ֻ�����ɱ������</td>
    </tr>
    <tr> 
      <td>���ı���</td>
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
          <input type="submit" name="search" value="���в�ѯ">
          <input type="submit" name="scbg" value="��������">
          <input type="reset" name="Reset" value="��������">
			  <input type="submit" name="add" value="��������">
        </div>
      </td>
    </tr>
  </table>
  <hr width="900" size="1" align="left">
</form>
</body>
</html>
