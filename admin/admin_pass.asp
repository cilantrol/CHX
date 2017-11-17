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
	 $('#main-nav-li1-a2').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
action = request("action")
if action = "log" then
   pwd1 = request.Form("pwd1")
   pwd2 = request.Form("pwd2")
   pwd3 = request.Form("pwd3")
   if pwd2 <> "" and pwd2 = pwd3 then
      sql = "select * from adminuser where adname = '"&session("adminuser")&"' and adpwd = '"&pwd1&"'"
	  set rs = server.CreateObject("adodb.recordset")
	  rs.open sql,conn,1,3
	  if not rs.eof then
	     rs("adpwd") = pwd2
		 rs.update
		 rs.close
		 set rs = nothing
	     Response.Write("<script>alert('修改成功！');this.location.href='admin_pass.asp';</script>")
		 Response.End()
	  else
	     Response.Write("<script>alert('旧密码不正确');this.location.href='admin_pass.asp';</script>")
		 Response.End()
	  end if
	  rs.close
	  set rs = nothing
   else
      Response.Write("<script>alert('新密码为空或与确认密码不相同');this.location.href='admin_pass.asp';</script>")
	  Response.End()
   end if 
else
%>
<body>
      <div id="body-wrapper">
      
        <!--#include file="inc/left.asp"--> 
		
		<div id="main-content">
			<!--#include file="inc/top.asp"--> 
            
			<div class="clear"></div>
            
            <div class="content-box">
				
				<div class="content-box-header">
					<h3>管理员密码</h3>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
						
						<div class="notification attention png_bg">
							<a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							<div>提示信息：請输入当前管理员的旧密码，以重新设置新密码。</div>
						</div>
                        
                        <form action="admin_pass.asp?action=log" method="post">
							<table>
								<tr>
                                     <td width="70"><label>旧密码：</label></td>
                                     <td><input class="text-input small-input" type="password" name="pwd1" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>新密码：</label></td>
                                     <td><input class="text-input small-input" type="password" name="pwd2" style="width:580px;" /></td>
                                </tr>
                                <tr>
                                     <td><label>确认密码：</label></td>
                                     <td><input class="text-input small-input" type="password" name="pwd3" style="width:580px;" /></td>
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
								
			<div id="footer" style="margin-top:240px;">
				<small>&copy;佛山市顺德区天鹰网络信息技术服务有限公司版权所有 | <a href="http://www.126jiaju.com/" target="_blank">www.126jiaju.com</a> | <a href="#">Top</a></small>
			</div>
			
		</div>
		
	</div>

</body>
<%end if%>
</html>
<!--#include file="inc/foot.asp"-->