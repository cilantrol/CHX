<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Videoupload_5xsoft.inc"-->
<!--#include file="aspjpeg.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<head>
<title>文件上传</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<%
dim arr(3)
dim upload,file,formName,formPath,iCount,filename,fileExt,i
set upload=new upload_5xSoft ''建立上传对象
						
formPath = "/upload/"
id = request.QueryString("id")
show = request.QueryString("show")


''列出所有上传了的文件
for each formName in upload.file
    set file = upload.file(formName)
	if file.filesize > 0 then
        if file.filesize > 512000 then
		    response.write "<font size=2>图片大小超过了500K限制[<a href=# onclick=history.go(-1)>重新上传</a>]</font>"
		    response.end
        end if
		
		fileExt = lcase(right(file.filename,4))
		if fileExt = "jpeg" then fileExt = ".jpeg"
        uploadsuc = false
        Forum_upload="gif,jpg,png,jpeg"
        Forumupload = split(Forum_upload,",")
        for i = 0 to ubound(Forumupload)
            if fileEXT = "." & trim(Forumupload(i)) then
                uploadsuc = true
                exit for
            else
                uploadsuc = false
            end if
        next

        if uploadsuc = false then
            response.write "<font size=2>文件格式限制[<a href=# onclick=history.go(-1)>请重新上传</a>]</font>"
            response.end
        end if
	end if
						
	filename = year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
	filename = replace(filename,"as","")
    filename = replace(filename,"sp","")
    filename = replace(filename,"asp","")
	
	bigfile = filename&fileExt
	smallfile = filename&"_s"&fileExt
	
	bigfile_save = formPath&bigfile
	smallfile_save = formPath&smallfile
	
    if file.FileSize > 0 then         ''如果 FileSize > 0 说明有文件数据
        file.SaveAs Server.mappath(bigfile_save)   ''保存文件
    end if
	
    set file = nothing
next
set upload = nothing

Response.Write "<SCRIPT>parent.form1."&id&".value = '"&bigfile&"';</SCRIPT>"
Response.Write "<font style='font-family: 宋体; font-size: 9pt'>上传成功 [ <a style='cursor:pointer;' onclick=history.go(-1)>成功上传</a> ]</font>"
%>
</body>
</html>