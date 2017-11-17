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
	 $('#main-nav-li4-a3').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script language="javascript" type="text/javascript">
	function theForm_Submit(id)
	{
		if (id=="delAll")
		{
		    if(confirm('确认删除选定的记录'))
			{
		        form1.target='_self';
				form1.action="message.asp?param=delAll";
				form1.submit();	   
		    }
		}
		if (id=="sch")
		{
			form1.target='_self';
			form1.action="message.asp";
			form1.submit();	   
		}
	}
	</script>
</head>
<%
action = request("param")

if action = "delAll" then
   row = request.Form("ckDel")
   page = request.Form("pageA")
   key = request.Form("keyA")
   if row <> "" then
	  sql = "delete from message where id in ("&row&")"
	  conn.execute(sql)
	  call CloseConn()
	  response.Redirect("message.asp?page="&page&"&key="&key)
    end if
end if

if action = "del" then
   page = request("page")
   key = request("key")
   id = request("id")
   sql = "delete from message where id = " & id
   conn.execute(sql)
   call CloseConn()
   response.Redirect("message.asp?page="&page&"&key="&key)
end if
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
                            <form name="form1" action="message.asp" method="post">
							<table class="table">
                            <thead>
								<tr>
								   <th>全选<input class="check-all" type="checkbox" /></th>
								   <th>公司名</th>
								   <th>电话</th>
								   <th>Email</th>
                                   <th>主题</th>
                                   <th>时间</th>
                                   <th>已读</th>
								   <th>操作</th>
								</tr>
							</thead>
                            <tbody>
                                    <%
									key = request("key")
									page = request("page")
									
									if isnumeric(page) then
									   page = cint(page)
									else
									   page = 1
									end if
									if page <= 0 then
									   page = 1
									end if

									
									sql = "select * from message where (company like '%"&key&"%' or Subject like '%"&key&"%' or email like '%"&key&"%' or Phone like '%"&key&"%') order by id desc"

									set rs = server.CreateObject("adodb.recordset")
									rs.open sql,conn,1,1
									rcount = rs.recordcount
									percount = 10
									dim pcount
									
									if (rcount mod percount) = 0 then
									   pcount= rcount \ percount
									else
									   pcount= rcount \ percount + 1
									end if
									
									if (page-1)*percount > rcount then
									   if (rcount mod percount) = 0 then
									       page= rcount \ percount
									   else
									       page= rcount \ percount + 1
									   end if
									end if
									if page=1 then
									   
									else
									   if (page-1)*percount < rcount then
									      rs.move (page-1)*percount
									   else
									      page=1
									   end if
									end if
									
									dim pagestr
									pagestr = "<a href='message.asp?page=1&key="&key&"'>首页</a><a href='message.asp?page="&(page-1)&"&key="&key&"'>上一页</a>"
									for j = 1 to pcount 
									   if j = page then
									   pagestr = pagestr & "<a href='message.asp?page="&j&"&key="&key&"' class='number current'>"&j&"</a>&nbsp;"
									   else
									   pagestr = pagestr & "<a href='message.asp?page="&j&"&key="&key&"' class='number'>"&j&"</a>&nbsp;"
									   end if
									next
									pagestr = pagestr &  "<a href='message.asp?page="&(page+1)&"&key="&key&"'>下一页</a><a href='message.asp?page="&pcount&"&key="&key&"'>尾页</a>"
									
									i = 1
									do while not rs.eof
									%>
								<tr>
									<td><input type="checkbox" name="ckDel" value="<%=rs("id")%>" /></td>
									<td class="left"><a href="message_view.asp?id=<%=rs("id")%>&page=<%=page%>&key=<%=key%>" title="查看详情"><%=rs("company")%></a></td>
									<td><%=rs("Phone")%></td>
									<td><%=rs("Email")%></td>
                                    <td><%=rs("Subject")%></td>
                                    <td><%=rs("addtime")%></td>
                                    <td><%if rs("isview") = 1 then%>已读<%else%>未读<%end if%></td>
									<td>
										 <a href="message.asp?param=del&id=<%=rs("id")%>&page=<%=page%>&key=<%=key%>" title="刪除" onclick='return confirm("确定要删除嗎?")'><img src="images/icons/cross.png" alt="删除" /></a>
									</td>
								</tr>
								    <%
									  i = i + 1
									  if i > percount then Exit Do
									  rs.movenext
									loop
									rs.close
									set rs = nothing
									%>
							</tbody>
                            <tfoot>
								<tr>
									<td colspan="8">
										<div class="bulk-actions align-left">
										    <input class="text-input small-input" type="text" name="key" style="width:120px;" />
                                            <input type="hidden" value="<%=page%>" name="pageA" />
                                            <input type="hidden" value="<%=key%>" name="keyA" />
                                            <input class="button buttonInner" type="button" value="搜  索" onClick="javascript:theForm_Submit('sch')" />
                                            
                                            <input class="button buttonInner" type="button" value="删除選中" onClick="javascript:theForm_Submit('delAll')" />
										</div>
										<div class="pagination">
											<%=pagestr%>
										</div>
										<div class="clear"></div>
									</td>
								</tr>
							</tfoot>
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

</html>
<!--#include file="inc/foot.asp"-->