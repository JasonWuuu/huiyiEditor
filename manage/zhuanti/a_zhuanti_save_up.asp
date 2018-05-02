<!-- #include virtual = "/include/mylib.asp" -->

<!-- #include virtual = "/include/auth.asp" -->
<!-- #include virtual = "/include/wsql.asp" -->


<%
            
	IF REQUEST("HOME") <> "" THEN
	Response.Redirect ("default.asp")
	END IF

	set CONN = Server.CreateObject("ADODB.Connection")
    CONN.open CONNSTR,"",""  
	set RS = Server.CreateObject("ADODB.RecordSet")
	set RS1 = Server.CreateObject("ADODB.RecordSet")
	set RS2 = Server.CreateObject("ADODB.RecordSet")
	set RSLIB = Server.CreateObject("ADODB.RecordSet")
%>
<%

    
		 
		 s_class_name =  request("zt_name")
		 s_num = request("num")
		
	
			

'判断文章的相关字符
	SQL = "SELECT TOP 1 * FROM A_zhuanti WHERE zt_NAME='" & s_class_name & "' and id <> " & Request("id") & ""
		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "这个类别已经存在，请更改其他的类别名称"
			Response.End 
			END IF
		RS.Close 
	
	  	
		
	
	  				SQL = "SELECT top 1 * FROM A_zhuanti WHERE id = " & request("id") & ""
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.MoveFirst
					 	RS1("zt_NAME") = S_CLASS_NAME
	  				RS1("NUM") = S_NUM
						RS1.UpdateBatch 
	  				RS1.Close 
	  			
				SQL = "SELECT TOP 1 * FROM A_CORRE WHERE CORRE_NAME = '" & S_CLASS_NAME & "'"
				RS.Open SQL,CONN,1,1
					IF RS.RecordCount>0 THEN
					N_P_CLASS_NO = RS("P_CLASS_NO")
					N_CLASS_NO = RS("CLASS_NO")
					N_CLASS_NAME = RS("CORRE_NAME")
					N_NUM = RS("NUM")
					
					END IF
				RS.CLOSE 
%>
<html>
<head>
<title>科室类别增加成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）科室类别系统增加 </font></div>
<hr>
<form method="POST" action="a_corre_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">上级类别：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("A_CORRE",N_P_CLASS_NO,"CLASS_NO","CORRE_NAME")
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">名称：</td>
      <td width="68%" class="main"> 
         <%=N_CLASS_NAME
        %> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">显示顺序：</td>
      <td width="68%" class="main"> 
         <%=N_NUM
        %> 
      </td>
    </tr>
   
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2"> 
        <div align="center"><br>
          <input type="submit" name="add" value="继续申请">
            <input type="submit" name="home" value="返回主页">
          <input type="submit" name="search" value="进入查询">
        </div>
      </td>
  </table>
</form>
</body>
</html>
