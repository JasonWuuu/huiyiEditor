<!-- #include virtual = "/include/wsql.asp" -->
 <!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->

 <%
 
'���ߣ�������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ����
'���������ű��κ��˲���

	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("add") <> "" THEN
	Response.Redirect ("doctor_add.asp")
	END IF

	
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
	%> 
<html>
<head>
<title>ҽ����ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../manage/article/font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>
<script language="javascript">
function GoToURL()
{
  
  var tURL= "doctor_main.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
 // var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_main.asp?yy="+document.un.yy.value;
  document.location=tURL1;
}
</script>
<body bgcolor="white">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ������ҽ�����ݲ�ѯ </font></div>
<hr size="1">
<form method="POST" action="doctor_search.asp" name="un">
  <table width="1140" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main">��ѯ˵����</td>
      <td colspan="3" class="main">�����ѡ��������ϵͳĬ��ȫ������</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">ҽԺ��</div>
      </td>
      
    <td width="51%" class="main"> 
      <select name="hs_no"  onChange="GoToURL()">
        <option value="">ȫ��</option>
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
        <option value="<%=RS1("HS_NO")%>" selected>
	
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
        <%
		  ELSE
		  %>
		  
		   <option value="<%=RS1("HS_NO")%>" >
	
		  <%=MID(RS1("HS_NAME"),1,50)%></option>
		  <%
				END IF
				I = I + 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      
      <input type="text" name="yy" size="10">
		 <input type="button" name="yx" value="��ѯ" onClick=GoToURLA();>
      </td>
    
      
    <td width="11%" class="main"> 
      <div align="right">������</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="xm" size="30">
        </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">���ң�</div>
      </td>
      
    <td  class="main" width="51%"> 
      <select name="class_no" >
		   <option value="">����</option>
           <%
        SQL = "SELECT * FROM D_CLASS WHERE HS_NO = '" & request("hs_no") & "' ORDER BY CLASS_NAME"
        RS1.OPEN SQL,CONN,1,1
        DO WHILE NOT RS1.EOF 
        %>
        <option value="<%=RS1("CLASS_NO")%>" >
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=MID(RS1("CLASS_NAME"),1,40)%></option>
        <%
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">������</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="dq" size="20">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
     
      
    <td width="12%" class="main"> 
      <div align="right">����ַ���</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="info_corre" size="50">
		  </td>
     
    <td width="11%" class="main"> 
      <div align="right">�����ַ�����</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="info_find" size="20">
      </td>
     
    </tr>
   <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">����ְ��</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="zw" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">ѧ��ְ�� ���Ҽ���</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="xszw_gja" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">ѧ��ְ�ƣ�</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="zc" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">������ְ��</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="gjly_rz" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">�ó�����ϵͳ/��λ��</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="jbxt" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">�������ƣ�</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="jbmc" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">�����س���</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="zltc" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">ҽ�����</div>
      </td>
      
    <td width="26%" class="main"> 
      <select name="ysclass" >
		  <option value="" selected>ȫ��</option>
        <option value="��ϯ��ҽ��" > ��ϯ��ҽ��</option>
		   <option value="��ҽ��" > ��ҽ��</option>
			 <option value="�о�ѧ��" >�о�ѧ��</option>
		  </select>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">ȫ������(>=)��</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="qg_pm1" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">ȫ������(<)��</div>
      </td>
      
    <td width="26%" class="main"> 
      <input type="text" name="qg_pm2" size="20">
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     
      
    <td width="12%" class="main"> 
      <div align="right">������Ա��</div>
      </td>
      
    <td width="51%" class="main"> 
      <select name="username" >
		 <option value="">ȫ��</option>
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
		  </td>
    
      
    <td width="11%" class="main"> 
      <div align="right">�Ƿ�����Ƭ</div>
      </td>
      
    <td colspan="3" class="main" width="26%"> 
      <select name="zp" >
		  <option value="" selected>ȫ��</option>
        <option value="��" >��</option>
		   <option value="��" > ��</option>
		
		  </select>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     
      
    <td width="12%" class="main"> 
      <div align="right">�����ֶΣ�</div>
      </td>
      
    <td width="51%" class="main"> 
      <select name="pxzd" >
		 <option value="NO">ҽ�����</option>
         <option value="XM">ҽ������</option>
		 <option value="HS_NO">ҽԺ���</option>
		 <option value="CLASS_NO">���ұ��</option>
		  <option value="USER_NAME">��ʼ������</option>
		 <option value="GX_USER">������Ա</option>
		 <option value="GX_DATE">��������</option>
		 <option value="QG_PM">��������</option>
		 <option value="BJ_QG_PM">��������</option>
		 <option value="JCI_QG_PM">JCI����</option>
		 <option value="YSNR">���ݶ���</option>
        </select>
		  </td>
    
      
    <td width="11%" class="main"> 
      <div align="right">���򷽷�</div>
      </td>
      
    <td colspan="3" class="main" width="26%"> 
      <select name="pxff" >
		  <option value="">����</option>
        <option value="DESC" >����</option>
		
		  </select>
      </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
    <td width="12%" class="main"> 
      <div align="right">ҽ����ţ�</div>
      </td>
      
    <td width="51%" class="main"> 
      <input type="text" name="no" size="20">
      </td>
       
    <td width="11%" class="main"> 
      <div align="right">δ֪��</div>
      </td>
      
    <td width="26%" class="main">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4"> 
        <div align="center"><br>
          <input type="submit" name="search" value="���в�ѯ" >
          <input type="reset" name="Submit2" value="������Ϣ">
          <input type="submit" name="home" value="������ҳ">
        </div>
      </td>
  </table>
</form>
</body>
</html>