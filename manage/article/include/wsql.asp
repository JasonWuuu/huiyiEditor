<% 
'��ֹSQLע��
'<!--#include file="sql.asp"-->

'Query_Badword="'|;|--|/**|create |master.|select |update |user_name()|dbname()|.js|(|)|script|select|delete|exec|decl|insert|exec|insert|select|delete|update|truncate|declare" 
'���ⲿ�ݶ���get�Ƿ�����    

'Form_Badword="'|/**|create |master.|select |update |user_name()|dbname()|script|select|delete|exec|decl|insert|exec|insert|select|delete|update|declare"  
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
				 Response.Write "<font color=red>����ʧ��</font><p><p><hr>"
		        Response.Write "�Բ������ύ�ı��а�����<font color=red>" & Chk_badword2(i) & " </font>����"
				Response.Write "<p>��������<font color=red>" & Chk_badword2(i) & "</font>�����м�����-�ߣ��ύ�ɹ����ÿͷ��������޸Ļ���"
				Response.Write "<p>�������������ǵĿͷ�QQ:<font color=red>2850632634</font>,�����������"
			Response.End
		End If
	NEXT
end if
%>
