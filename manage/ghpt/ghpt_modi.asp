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
	
	SQL = "SELECT TOP 1 * FROM D_GHPT WHERE ID = " & REQUEST("ID") & ""
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>ȫ���Һ�ƽ̨��Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>
<script language="javascript">

var lsdz = "";
function checkIn()
{
   
   
    if( document.un.name.value.length <1) {
      alert("������д");
      document.un.name.focus();
      return false;
   }


	if( document.un.class.value.length <1) {
      alert("��������д");
      document.un.class.focus();
      return false;
   }
  
	if( document.un.url.value.length <1) {
      alert("URL������д");
      document.un.url.focus();
      return false;
   }
	
	if( document.un.img.value.length <1) {
      alert("IMG������д");
      document.un.img.focus();
      return false;
   }
	
	if( document.un.num.value.length <1) {
      alert("���������д");
      document.un.num.focus();
      return false;
   }
	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<body bgcolor="#FFFFFF">


<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ����ȫ���Һ�ƽ̨��Ϣ�޸� </font></div>
<hr>
<form method="POST" action="ghpt_save_up.asp" name="un">
<input type="hidden" name="id" value="<%=Request("id")%>">
  <table width="653" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���</td>
      <td width="79%" class="main">
        <input type="text" name="class" size="50" value="<%=rs("class")%>">
      
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƣ�</td>
      <td width="79%" class="main">
        <input type="text" name="name" size="50" value="<%=rs("name")%>">
       
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">URL��</td>
      <td width="79%" class="main">
        <input type="text" name="url" size="50" value="<%=rs("url")%>">
       
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">IMG��</td>
      <td width="79%" class="main">
        <input type="text" name="img" size="50" value="<%=rs("img")%>">
       
          </td>
    </tr>
	
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ʾ˳��</td>
      <td width="79%" class="main"> 
        <input type="text" name="num" size="30" value="<%=rs("num")%>">
     
       
      </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ʡ�У�</td>
      <td width="79%" class="main"> 
        <input type="text" name="area" size="30" value="<%=rs("area")%>">
     
       
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
