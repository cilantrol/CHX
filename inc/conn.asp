<%
dim conn
dim connstr
dim db
db="/data/db%db%_123456.mdb"
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


Function gen_key(digits)
    Dim char_array(50)
	char_array(0) = "0"
	char_array(1) = "1"
	char_array(2) = "2"
	char_array(3) = "3"
	char_array(4) = "4"
	char_array(5) = "5"
	char_array(6) = "6"
	char_array(7) = "7"
	char_array(8) = "8"
	char_array(9) = "9"
	char_array(10) = "a"
	char_array(11) = "b"
	char_array(12) = "c"
	char_array(13) = "d"
	char_array(14) = "e"
	char_array(15) = "f"
	char_array(16) = "g"
	char_array(17) = "h"
	char_array(18) = "i"
	char_array(19) = "j"
	char_array(20) = "k"
	char_array(21) = "l"
	char_array(22) = "m"
	char_array(23) = "n"
	char_array(24) = "o"
	char_array(25) = "p"
	char_array(26) = "q"
	char_array(27) = "r"
	char_array(28) = "s"
	char_array(29) = "t"
	char_array(30) = "u"
	char_array(31) = "v"
	char_array(32) = "w"
	char_array(33) = "x"
	char_array(34) = "y"
	char_array(35) = "z"
	
	randomize
	do while len(output) < digits
	    num = char_array(Int((35 - 0 + 1) * Rnd + 0))
		output = output + num
	loop
	
	gen_key = output
End Function
%>