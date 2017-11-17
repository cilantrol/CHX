<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/check.asp"-->
<!--#include file="inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>管理员后台</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />	
<script type="text/javascript" src="js/jquery.min.js"></script>
<%
id = request.QueryString("id")
if id&"" = "" then
   response.Redirect("about_modify.asp?id=1")
end if
%>
<script type="text/javascript">
$(document).ready(function(){
	 $('#main-nav-li2 > a').addClass("current"); 
	 $('#main-nav-li2-a<%=id%>').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
action = request("action")
if action = "log" then
   content = replace(Request.Form("content"),"'","")
   content_en = replace(Request.Form("content_en"),"'","")
   sql = "select * from about where id = " & id
   set rs = server.CreateObject("adodb.recordset")
   rs.open sql,conn,1,3
   if not rs.eof then
	  rs("content") = content
	  rs("content_en") = content_en
	  rs.update
   end if
   rs.close
   set rs = nothing
   response.Write("<script>alert('修改成功');this.location.href='about_modify.asp?id="&id&"';</script>")
   response.End()
else
   sql = "select * from about where id = " & id
   set rs = server.CreateObject("adodb.recordset")
   rs.open sql,conn,1,1
   if not rs.eof then
%>
<body>
      <div id="body-wrapper">
      
        <!--#include file="inc/left.asp"--> 
		
		<div id="main-content">
			<!--#include file="inc/top.asp"--> 
            
			<div class="clear"></div>
            
            <div class="content-box">
				
				<div class="content-box-header">
					<h3><%=rs("title")%></h3>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
						
						<div class="notification attention png_bg">
							<a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							<div>提示信息：請输入中英內容，以重新提交修改。</div>
						</div>
                        
                        <form action="about_modify.asp?action=log&id=<%=id%>" method="post">
							<table width="100%">
                                <tr style=" display:none;">
                                     <td width="70"><label>中文内容：</label></td>
                                     <td>
                                     <input type="hidden" name="content" id="content" value="<%= Server.htmlencode(rs("content")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content" frameborder="0" scrolling="no" width="99%" height="300"></iframe>
									 </td>
                                </tr>
                                <tr>
                                     <td width="70"><label>英文内容：</label></td>
                                     <td>
                                     <input type="hidden" name="content_en" id="content_en" value="<%= Server.htmlencode(rs("content_en")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content_en" frameborder="0" scrolling="no" width="99%" height="300"></iframe>
									 </td>
                                </tr>
                                <tr>
                                     <td></td>
                                     <td style="padding-top:5px;"><input class="button" type="submit" value="提交修改" /></td>
                                </tr>
							</table>
							<div class="clear"></div>
							
						</form>
						
					</div>
					
				</div> 
				
			</div> 
								
			<div id="footer">
				<small>&copy;佛山市顺德区天鹰网络信息技术服务有限公司版权所有 | <a href="http://www.126jiaju.com/" target="_blank">www.126jiaju.com</a> | <a href="#">Top</a></small>
			</div>
			
		</div>
		
	</div>

</body>
<%
   end if
   rs.close
   set rs = nothing
end if
%>
</html>
<!--#include file="inc/foot.asp"-->