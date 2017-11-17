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
<script type="text/javascript">
$(document).ready(function(){
	 $('#main-nav-li1 > a').addClass("current"); 
	 $('#main-nav-li1-a1').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
action = request("action")
if action = "log" then
   web_title = request.Form("web_title")
   web_title_en = request.Form("web_title_en")
   web_keyword = request.Form("web_keyword")
   web_keyword_en = request.Form("web_keyword_en")
   web_description = request.Form("web_description")
   web_description_en = request.Form("web_description_en")
   web_foot1 = request.Form("web_foot1")
   web_foot1_en = request.Form("web_foot1_en")
   web_foot2 = request.Form("web_foot2")
   web_foot3 = request.Form("web_foot3")
   sql = "select * from webconfig where id = 1"
   set rs = server.CreateObject("adodb.recordset")
   rs.open sql,conn,1,3
   if not rs.eof then
      rs("web_title") = web_title
	  rs("web_title_en") = web_title_en
	  rs("web_keyword") = web_keyword
	  rs("web_keyword_en") = web_keyword_en
	  rs("web_description") = web_description
	  rs("web_description_en") = web_description_en
	  rs("web_foot1") = web_foot1
	  rs("web_foot1_en") = web_foot1_en
	  rs("web_foot2") = web_foot2
	  rs("web_foot3") = web_foot3
	  rs.update
   end if
   rs.close
   set rs = nothing
   response.Write("<script>alert('修改成功');this.location.href='webconfig.asp';</script>")
   response.End()
else
   sql = "select * from webconfig where id = 1"
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
					<h3>网站公共信息</h3>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
						
						<div class="notification attention png_bg">
							<a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							<div>提示信息：修改&lt;title&gt;标签&lt;meta&gt;标签，以改变网站标题、关键字和描述。</div>
						</div>
                        
                        <form action="webconfig.asp?action=log" method="post">
							<table>
                                <tr>
                                     <td><label>中文标题：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_title" value="<%=rs("web_title")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>中文关键字：</label></td>
                                     <td><textarea class="text-input textarea wysiwyg" name="web_keyword" style="width:580px; height:42px;" ><%=rs("web_keyword")%></textarea></td>
                                </tr>
                                <tr>
                                     <td><label>中文描述：</label></td>
                                     <td><textarea class="text-input textarea wysiwyg" name="web_description" style="width:580px; height:42px;" ><%=rs("web_description")%></textarea></td>
                                </tr>
                                <tr>
                                     <td><label>英文标题：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_title_en" value="<%=rs("web_title_en")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>英文关键字：</label></td>
                                     <td><textarea class="text-input textarea wysiwyg" name="web_keyword_en" style="width:580px; height:42px;" ><%=rs("web_keyword_en")%></textarea></td>
                                </tr>
                                <tr>
                                     <td><label>英文描述：</label></td>
                                     <td><textarea class="text-input textarea wysiwyg" name="web_description_en" style="width:580px; height:42px;" ><%=rs("web_description_en")%></textarea></td>
                                </tr>
                                <tr>
                                     <td><label>中文底部地址：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_foot1" value="<%=rs("web_foot1")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>英文底部地址：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_foot1_en" value="<%=rs("web_foot1_en")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>底部电话：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_foot2" value="<%=rs("web_foot2")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>底部邮箱：</label></td>
                                     <td><input class="text-input small-input" type="text" name="web_foot3" value="<%=rs("web_foot3")%>" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td></td>
                                     <td style="padding-top:5px;"><input class="button" type="submit" value="提交修改" /></td>
                                </tr>
							</table>
							<div class="clear"></div>
							
						</form>
						
					</div> <!-- End #tab1 -->
					
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