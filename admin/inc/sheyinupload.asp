<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body leftmargin="0" topmargin="0">
<form name="form1" method="post" action="sheyinupfile.asp?id=<%=request.QueryString("id")%>" enctype="multipart/form-data" >
<input type="hidden" name="act" value="upload" />
<input type="hidden" name="filepath" value="images" />
<table width="250" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
<tr>
   <td height="25" width="250">
     <input type="file" name="file1" style="width:200px;"  class="tx1" value="" />
	 </td>
	 <td>
	 <input type="submit" name="Submit" value="提 交" class="tx" />
	</td>
</tr>
</table>
</form>
</body>
</html>
