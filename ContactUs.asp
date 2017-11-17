<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/title.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=web_title%></title>
<meta name="keywords" content="<%=web_keyword%>" />
<meta name="description" content="<%=web_description%>" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/pro.js"></script>
<script language="javascript">
<!--
function form_onsubmit(){
    var Company = $("#Company").val();
	var Phone = $("#Phone").val();
	var Email = $("#Email").val();
	var Subject = $("#Subject").val();
	var Message = $("#Message").val();
	var VCode = $("#VCode").val();
	
	if(Company == ""){
	    alert("Please enter the name of the company!");
		$("#Company").focus();
		return false;
	}
	
	if(Phone == ""){
	    alert("Please enter the phone!");
		$("#Phone").focus();
		return false;
	}
	
	if(Email == ""){
	    alert("Please enter the email!");
		$("#Email").focus();
		return false;
	}
	
	if(Subject == ""){
	    alert("Please enter the Subject!");
		$("#Subject").focus();
		return false;
	}
	
	if(Message == ""){
	    alert("Please input message content!");
		$("#Message").focus();
		return false;
	}
	
	if(VCode == ""){
	    alert("Please enter the verification code!");
		$("#VCode").focus();
		return false;
	}
	
	return true;
}
// -->
</script>
<%
action = request("action")
if action = "log" then
    VCode = request.Form("VCode")
    If VCode <> CStr(Session("validateCode"))  Then 
        Response.Write"<script>alert(""The verification code is incorrect. Please re-enter it!"");location.href=""ContactUs.asp"";</script>"
        Response.end
    End If
   
    Company = request.Form("Company")
    Phone = request.Form("Phone")
    Email = request.Form("Email")
    Subject = request.Form("Subject")
    Message = request.Form("Message")
    set rs = server.CreateObject("adodb.recordset")
    sql = "select * from [message]"
    rs.open sql,conn,1,3
    rs.addnew
        rs("Company") = Company
	    rs("Phone") = Phone
	    rs("Email") = Email
	    rs("Subject") = Subject
	    rs("Message") = Message
	    rs("addtime")= now()
    rs.update
    rs.close
    set rs = nothing
   
    response.Write("<script>alert('Message success！');javascript:this.location.href='ContactUs.asp';</script>")
    response.End()
end if
%>
</head>

<body>
<!--#include file="inc/top.asp"-->

<!--#include file="inc/head.asp"-->

<div class="banner_3"></div>

<div class="positionbg">
    <div id="position" class="wrap">
        <span class="pagetitle">JINYI</span>
        <a href="/">Home</a>&nbsp;&gt;&nbsp;<a class="last" href="ContactUs.asp">Contact Us</a>
    </div>
</div>

<div  style="background:url(/img/indaboutus.jpg) no-repeat center 320px;">
<div class="wrap" style="position:relative; ">
    <div class="leftside">
        <div class="leftmenu">
            <div class="item"><a href="ContactUs.asp#contact">Contact Us</a></div>
            <div class="item"><a href="ContactUs.asp#about">About Us</a></div>
            <div class="item"><a href="ContactUs.asp#feedback">FEEDBACK</a></div>
        </div>
    </div>
    
    <div class="rightside fr" style="width:900px;">
        <div class="description">
            <a name="contact"></a>
            <h1 style="color:#F00;">Contact Us</h1>
            <%
			sql = "select * from contact where id = 1"
			set rs = server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
			    response.Write(rs("content_en"))
			end if
			rs.close
			set rs = nothing
			%>
            
            <div style=" padding:50px 0;">
            <a name="about"></a>
            <h1 style="color:#F00; padding-top:20px;">About Us</h1>
            <%
			sql = "select * from about where id = 1"
			set rs = server.CreateObject("adodb.recordset")
			rs.open sql,conn,1,1
			if not rs.eof then
			    response.Write(rs("content_en"))
			end if
			rs.close
			set rs = nothing
			%>
            </div>
            
            <a name="feedback"></a>
            <h1 style="color:#F00; padding-top:20px;">FEEDBACK</h1>
            <div class="desc_text">
                <div id="lib_feedback_form">
                    <form name="feedback" action="ContactUs.asp?action=log" method="post" onsubmit="return form_onsubmit();">
                    <div class="rows">
                        <label>Company: <font class='fc_red'>*</font></label>
                        <span><input name="Company" id="Company" type="text" class="input" size="30" maxlength="100" /></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>Phone: <font class='fc_red'>*</font></label>
                        <span><input name="Phone" id="Phone" type="text" class="input" size="30" maxlength="20"  /></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>Email: <font class='fc_red'>*</font></label>
                        <span><input name="Email" id="Email" type="text" class="input" size="30" maxlength="100" format="Email" /></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>Subject: <font class='fc_red'>*</font></label>
                        <span><input name="Subject" id="Subject" type="text" class="input" size="50" maxlength="50" /></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>Message: <font class='fc_red'>*</font></label>
                        <span><textarea name="Message" id="Message" class="form_area contents"></textarea></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label>Code: <font class='fc_red'>*</font></label>
                        <span><input name="VCode" id="VCode" type="text" class="input vcode" size="4" maxlength="4" /> <img src="/inc/checkcode.asp " title="点击刷新验证码?"  onClick="this.src='/inc/checkcode.asp?t='+(new Date().getTime());" /></span>
                        <div class="clear"></div>
                    </div>
                    <div class="rows">
                        <label></label>
                        <span><input name="Submit" type="submit" class="form_button" value="Submit" /></span>
                        <div class="clear"></div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        
        <div class="clear"></div>
    </div>
</div>
</div>

<!--#include file="inc/foot.asp"-->
</body>
</html>
