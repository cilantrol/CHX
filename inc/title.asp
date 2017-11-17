<%
sql = "select * from webconfig where id = 1"
set rs = server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
   web_title = rs("web_title_en")
   web_keyword = rs("web_keyword_en")
   web_description = rs("web_description_en")
   web_foot1 = rs("web_foot1_en")
   web_foot2 = rs("web_foot2")
   web_foot3 = rs("web_foot3")
end if
rs.close
set rs = nothing
%>