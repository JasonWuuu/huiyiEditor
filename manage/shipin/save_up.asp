<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
   
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("search") <> "" THEN
	Response.Redirect ("article_main.asp")
	END IF
	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		
					'���Ӽ�¼
	  		
	  				SQL = "SELECT top 1 * FROM SHIPIN WHERE ID=" & REQUEST("ID") & ""
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
	  				
	  				RS1("URL") = Request("url")
	  				
						RS1.UpdateBatch 
	  				RS1.Close 
	  				
%>
<html>
<head>
<title>��ҳ��Ƶ����-�����������޸ĳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="font.css">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="white">
<div align="center"><font color="#0000FF" class="main">���ڲ�����ϵͳ������ҳ��Ƶ����-����������ϵͳ�޸� </font></div>
<hr>

  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
   <tr bgcolor="#FFFFFF"> 
      <td width="21%" class="main">λ�ã�</td>
      <td width="79%" class="main">
        <%
		  SELECT CASE Request("WZ")
					CASE "Z"
						Response.Write("���")
					CASE "Y"
						Response.Write("�ұ�")
			END SELECT
		  %>
      
          </td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">��Ƶ��ַ��</td>
      <td width="68%" class="main">
      <%=Request("url")%>
       </td>
    </tr>
   
    </tr>
      <tr bgcolor="#FFFFFF">
      <td width="32%" class="main">ͼƬ���ƣ�</td>
      <td width="68%" class="main">
      <img src="http://img.huiyi.net/pic/sp<%=Request("id")%>.jpg">
        
      </td>
    </tr>
    
   
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="button" name="add" value="�رմ���" onclick=self.close();> 
        </div>
      </td>
  </table>

</body>
</html>
