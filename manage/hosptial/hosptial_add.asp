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
'	IF Request.Cookies ("PRVI") <> 0 THEN
'	Response.Write "�Բ�����ֻ�ܽ�����ˣ���ʹ�����������ݵ��ʺŽ��е�¼��лл"
'	Response.End 
'	END IF
	
	%> 
<html>
<head>
<title>ҽԺ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<script language="javascript">
function GoToURL()
{
  
  var tURL= "hosptial_add.asp?sf="+document.un.sf.options[document.un.sf.selectedIndex].value;
 // var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL1 = "&hs_name="+document.un.hs_name.value;
  var tURL2 = "&alice_name="+document.un.alice_name.value;
  var tURL3 = "&hs_desc="+document.un.hs_desc.value;
  var tURL4 = "&scjb="+document.un.scjb.value;
  document.location=tURL+tURL1+tURL2+tURL3+tURL4;
}
</script>
<script language="javascript">

var lsdz = "";
function checkIn()
{
    
   
    if( document.un.hs_name.value.length <1) {
      alert("ҽԺ���Ʊ�����д");
      document.un.hs_name.focus();
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
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="hosptial_save.asp" name="un">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <select name="sf"   onChange="GoToURL()">
		  	<option value="" >ʡ��</option>
		  <%
		  SQL = "SELECT DISTINCT ID,M_STATE FROM D_STATE ORDER BY ID"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						IF REQUEST("SF") = RS("M_STATE") THEN
						%>
						<option value="<%=rs("m_state")%>" selected><%=rs("m_state")%></option>
						<%
						ELSE
						
					%>
						<option value="<%=rs("m_state")%>" ><%=rs("m_state")%></option>
					<%
					END IF
					RS.MoveNext
					LOOP
				RS.CLOSE 
		  %>
			
   
		  </select>
		  
		  <select name="cs" >
		
		  <%
		  SQL = "SELECT * FROM D_STATE where M_STATE = '" & REQUEST("SF") & "'"
				RS.Open SQL,CONN,1,1
					DO WHILE NOT RS.EOF 
						%>
						<option value="<%=rs("m_CITY")%>" ><%=rs("m_CITY")%></option>
					<%
					RS.MoveNext
					LOOP
				RS.CLOSE 
		  %>
			
   
		  </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ���ƣ�</td>
      <td width="79%" class="main">
        <input type="text" name="hs_name" size="50" value="<%=Request("hs_name")%>">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������</td>
      <td width="79%" class="main">
       
        <textarea name="alice_name" rows="3" cols="60"><%=Request("alice_name")%></textarea>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��Ƭ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="img" size="30" value="">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��飺</td>
      <td width="79%" class="main"> 
        <textarea name="hs_desc" rows="10" cols="60"><%=Request("hs_desc")%></textarea>
      </td>
    </tr>
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó��ļ�����</td>
      <td width="79%" class="main"> 
        <textarea name="scjb" rows="10" cols="60"><%=Request("scjb")%></textarea>
      </td>
    </tr>
	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ������У��</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_fs" size="30">
     
       
      </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ�ȼ���</td>
      <td width="79%" class="main"> 
        <input type="text" name="yy_dj" size="30" value="�����׵�">
     
       
      </td>
    </tr>
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӫ���ʣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="PROPERTY" size="30">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ񲿶ӣ�</td>
      <td width="79%" class="main"> 
        <input type="radio" name="SF_TROOPS" value="��">
        �� 
        <input type="radio" name="SF_TROOPS" value="��" checked>
        �� 
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ۺ�/ר�ƣ�</td>
      <td width="79%" class="main"> 
        <input type="radio" name="ZHMODE" value="�ۺ�">
        �ۺ� 
        <input type="radio" name="ZHMODE" value="ר��" checked>
        ר�� 
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�֣�</td>
      <td width="79%" class="main"> 
     
       <select name="TYPE" >
  <option value="��ҽ" > ��ҽ</option>
        <option value="��ҽ" > ��ҽ</option>
		   
			 <option value="����ҽ���" >����ҽ���</option>
		  </select>
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��վ��ַ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="url" size="30">
     
       
      </td>
    </tr>

	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�绰��</td>
      <td width="79%" class="main"> 
        <input type="text" name="TEL" size="30">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Һ����ӣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="SEND_URL" size="50">
     
       
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ַ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="address" size="50">
     
       
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�Ƿ���HTML��ʽ��</td>
      <td width="79%" class="main"> 
        <input type="radio" name="if_html" value="��">
        �� 
        <input type="radio" name="if_html" value="��" checked>
        �� </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
        <input type="text" name="info_find" size="30">
     
       
      </td>
    </tr>
   

	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="6" value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="6" value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="6" value="100000">
       </td>
    </tr>
	  
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
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
