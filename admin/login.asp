<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>登录管理员后台</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/invalid.css" type="text/css" media="screen" />	
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
action = request("action")
if action = "log" then
   if session("adminuser")&"" <> "" then
       Response.Write("<script>alert('您已经登录');this.location.href='index.asp';</script>")
	   Response.End()
   else
       uaer = request("username")
	   pwd = request("pwd")
	   sql = "select * from adminuser where adname = '"&uaer&"' and adpwd = '"&pwd&"'"
	   set rs = server.CreateObject("adodb.recordset")
	   rs.open sql,conn,1,1
	   if not rs.eof or not rs.bof then
	       session("adminuser") = uaer
		   Response.Redirect("index.asp")
	   else
	       Response.Write("<script>alert('用户名或密码错误');this.location.href='login.asp';</script>")
		   Response.End()
	   end if
	   rs.close
	   set rs = nothing
   end if
else
%>
<body id="login">
      <div id="login-wrapper" class="png_bg">
			<div id="login-top"><img id="logo" src="images/logo.png" /></div>
			
			<div id="login-content">
				
				<form id="form1" action="login.asp?action=log" method="post">
				
					<div class="notification information png_bg">
						<div>请输入用户名和密码。</div>
					</div>
					
					<p>
						<label>用户：</label>
						<input class="text-input" type="text" name="username" />
					</p>
					<div class="clear"></div>
					<p>
						<label>密码：</label>
						<input class="text-input" type="password" name="pwd" />
					</p>
					<div class="clear"></div>
					<p>
						<input class="button" type="submit" value="登   录" />
					</p>
					
				</form>
			</div>
			
		</div>
</body>
<%end if%>
</html>
<!--#include file="inc/foot.asp"-->