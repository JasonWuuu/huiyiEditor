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
	SQL = "SELECT TOP 1 * FROM D_BODYREPORT WHERE NO = '" & REQUEST("NO") & "'"
		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
			
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
	%> 
<html>
<head>
<title>���ָ����ϸ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ��ϸ���� </font></div>
<hr>
>
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ƣ�</td>
      <td width="79%" class="main"> 
        <%=rs("zbmc")%>
       
          </td>
    </tr>
	  
	 	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�굥λ��</td>
      <td width="79%" class="main"> 
        <%=rs("zbdw")%>
       
          </td>
    </tr>
	  
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
       <%=rs("zbsx")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�����ޣ�</td>
      <td width="79%" class="main"> 
     <%=rs("zbxx")%>
        
          </td>
    </tr>
	  
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�������</td>
      <td width="79%" class="main"> 
           <%=rs("zbgs")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
       <%=rs("zbpgyy")%>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ��ƫ��ԭ��</td>
      <td width="79%" class="main"> 
       <%=rs("zbpdyy")%>
      </td>
    </tr>
	  
	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ָ�겹��˵����</td>
      <td width="79%" class="main"> 
   <%=rs("ZBBCSM")%>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ӧ��������-�ֿ�����</td>
      <td width="79%" class="main"> 
        <%=rs("dyjb")%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
