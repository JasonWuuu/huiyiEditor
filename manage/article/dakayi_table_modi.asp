<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/sql.asp" -->

 <%
	'���ߣ������  �� 2002-4-21 ��д
	'���ܣ��޸�����
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
	
	SQL = "SELECT * FROM DAKAYI_TABLE WHERE id = " & REQUEST("id") & ""
		RS.Open SQL,CONN,adOpenKeyset,adLockReadOnly
		IF RS.RecordCount >0 THEN
		S_INFO_TITLE = RS("INFO_TITLE")
		S_INFO_DESC = RS("INFO_DESC")
		S_INFO_FIND = RS("INFO_FIND")
		ELSE
		Response.Write "�Բ��𣬱���¼�����޸ģ�ԭ��������Ѿ���˻�����������ļ�¼"
		Response.End 
		END IF
		
	%> 
<html>
<head>
<title>�����������޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">

<script language="javascript">

var lsdz = "";
function checkIn()
{
    if( document.un.info_title.value.length <1) {
      alert("���������д");
      document.un.info_title.focus();
      return false;
   }

	 if( document.un.s_info_find.value.length <1) {
      alert("���²�ѯ�ַ�����ѡ��");
      document.un.s_info_find.focus();
      return false;
   }

	
    
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr size="1">
<form method="POST" action="dakayi_table_save_up.asp" name="un">
  <input type=hidden name=id value="<%=rs("id")%>">
   <table width="661" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
   
    <tr bgcolor="#FFFFFF"> 
      <td width="23%" class="main">���ϱ��⣺</td>
      <td width="77%" class="main"> 
        <input type="text" name="info_title" size=50  value="<%=rs("info_title")%>"> 

      </td>
    </tr>
	 	
    <tr bgcolor="#FFFFFF"> 
      <td width="23%" class="main">��飺</td>
      <td width="77%" class="main"> 
        <textarea name="info_desc" rows="10" cols="60" ><%=rs("INFO_DESC")%></textarea>
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="23%" class="main">�����ַ�����</td>
      <td width="77%" class="main"> 
      
        <input type="text" name="info_find" size="30" value="<%=rs("info_find")%>">
       
        
      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="msave" value="�ύ�޸�" onClick="return checkIn();">
          <input type="reset" name="Submit2" value="�ָ�ԭ��">
          <input type="button" name="home" value="�رմ���" onClick=self.close();>
        </div>
      </td>
  </table>
</form>
</body>
</html>
