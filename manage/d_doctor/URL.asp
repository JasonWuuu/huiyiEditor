<%
Function getHTTPPage(url) 
On Error Resume Next
dim http 
set http=Server.createobject("Microsoft.XMLHTTP") 
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"GB2312")
set http=nothing
If Err.number<>0 then 
Response.Write "<p align='center'><font color='red'><b>服务器获取文件内容出错</b></font></p>" 
Err.Clear
End If  
End Function

Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function
response.write getHTTPPage("https://www.guahao.com/search?q=安锐&searchType=search")
%>