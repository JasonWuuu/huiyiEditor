<!-- #include virtual = "/include/mylib.asp" -->
 
<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%

'���ߣ������  �� 2002-4-21 ��д
'���ܣ����µĲ�ѯ���
'���������ű��κ��˲�����ԭ�������Լ�ɾ���Լ��ļ�¼

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RSlib = Server.CreateObject("ADODB.RecordSet")
		IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF
	IF REQUEST("ADD") <> "" THEN
	Response.Redirect ("zb_add.asp")
	END IF
	%> 
<%
DIM LK(20)

IF REQUEST("DEL") <> "" THEN
	
	CAOZUO = TRIM(REQUEST("CAOZUO"))
	POP = INSTR(CAOZUO,",")
		I = 0
		WHILE POP >0
			LK(I) = TRIM(MID(CAOZUO,1,POP-1))
			CAOZUO = TRIM(MID(CAOZUO,POP+1))
			POP=INSTR(CAOZUO,",")
			I = I + 1
		WEND
		LK(I)=TRIM(MID(CAOZUO,1))
	FOR J = 0 TO I
		
	  SQL = "SELECT * FROM D_BODYREPORT WHERE NO = '" & LK(J) & "' "
	  	RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
				SQL = "DELETE FROM D_BODYREPORT WHERE NO = '" & LK(J) & "'"
				CONN.Execute(SQL)
			END IF
		RS.Close 
	
	NEXT
END IF
'��ѯ

	IF REQUEST("zbmc") <> "" THEN
	MYB = " AND zbmc  LIKE '%" & REQUEST("zbmc") & "%' "
	END IF
	IF REQUEST("dyjb") <> "" THEN
	MYC = " AND dyjb  '%" & REQUEST("dyjb") & "%' "
	END IF
	IF REQUEST("username") <> "" THEN
	MYd = " AND USER_NAME LIKE  '%" & REQUEST("username") & "%' "
	END If
	IF REQUEST("cjZb") <> "" THEN
	MYe = " AND cjZb LIKE '%" & REQUEST("cjZb") & "%' "
	END IF
	SQL = "SELECT  * FROM D_BODYREPORT WHERE NO <> ''  " & MYA & MYB & MYC & " ORDER BY ZBMC"


RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
	IF RS.RecordCount >0 THEN
	RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				IF REQUEST("PageNo") = "" THEN
				PageNo = Request("PageNo")
				
				if PageNo <> "" Then
					
				else
					PageNo=1
				
				End if
				ELSE
				PageNo = Request("PageNo1")
				END IF
			
				
				
%>

<html>
<head>
<title>ҽ�����ϲ�ѯϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<style type="text/css">
<!--
.main {  font-size: 9pt}
-->
</style>
<script language="javascript">
var lsdz = "";
function checkIn()
{    
   if(confirm("���������Ҫɾ����ѡ��ļ�¼��?"))
      return true
   else
      return false;
}
</script>
<p align="center" class="main">�ڲ���������ϵͳ���ݣ�ÿҳ20����¼�� 
<form method="post" action="zb_search.asp" name="un">
   <input type=hidden name="zbmc" value="<%=REQUEST("zbmc")%>">
  <input type=hidden name="dyjb" value="<%=REQUEST("dyjb")%>">

