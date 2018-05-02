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

    
		 P_CLASS_NO = request("class_no")
		 s_class_name =  request("class_name")
		 s_num = request("num")
		 s_icon = request("icon")
	
			

'判断文章的相关字符
	SQL = "SELECT TOP 1 * FROM A_CLASS WHERE CLASS_NAME='" & s_class_name & "'"
		RS.Open SQL,CONN,adOpenKeyset ,adLockReadOnly
			IF RS.RecordCount >0 THEN
			Response.Write "这个类别已经存在，请更改其他的类别名称"
			Response.End 
			END IF
		RS.Close 
	
	  	
			IF P_CLASS_NO = "000" THEN
			P_CLASS_NO = "A" & id_name("CLASS_A")
			S_CLASS_NO = P_CLASS_NO
			JIBIE = 1
			ELSE
				SELECT CASE MID(RIGHT(request("class_no"),3),1,1)
					CASE "1"
					  p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & "B" & id_name("CLASS_B")
						JIBIE = 2
					CASE "2"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & "C" & id_name("CLASS_C")
						JIBIE = 3
					CASE "3"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & id_name("CLASS_D")
						JIBIE = 4
					CASE "4"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & id_name("CLASS_E")
						JIBIE = 5
					CASE "5"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & id_name("CLASS_F")
						JIBIE = 6
					CASE "6"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & id_name("CLASS_G")
						JIBIE = 7
					CASE "7"
						p_class_no = request("class_no")
						S_CLASS_NO = p_class_no & id_name("CLASS_H")
						JIBIE = 8
				END SELECT
					
			END IF
			
	
	  				SQL = "SELECT top 1 * FROM A_CLASS"
	  				RS1.Open SQL,CONN,adOpenKeyset ,adLockOptimistic 
	  				RS1.AddNew 
					  RS1("P_CLASS_NO") = p_class_no
	  				RS1("CLASS_NO") = S_CLASS_NO
	  				RS1("CLASS_NAME") = S_CLASS_NAME
	  				RS1("NUM") = S_NUM
					RS1("ICON") = S_ICON
						RS1("JIBIE") = JIBIE
	  				RS1.UpdateBatch 
	  				RS1.Close 
	  			
				SQL = "SELECT TOP 1 * FROM A_CLASS WHERE CLASS_NAME = '" & S_CLASS_NAME & "'"
				RS.Open SQL,CONN,1,1
					IF RS.RecordCount>0 THEN
					N_P_CLASS_NO = RS("P_CLASS_NO")
					N_CLASS_NO = RS("CLASS_NO")
					N_CLASS_NAME = RS("CLASS_NAME")
					N_NUM = RS("NUM")
					N_ICON = RS("ICON")
					END IF
				RS.CLOSE 
%>
<html>
<head>
<title>内容与文章类别增加成功</title>
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
<div align="center"><font color="#0000FF" class="main">（内部资料系统管理）内容与文章类别系统增加 </font></div>
<hr>
<form method="POST" action="a_class_main.asp" name="un" >
  <table width="580" border="0" bordercolordark="#99CCFF" bordercolorlight="#99CCFF" cellspacing="1" align="center" cellpadding="6" bgcolor="#000000">
    <tr bgcolor="#FFFFFF"> 
      <td width="32%" class="main">上级类别：</td>
      <td width="68%" class="main"> 
          <%=DISPLAY_NAME("A_CLASS",N_P_CLASS_NO,"CLASS_NO","CLASS_NAME")
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
      <td width="32%" class="main">类别图标：</td>
      <td width="68%" class="main"> 
         <%=N_ICON
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
