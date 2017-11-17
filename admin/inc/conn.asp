<%
dim conn
dim connstr
dim db
db="../data/db%db%_123456.mdb"
connstr="provider=microsoft.jet.oledb.4.0;Data Source="&Server.Mappath(db)
set conn=server.createobject("ADODB.CONNECTION")
if err then
err.clear
response.write ""
response.end
else
end if
conn.open connstr

sub CloseConn()
	conn.close
	set conn=nothing
end sub
%>