<table width="1200" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
  <tr bgcolor="#CCCCCC"> 
      
    <td width="4%"> 
      <div align="center"><font color="#0000FF">ɾ��</font></div>
      </td>
      
    <td width="3%"><font color="#0000FF">�޸�</font></td>
      
      
    <td width="6%"><font color="#0000FF">ָ������</font></td>
      
    <td width="19%"> 
      <div align="center"><font color="#0000FF">ָ�굥λ</font></div>
      </td>
		
    <td width="7%"> 
      <div align="center"><font color="#0000FF">ָ������</font></div>
      </td>
      
    <td width="8%"> 
      <div align="center"><font color="#0000FF">ָ������</font></div>
      </td>
      <td width="8%"> 
      <div align="center"><font color="#0000FF">��Ӧ����</font></div>
      </td>
    <td width="8%"> 
      <div align="center"><font color="#0000FF">����</font></div>
      </td>
    </tr>
    <%
		'�ж���ʾ����ҳ��
			RS.MoveLast 
			RECO=RS.RecordCount 
			AA = RECO MOD 20
			IF AA = 0 THEN
			PAGE = INT(RECO/20)
			ELSE
			PAGE = INT(RECO/20)+1
			END IF
			RS.MoveFirst 
				'��λҳ��
				PageNo = Request("PageNo")
				if PageNo <> "" Then
				
				else
					PageNo=1
				
				End if
			RS.PageSize = 20	'ÿҳһ10��
			RS.AbsolutePage = PageNo
		RowCount = RS.PageSize
		Do While Not RS.EOF and RowCount > 0 
		
    %> 
    <tr bgcolor="#FFFFFF"> 
      
    <td width="4%" height="34"> 
      <div align="center"> 
          <input type="checkbox" name="caozuo" value=<%=RS("no")%>>
          &nbsp; </div>
      </td>
      
    <td width="3%" height="34"> <a href="zb_modi.asp?no=<%=RS("no")%>" target="_blank">Go!</a> 
      &nbsp; </td>
         
    <td width="6%" height="34">  <a href="zb_detail.asp?no=<%=RS("no")%>" target="_blank"><%=rs("zbmc")
      %> </a> </td>
      
    <td width="19%" height="34"> 
      <div align="center"><%=rs("zbdw")%></div>
      </td>
		 
    <td width="7%" height="34"> 
      <div align="center"> <%=RS("zbsx")%> </div>
      </td>
      
    <td width="8%" height="34"> 
      <div align="center"> <%=RS("zbxx")%></div>
      </td>
		 
    <td width="10%" height="34"> 
      <div align="center"> <%=RS("dyjb")%></div>
      </td>
    	<td width="10%" height="34"> 
      <div align="center"> <%=RS("cjzb")%></div>
      </td>
       </tr>
    <%
			RS.MoveNext
			RowCount = RowCount - 1
			Loop
			RS.Close 
			%> 
  </table>


  <table width="740" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000" class="main">
    <tr bgcolor="#FFFFFF"> 
      <td width="10%"> 
        <div align="center"><font color="#000000">�ܼƣ�</font></div>
      </td>
      <td width="11%"><font color="#000000"><font color=red><%=PAGE%></font>ҳ</font></td>
      <td width="11%"> 
        <div align="center">��ǰ<font color=red><%=PageNo%></font>ҳ</div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Home" value="��ҳ">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="submit" name="Del" value="ɾ��" onClick="return checkIn();">
          </font></div>
      </td>
      <td width="8%"> 
        <div align="center"> <font color="#000000"> 
          <input type="button" name="Button" value="����" onClick=history.back()>
          </font></div>
      </td>
      <td width="20%"> 
        <div align="center"><font color="#000000">��ʾ 
          <input type="text" name="PageNo" size="4" maxlength="6">
          ҳ 
          <input type="submit" name="Search" value="Go">
          </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) >1 THEN
                %><a href="zb_search.asp?zbmc=<%request("zbmc")%>&dyjb=<%request("dyjb")%>&PageNo=<%=PageNo-1%>&search=all">��һҳ 
          </a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
      <td width="12%"> 
        <div align="center"> <font color="#000000"><%
                IF INT(PageNo) <INT(PAGE) AND INT(PageNo+1) <=INT(PAGE) THEN
                %><a href="zb_search.asp?zbmc=<%request("zbmc")%>&dyjb=<%request("dyjb")%>&PageNo=<%=PageNo+1%>&search=all"> 
          ��һҳ</a> <%
                ELSE
                %> ��һҳ <%
                END IF
                %> </font></div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
ELSE
%>
<html>
<head>
<title>û�в�ѯ����¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<p>û�в�ѯ����¼</p>
<p><input type=button name=back value="����" onclick=history.back();></p>
</body>
<%
END IF

%>
