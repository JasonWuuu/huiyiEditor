<% 
'��ֹSQLע��
'<!--#include file="sql.asp"-->

Query_Badword="'|;|--|/**|create |master.|select |update |user_name()|dbname()|.js|(|)|<script|select|delete|exec|decl|insert|and|exec|insert|select|delete|update|count|chr|*|chr|mid|master|truncate|char|declare" 
'���ⲿ�ݶ���get�Ƿ�����    

Form_Badword="'|;|--|/**|create |master.|select |update |user_name()|dbname()|.js|(|)|<script|select|delete|exec|decl|insert|and|exec|insert|select|delete|update|count|chr|*|chr|mid|master|truncate|char|declare"  
'���ⲿ�ݶ���post�Ƿ�����

'------���岿��  β
'On Error Resume Next

'----- �� get query ֵ �Ĺ���.
if request.QueryString<>"" then
	Chk_badword1=split(Query_Badword,"|")
	For i=0 to ubound(Chk_badword1)
		If Instr(LCase(request.QueryString),Chk_badword1(i))>0 Then
			Response.Write "Sorry!��ʹ���˷Ƿ��ַ�����*��--��**��Get"
			Response.End
		End If
	NEXT
End if

'-----�� post �� ��ֵ�Ĺ���.
if request.form<>"" then
	Chk_badword2=split(Form_Badword,"|")
	For i=0 to ubound(Chk_badword2)
		If Instr(LCase(request.Form),Chk_badword2(i))>0 Then
		        Response.Write "Sorry!��ʹ���˷Ƿ��ַ�����*��--��**��Form"
			Response.End
		End If
	NEXT
end if
%>
