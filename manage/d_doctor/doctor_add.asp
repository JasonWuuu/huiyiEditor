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
	IF Request("hs_no") <> "" Then
	MYDQ = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",rEQUEST("HS_NO"),"HS_NO","TYPE")  
	End if
	%> 
<html>
<head>
<title>ҽ������</title>
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
  
  var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
 // var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
  document.location=tURL+tURL1;
}
</script>
<script language="javascript">
function GoToURLB()
{
  
  var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL2= "&class_no="+document.un.class_no.options[document.un.class_no.selectedIndex].value;
  var tURL3= "&ysclass="+document.un.ysclass.options[document.un.ysclass.selectedIndex].value;
  var tURL1 = "&yy="+document.un.yy.value;
  document.location=tURL+tURL1+tURL2+tURL3;
}
</script>
<script language="javascript">
function GoToURLA()
{
  
  //var tURL= "doctor_add.asp?hs_no="+document.un.hs_no.options[document.un.hs_no.selectedIndex].value;
  var tURL1 = "doctor_add.asp?yy="+document.un.yy.value;
  document.location=tURL1;
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


	
   if(confirm("������Ҫ�ύ��?"))
      return true
   else
      return false;
}
</script>
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ��������������ϵͳ���� </font></div>
<hr>
<form method="POST" action="doctor_save.asp" name="un">
  <table width="1153" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽԺ��</td>
      <td width="79%" class="main">
       <select name="hs_no"  onChange="GoToURL()">
	
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
		 <a href="/manage/hosptial/hosptial_add.asp" target="_blank">����ҽԺ</a>
          </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ң�</td>
      <td width="79%" class="main"> 
        <select name="class_no"   onChange="GoToURLB()">
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
        <option value="<%=RS1("CLASS_NO")%>"  selected>
				<%
				else
				%>
				  <option value="<%=RS1("CLASS_NO")%>" >
				<%
				end if
				%>
		  <%
		  FOR I = 2 TO RS1("JIBIE")
		  Response.Write("----")
		  NEXT
		  %>
		  <%=MID(RS1("CLASS_NAME"),1,50)%>
		  </option>
        <%
		  J= J+ 1
        RS1.MOVENEXT
        LOOP
        RS1.CLOSE
        %> 
        </select>
		   <a href="/manage/d_class/d_class_add.asp" target="_blank">���ӿ���</a>
      </td>
    </tr>
   <%
   If request("hs_no") = "" then
 	MYDQ = DISPLAY_NAME("HOSPTIAL",MY_HS_NO,"HS_NO","AREA")
  MYZYXY = DISPLAY_NAME("HOSPTIAL",MY_HS_NO,"HS_NO","TYPE")  
  End if
   %>
    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <input type="text" name="xm" size="50">
       
          </td>
    </tr>
	  
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ҽ�����</td>
      <td width="79%" class="main"> 
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
      <td width="21%" class="main">������</td>
      <td width="79%" class="main"> 
        <input type="text" name="dq" size="50" value="<%=MYDQ%>">
        
          </td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ʱ�䣺</td>
      <td width="79%" class="main"> 
        <input type="text" name="worktime" size="50" value="δ֪">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ��</td>
      <td width="79%" class="main"> 
      
        <textarea name="zw" rows="5" cols="60"><%=MYXZZW%></textarea>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ְ�ƣ�</td>
      <td width="79%" class="main"> 
	  <%
	  If Request("ysclass") = "�о�ѧ��" Then
	  %>
	   <input type="text" name="zch" size="50" value="�о�Ա">
	   <%
	   else
	   %>
        <input type="text" name="zch" size="50" value="����ҽʦ">
     <%
	 End if
	 %>   
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�ƣ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="zc" size="50" value="����">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ���ƺţ�</td>
      <td width="79%" class="main"> 
        <input type="text" name="xs" size="50"  value="��ʿ����ʦ">
        
          </td>
    </tr>
	   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ����������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="edu_others" size="46">
       </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
            <textarea name="rwgs" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCI������</td>
      <td width="79%" class="main"> 
           <textarea name="jcips" rows="10" cols="60"></textarea>
          </td>
    </tr>

	  
	 	 	
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�����س���</td>
      <td width="79%" class="main"> 
        <textarea name="zltc" rows="10" cols="60"></textarea>
      </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��ҽ/��ҽ��</td>
      <td width="79%" class="main"> 
         <select name="ZYXY" >
     <option value="<%=MYZYXY%>" selected><%=MYZYXY%></option>
        <option value="��ҽ" > ��ҽ</option>
		   <option value="��ҽ" > ��ҽ</option>
			 <option value="����ҽ���" >����ҽ���</option>
		  </select>
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���ƽ׶Σ�</td>
      <td width="79%" class="main"> 
  
        <select name="zljd" >
   <option value="����" > ����</option>
			
        <option value="���" > ���</option>
		  
		  </select>
          </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���Ʒ�ʽ��</td>
      <td width="79%" class="main"> 
        <input type="text" name="zlfs" size="50">
        
          </td>
    </tr>
	 
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ1��</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxta" size="50">
        
          </td>
    </tr>
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ2��</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxtb" size="50">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�ó�����ϵͳ/��λ3��</td>
      <td width="79%" class="main"> 
        <input type="text" name="jbxtc" size="50">
        
          </td>
    </tr>
	   
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������1��</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCA" size="50">
        
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������2��</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCB" size="50">
        
          </td>
    </tr>
	  	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������3��</td>
      <td width="79%" class="main"> 
        <input type="text" name="JBMCC" size="50">
        
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���з���</td>
      <td width="79%" class="main"> 
        <textarea name="kyfx" rows="10" cols="60"></textarea>
      </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹�����ְ��</td>
      <td width="79%" class="main"> 
             <textarea name="GJLY_RZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������򣺹��ʽ��</td>
      <td width="79%" class="main"> 
               <textarea name="GJLY_JX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��������ѧ�����</td>
      <td width="79%" class="main"> 
            <textarea name="GJLY_XS" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ�񣺹��Ҽ���</td>
      <td width="79%" class="main"> 
		<textarea name="XSZW_GJA" rows="10" cols="60"></textarea>
         
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ʡ�м���</td>
      <td width="79%" class="main"> 
		<textarea name="XSZW_SS" rows="10" cols="60"></textarea>
        
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ��ԺУ����</td>
      <td width="79%" class="main"> 
        
       <textarea name="XSZW_YX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ѧ��ְ����־��ְ��</td>
      <td width="79%" class="main"> 
      
        <textarea name="XSZW_ZZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	  	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ŀ�ɹ���</td>
      <td width="79%" class="main"> 
       
        <textarea name="XMCG_GJ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	
	  <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������Ҽ���</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_GJA" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ʡ�м���</td>
      <td width="79%" class="main"> 
       
         <textarea name="JLQK_SS" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������ԺУ����</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_YX" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">�������������</td>
      <td width="79%" class="main"> 
        
        <textarea name="JLQK_QT" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ��������Ҫ������</td>
      <td width="79%" class="main"> 
         <textarea name="ZYLZ" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ���������ķ���</td>
      <td width="79%" class="main"> 
           <textarea name="LWFB" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����������</td>
      <td width="79%" class="main"> 
           <textarea name="BLBW" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 	 	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ҫ������</td>
      <td width="79%" class="main"> 
          <textarea name="ZYBD" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	    <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">���������</td>
      <td width="79%" class="main"> 
		 <textarea name="shry" rows="10" cols="60"></textarea>
		
       </td>
    </tr>
	  
	
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">��Ѷ��Դ��</td>
      <td width="79%" class="main"> 
       
       <textarea name="zxly" rows="10" cols="60"></textarea> 
          </td>
    </tr>
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">������Դ��</td>
      <td width="79%" class="main"> 
      
         <textarea name="zlly" rows="10" cols="60"></textarea> 
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
      <td width="21%" class="main">ͷ��ͼƬ��</td>
      <td width="79%" class="main"> 
		 <input type="text" name="zp" size="16"><font color=red>�������ξͿ����ˣ�FTP�ϴ�������С��ͼƬ400X600�ģ�����Ϊ��</font>
       </td>
    </tr>

	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="qg_pm" size="46"  value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">����ȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="bj_qg_pm" size="46"  value="100000">
       </td>
    </tr>
	 
	 <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">JCIȫ��������</td>
      <td width="79%" class="main"> 
		 <input type="text" name="jci_qg_pm" size="46"  value="100000">
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
