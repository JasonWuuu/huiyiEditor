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
	
	SQL = "SELECT TOP 1 * FROM D_DOCTOR_DESC WHERE id = '" & REQUEST("id") & "'"

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

<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ-��ϸ���� </font></div>
<hr>
<form method="POST" action="doctor_save_up.asp" name="un">
<input type="hidden" name="no" value="<%=Request("no")%>">
  <table width="1180" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">���ң�</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("D_CLASS",rs("class_no"),"CLASS_NO","CLASS_NAME")
        %> 
        </select>
      </td>
    </tr>
     <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
       <%=rs("xm")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main"> 
        <%=DISPLAY_NAME("HOSPTIAL",rs("hs_no"),"HS_NO","HS_NAME")
        %> 
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�����</td>
      <td width="79%" class="main"> 
        <%=rs("YSCLASS")%>
        
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <%=rs("dq")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ��</td>
      <td width="79%" class="main"> 
        <%=rs("zw")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ�ƣ�</td>
      <td width="79%" class="main"> 
       <%=rs("zch")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�ƣ�</td>
      <td width="79%" class="main"> 
      <%=rs("zc")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ���ƺţ�</td>
      <td width="79%" class="main"> 
       <%=rs("XS")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ����������</td>
      <td width="79%" class="main"> 
       <%=rs("edu_others")%>
      </td>
    </tr>
	 
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ҽ/��ҽ��</td>
      <td width="79%" class="main"> 
        <%=rs("ZYXY")%>
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����س���</td>
      <td width="79%" class="main"> 
       <%=rs("zltc")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƽ׶Σ�</td>
      <td width="79%" class="main"> 
       <%=rs("ZLJD")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���Ʒ�ʽ��</td>
      <td width="79%" class="main"> 
       <%=rs("ZLFS")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ1��</td>
      <td width="79%" class="main"> 
        <%=rs("JBXTA")%>
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ2��</td>
      <td width="79%" class="main"> 
        <%=rs("JBXTB")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ3��</td>
      <td width="79%" class="main"> 
       <%=rs("JBXTC")%>
        
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������1��</td>
      <td width="79%" class="main"> 
           <%=rs("JBMCA")%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������2��</td>
      <td width="79%" class="main"> 
         <%=rs("JBMCB")%>
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������3��</td>
      <td width="79%" class="main"> 
        <%=rs("JBMCC")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���з���</td>
      <td width="79%" class="main"> 
      <%=rs("kyfx")%>
      </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
         <%=rs("rwgs")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI������</td>
      <td width="79%" class="main"> 
          <%=rs("jcips")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ��������</td>
      <td width="79%" class="main"> 
         <%=rs("ysgs")%>
          </td>
    </tr>
	  
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹�����ְ��</td>
      <td width="79%" class="main"> 
          <%=rs("GJLY_RZ")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹��ʽ��</td>
      <td width="79%" class="main"> 
            <%=rs("GJLY_JX")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������ѧ�����</td>
      <td width="79%" class="main"> 
          <%=rs("GJLY_XS")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�񣺹��Ҽ���</td>
      <td width="79%" class="main"> 
          <%=rs("XSZW_GJA")%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ʡ�м���</td>
      <td width="79%" class="main"> 
          <%=rs("XSZW_SS")%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ԺУ����</td>
      <td width="79%" class="main"> 
         <%=rs("XSZW_YX")%>
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ����־��ְ��</td>
      <td width="79%" class="main"> 
         <%=rs("XSZW_ZZ")%>
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ŀ�ɹ���</td>
      <td width="79%" class="main"> 
         <%=rs("XMCG_GJ")%>
          </td>
    </tr>
	 	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������Ҽ���</td>
      <td width="79%" class="main"> 
          <%=rs("JLQK_GJA")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ʡ�м���</td>
      <td width="79%" class="main"> 
           <%=rs("JLQK_SS")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ԺУ����</td>
      <td width="79%" class="main"> 
            <%=rs("JLQK_YX")%>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������������</td>
      <td width="79%" class="main"> 
             <%=rs("JLQK_QT")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ��������Ҫ������</td>
      <td width="79%" class="main"> 
            <%=rs("ZYLZ")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ���������ķ���</td>
      <td width="79%" class="main"> 
           <%=rs("LWFB")%>
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������</td>
      <td width="79%" class="main"> 
         <%=rs("BLBW")%>
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ������</td>
      <td width="79%" class="main"> 
          <%=rs("ZYBD")%>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
        <%=rs("shry")%>
      </td>
    </tr>
	 	 
	  	
	 
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ѷ��Դ��</td>
      <td width="79%" class="main"> 
        <%=rs("zxly")%>
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
        <%=rs("zlly")%>
        
          </td>
    </tr>
    
	

	 
      <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����ַ�����</td>
      <td width="79%" class="main"> 
        <%=rs("info_find")%>
      </td>
    </tr>
    
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ͷ��ͼƬ��</td>
      <td width="79%" class="main"> 
		 <img src=/pic/<%=rs("zp")%><font color=red>�������ξͿ����ˣ�FTP�ϴ�������С��ͼƬ400X600�ģ�����Ϊ��</font>
       </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("qg_pm")%>
       </td>
    </tr>
	 
    
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("bj_qg_pm")%>
       </td>
    </tr>
	 
   
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <%=rs("jci_qg_pm")%>
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
