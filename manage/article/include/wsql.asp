<% 
'防止SQL注入
'<!--#include file="sql.asp"-->

'Query_Badword="'|;|--|/**|create |master.|select |update |user_name()|dbname()|.js|(|)|script|select|delete|exec|decl|insert|exec|insert|select|delete|update|truncate|declare" 
'在这部份定义get非法参数    

'Form_Badword="'|/**|create |master.|select |update |user_name()|dbname()|script|select|delete|exec|decl|insert|exec|insert|select|delete|update|declare"  
'在这部份定义post非法参数

'------定义部份  尾
'On Error Resume Next

'----- 对 get query 值 的过滤.
if request.QueryString<>"" then
	Chk_badword1=split(Query_Badword,"|")
	For i=0 to ubound(Chk_badword1)
		If Instr(LCase(request.QueryString),Chk_badword1(i))>0 Then
			Response.Write "Sorry!您使用了非法字符！（*，--，**）Get"
			Response.End
		End If
	NEXT
End if

'-----对 post 表 单值的过滤.
if request.form<>"" then
	Chk_badword2=split(Form_Badword,"|")
	For i=0 to ubound(Chk_badword2)
		If Instr(LCase(request.Form),Chk_badword2(i))>0 Then
				 Response.Write "<font color=red>报名失败</font><p><p><hr>"
		        Response.Write "对不起，您提交的表单中包含：<font color=red>" & Chk_badword2(i) & " </font>单词"
				Response.Write "<p>请您将：<font color=red>" & Chk_badword2(i) & "</font>单词中间增加-线，提交成功后让客服帮助您修改回来"
				Response.Write "<p>有问题增加我们的客服QQ:<font color=red>2850632634</font>,帮助您解决！"
			Response.End
		End If
	NEXT
end if
%>
