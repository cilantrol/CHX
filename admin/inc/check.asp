<%
if session("adminuser")&"" = "" then
   response.Redirect("../")
end if
%>