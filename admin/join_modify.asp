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
   response.Redirect("join_modify.asp?id=1")
end if
%>
<script type="text/javascript">
$(document).ready(function(){
	 $('#main-nav-li5 > a').addClass("current"); 
	 $('#main-nav-li5-a<%=id%>').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
action = request("action")
if action = "log" then
   content1_cn = replace(Request.Form("content1_cn"),"'","")
   content2_cn = replace(Request.Form("content2_cn"),"'","")
   
   content1_en = replace(Request.Form("content1_en"),"'","")
   content2_en = replace(Request.Form("content2_en"),"'","")
   
   sql = "select * from [products] where id = " & id
   set rs = server.CreateObject("adodb.recordset")
   rs.open sql,conn,1,3
   if not rs.eof then
	  rs("content1_cn") = content1_cn
	  rs("content2_cn") = content2_cn
	  rs("content1_en") = content1_en
	  rs("content2_en") = content2_en
	  rs.update
   end if
   rs.close
   set rs = nothing
   response.Write("<script>alert('修改成功');this.location.href='join_modify.asp?id="&id&"';</script>")
   response.End()
else
   sql = "select * from [products] where id = " & id
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
					<h3><%=rs("title_cn")%></h3>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
						
						<div class="notification attention png_bg">
							<a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							<div>提示信息：請输入中英內容，以重新提交修改。</div>
						</div>
                        
                        <form action="join_modify.asp?action=log&id=<%=id%>" method="post">
							<table width="100%">
                                <tr style="display:none;">
                                     <td width="80"><label>中文内容1：</label></td>
                                     <td>
                                     <input type="hidden" name="content1_cn" id="content1_cn" value="<%= Server.htmlencode(rs("content1_cn")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content1_cn" frameborder="0" scrolling="no" width="99%" height="270"></iframe>
									 </td>
                                </tr>
                                <tr style="display:none;">
                                     <td><label>中文内容2：</label></td>
                                     <td>
                                     <input type="hidden" name="content2_cn" id="content2_cn" value="<%= Server.htmlencode(rs("content2_cn")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content2_cn" frameborder="0" scrolling="no" width="99%" height="300"></iframe>
									 </td>
                                </tr>
                                <tr>
                                     <td  width="80"><label>英文内容1：</label></td>
                                     <td>
                                     <input type="hidden" name="content1_en" id="content1_en" value="<%= Server.htmlencode(rs("content1_en")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content1_en" frameborder="0" scrolling="no" width="99%" height="270"></iframe>
									 </td>
                                </tr>
                                <tr>
                                     <td><label>英文内容2：</label></td>
                                     <td>
                                     <input type="hidden" name="content2_en" id="content2_en" value="<%= Server.htmlencode(rs("content2_en")&"") %>">
                                     <iframe id="eWebEditor1" src="/Web_Editor/ewebeditor.htm?id=content2_en" frameborder="0" scrolling="no" width="99%" height="300"></iframe>
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