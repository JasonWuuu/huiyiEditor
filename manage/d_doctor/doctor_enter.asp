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
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR WHERE NO = '" & REQUEST("NO") & "'"

		RS.Open SQL,CONN,1,1
			IF RS.RecordCount >0 THEN
				ELSE
				Response.Write("���ݿ������")
				Response.end 
			END IF
			
	%> 
<html>
<head>
<title>ҽ����Ϣ��ϸ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

<div align="center"><font color="#0000FF" class="main"><%=RS("XM")%>-��ϸ���� </font></div>


  <table width="800" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="0" align="center" cellpadding="6" bgcolor="#000000">
   
     <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
       <%=rs("xm")%>&nbsp;&nbsp;<%=rs("JCIPS")%>
   </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
       ҽ��������<%=rs("ysgs")%>
        
          </td>
    </tr>
	 
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="79%" class="main"> 
				ҽѧר����<br>
        �����س���<%=rs("zltc")%><br>
        ���з���<%=rs("kyfx")%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
		 ��������<br>
		 ������ְ��<%=rs("GJLY_RZ")%><p>
		 ���ʽ��<%=rs("GJLY_JX")%><p>
		 ѧ�����<%=rs("GJLY_XS")%><p>
         
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
       <td width="79%" class="main"> 
		 ѧ��ְ��<br>
		 ���Ҽ���<%=rs("XSZW_GJA")%><p>
		 ʡ�м���<%=rs("XSZW_SS")%><p>
		 ԺУ����<%=rs("XSZW_YX")%><p>
     ��־��ְ��<%=rs("XSZW_ZZ")%><p>  
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
     <td width="79%" class="main"> 
	   ��Ŀ�ɹ���<br>
		 <%=rs("XMCG_GJ")%><p>
		
		 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
     �������<br>
		 ���Ҽ���<%=rs("JLQK_GJA")%><p>
		 ʡ�м���<%=rs("JLQK_SS")%><p>
		 ԺУ����<%=rs("JLQK_YX")%><p>
     ������<%=rs("JLQK_QT")%><p>  
        
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      
      <td width="79%" class="main"> 
     ��Ҫ������<br>
		 ��Ҫ������<%=rs("ZYLZ")%><p>
		 ���ķ���<%=rs("LWFB")%><p>
		
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
    
      <td width="79%" class="main"> 
     ����������<%=rs("BLBW")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
        <td width="79%" class="main"> 
      ��Ҫ������ <%=rs("ZYBD")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
        <td width="79%" class="main"> 
       ���������<%=rs("SHRY")%>
        
          </td>
    </tr>
	
    <tr bgcolor="#FFFFFF"> 
      <td > 
        <div align="center"><br>
           <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>
</form>
</body>
</html>
