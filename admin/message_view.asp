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
	 $('#main-nav-li4 > a').addClass("current"); 
	 $('#main-nav-li4-a1').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
</head>
<%
   id = request.QueryString("id")
   page = request.QueryString("page")
   key = request.QueryString("key")
   if id&"" = "" then
      response.Redirect("message.asp?page="&page&"&key="&key)
   end if
   sql = "update message set isview = 1 where id = " & id
   conn.execute(sql)
   
   sql = "select * from message where id = " & id
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
					<h3>在线留言</h3>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
                            <form>
							<table class="table">
                            <tbody>
									<tr>
                                    <td class="left2" width="80">时间：</td>
                                    <td class="left1">&nbsp;<%=rs("addtime")%></td>
                                    </tr>
                                    
									<tr>
                                    <td class="left2">公司名：</td>
                                    <td class="left1">&nbsp;<%=rs("company")%></td>
                                    </tr>
                                    
                                    <tr>
                                    <td class="left2">主题：</td>
                                    <td class="left1">&nbsp;<%=rs("Subject")%></td>
                                    </tr>
                                    
									<tr>
                                    <td class="left2">联系电话：</td>
                                    <td class="left1">&nbsp;<%=rs("Phone")%></td>
                                    </tr>
                                    
									<tr>
                                    <td class="left2">电子邮箱：</td>
                                    <td class="left1">&nbsp;<%=rs("Email")%>
									</td>
                                    </tr>
                                    
                                    <tr>
                                    <td class="left2">留言內容：</td>
                                    <td class="left1">&nbsp;<%=rs("message")%></td>
                                    </tr>
                                    
                                    <tr>
                                    <td class="left2">&nbsp;</td>
                                    <td class="left1">&nbsp;<a href="message.asp?page=<%=page%>&key=<%=key%>">返回</a></td>
                                    </tr>      
							</tbody>
                            </table>
                            </form>
							<div class="clear"></div>
						
					</div>
					
				</div> 
			</div> 
								
			<div id="footer">
				<small>&#169; 一索设计版权所有 | <a href="http://www.esodesign.cn/" target="_blank">www.esodesign.cn</a> | <a href="#">Top</a></small>
			</div>
			
		</div>
		
	</div>

</body>
<%
   end if
   rs.close
   set rs = nothing
%>
</html>
<!--#include file="inc/foot.asp"-->