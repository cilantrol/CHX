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
	 $('#main-nav-li5 > a').addClass("current"); 
	 $('#main-nav-li5-a5').addClass("current"); 
});
</script>
<script type="text/javascript" src="js/simpla.jquery.configuration.js"></script>
<script language="javascript" type="text/javascript">
	function theForm_Submit(id)
	{
		if (id=="mod")
		{
		    if(confirm('确认修改选定的记录'))
			{
		        form2.target='_self';
				form2.action="product.asp?param=mod";
				form2.submit();	   
		    }
		}
		if (id=="delAll")
		{
		    if(confirm('确认刪除选定的记录'))
			{
		        form2.target='_self';
				form2.action="product.asp?param=delAll";
				form2.submit();	   
		    }
		}
		if (id=="sch")
		{
			form2.target='_self';
			form2.action="product.asp";
			form2.submit();	   
		}
		if (id=="add")
		{
			form1.target='_self';
			form1.action="product.asp?param=add";
			form1.submit();	   
		}
	}
	</script>
</head>
<%
action = request("param")

if action = "mod" then
    row = request.Form("ckDel")
    page = request.Form("pageA")
    key = request.Form("keyA")
    ntype = request.Form("ntypeA")
    if row <> "" then
        row = replace(row," ","")
	    Hid = split(row,",")
	    for temp = 0 to ubound(Hid)
	        id = Hid(temp)
		    px = request.Form("px_"&id)
		    sql = "update pro_pic set px = "&px&" where id = " & id
		    conn.execute(sql)
	    next
	    call CloseConn()
	    response.Redirect("product.asp?page="&page&"&key="&key&"&ntype="&ntype)
    end if
end if

if action = "add" then
    px = request.Form("px")
	
    typeid = request.Form("type")
		
    Photo_1 = request.Form("Photo_1")
 
    sql = "select * from pro_pic"
    set rs = server.CreateObject("adodb.recordset")
    rs.open sql,conn,1,3
    rs.addnew
        rs("px") = px

	    rs("pid") = typeid
		
		rs("pic") = Photo_1
	    
	    rs("AddDate") = Now()
    rs.update
    rs.close
    set rs = nothing
    response.Write("<script>alert('添加成功！');javascript:this.location.href='product.asp';</script>")
    response.End()
end if

if action = "delAll" then
    row = request.Form("ckDel")
    page = request.Form("pageA")
    key = request.Form("keyA")
    ntype = request("ntypeA")
    if row <> "" then
        set fso = server.CreateObject("Scripting.FileSystemObject")
        sql = "select * from pro_pic where id in ("&row&")"
	    set rs = server.CreateObject("adodb.recordset")
	    rs.open sql,conn,1,1
	    do while not rs.eof
			if rs("pic") <> "" then
	            path = server.MapPath("/upload/"&rs("pic"))
		        if fso.FileExists(path) then fso.DeleteFile(path)
		    end if
	        rs.movenext
	    loop
	    rs.close
	    set rs = nothing
	    set fso = nothing
	    sql = "delete from pro_pic where id in ("&row&")"
	    conn.execute(sql)
	    call CloseConn()
	    response.Redirect("product.asp?page="&page&"&key="&key&"&ntype="&ntype)
    end if
end if

if action = "del" then
    page = request("page")
    key = request("key")
    ntype = request("ntype")
    id = request("id")
    sql = "select * from pro_pic where id = " & id
    set rs = server.CreateObject("adodb.recordset")
    rs.open sql,conn,1,3
    if not rs.eof then
        set fso = server.CreateObject("Scripting.FileSystemObject")
		if rs("pic") <> "" then
			path = server.MapPath("/upload/"&rs("pic"))
		    if fso.FileExists(path) then fso.DeleteFile(path)
		end if
	    set fso = nothing
	    rs.delete
	    rs.update
    end if
    rs.close
    set rs = nothing
    call CloseConn()
    response.Redirect("product.asp?page="&page&"&key="&key&"&ntype="&ntype)
end if
%>
<body>
      <div id="body-wrapper">
      
        <!--#include file="inc/left.asp"--> 
		
		<div id="main-content">
            
			<div class="clear"></div>
            
            <div class="content-box">
				
				<div class="content-box-header">
					<h3>产品图片管理</h3>
                    <ul class="content-box-tabs">
						<li><a href="#tab1" class="default-tab">列表</a></li> 
                        <li><a href="#tab2">新增</a></li>
					</ul>
					<div class="clear"></div>
				</div>
				
				<div class="content-box-content">
					
					<div class="tab-content default-tab" id="tab1">
                            <div class="notification attention png_bg">
							     <a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							     <div>请填入相关的內容信息。</div>
						    </div>
                            
                            <form name="form2" action="product.asp" method="post">
							<table class="table">
                            <thead>
								<tr>
								   <th>全选<input class="check-all" type="checkbox" /></th>
                                   <th>图片</th>
                                   <th>所属</th>
                                   <th>排序</th>
								   <th>编辑</th>
								</tr>
							</thead>
                            <tbody>
                                    <%
									page = request("page")
									ntype = request("ntype")
									
									if isnumeric(page) then
									    page = cint(page)
									else
									    page = 1
									end if
									if page <= 0 then
									    page = 1
									end if
									
									if ntype <> "" then
									    sql = "select * from pro_pic where pid = "&ntype&" order by pid asc,px asc,id desc"
									else
									    sql = "select * from pro_pic order by pid asc,px asc,id desc"
									end if
									set rs = server.CreateObject("adodb.recordset")
									'response.Write(sql)
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
									if page = 1 then
									   
									else
									    if (page-1)*percount < rcount then
									        rs.move (page-1)*percount
									    else
									        page=1
									    end if
									end if
									
									dim pagestr
									for j = 1 to pcount 
									    if j = page then
									        pagestr = pagestr & "<a href='?page="&j&"&key="&key&"&ntype="&ntype&"' class='number current'>"&j&"</a>&nbsp;"
									    else
									        pagestr = pagestr & "<a href='?page="&j&"&key="&key&"&ntype="&ntype&"' class='number'>"&j&"</a>&nbsp;"
									    end if
									next
									
									i = 1
									do while not rs.eof
									    tid1 = rs("pid")
									    type1 = conn.execute("select title_cn from products where id = "&tid1)(0)
									%>
								<tr>
									<td><input type="checkbox" name="ckDel" value="<%=rs("id")%>" /></td>
                                    <td><a href="/upload/<%=rs("pic")%>" target="_blank"><%=rs("pic")%></a></td>
                                    <td><%=type1%></td>
									<td><input class="text-input small-input" type="text" name="px_<%=rs("id")%>" value="<%=rs("px")%>" style="width:40px;" /></td>
									<td>
										 <a href="product.asp?param=del&id=<%=rs("id")%>&page=<%=page%>&key=<%=key%>&ntype=<%=ntype%>" title="删除" onclick='return confirm("确定要刪除嗎?")'><img src="images/icons/cross.png" alt="删除" /></a>&nbsp;&nbsp;
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
									<td colspan="9" style="padding-bottom:8px;">
										<div class="pagination">
											<%=pagestr%>
										</div>
										<div class="clear"></div>
									</td>
								</tr>
                                
                                <tr>
                                    <td colspan="9">
                                       <div class="bulk-actions align-left">
                                            <input type="hidden" value="<%=page%>" name="pageA" />
                                            <input type="hidden" value="<%=key%>" name="keyA" />
                                            <input type="hidden" value="<%=ntype%>" name="ntypeA" />
                                            <input class="button buttonInner" type="button" value="保存选中" onClick="javascript:theForm_Submit('mod')" />
                                            <input class="button buttonInner" type="button" value="删除选中" onClick="javascript:theForm_Submit('delAll')" />
                                            <select name="ntype">
									<option value="">-请选择-</option>
									<%
									sql = "select * from products order by id asc"
									set rs = server.CreateObject("adodb.recordset")
									rs.open sql,conn,1,1
									do while not rs.eof
									%>
									<option value="<%=rs("id")%>"><%=rs("title_cn")%></option>
									<%
									rs.movenext
									loop
									rs.close
									set rs = nothing
									%>
									</select>
                                            <input type="button" class="button buttonInner" value="搜   索" onClick="javascript:theForm_Submit('sch')" />
										</div>
                                        <div class="clear"></div>
                                    </td>
                                </tr>
							</tfoot>
                            </table>
                            </form>
							<div class="clear"></div>
					</div>
                    
                    
                    <div class="tab-content" id="tab2">
                         <div class="notification attention png_bg">
							<a href="#" class="close"><img src="images/icons/cross_grey_small.png" title="关闭" alt="关闭" /></a>
							<div>提示信息：请填入相关的內容信息。图片建议尺寸 450 * 450 像素。</div>
						 </div>
                        
                        <form name="form1" action="product.asp" method="post">
                        <table width="100%">
                                <tr height="30">
                                     <td><label>排序：</label></td>
                                     <td><input class="text-input small-input" type="text" name="px" value="10" style="width:180px;" />（越小越前）</td>
                                </tr>
                                
                                <tr height="30">
                                     <td><label>类别：</label></td>
                                     <td><select name="type">
									<%
									sql = "select * from products order by id asc"
									set rs = server.CreateObject("adodb.recordset")
									rs.open sql,conn,1,1
									do while not rs.eof
									%>
									<option value="<%=rs("id")%>"><%=rs("title_cn")%></option>
									<%
									rs.movenext
									loop
									rs.close
									set rs = nothing
									%>
									</select>
                                    </td>
                                </tr>
                                
                                <tr height="30">
                                     <td><label>图片：</label></td>
                                     <td><iframe frameborder="0" height="28" width="350" scrolling="no" src="inc/sheyinupload.asp?id=Photo_1"></iframe><input type="hidden" name="Photo_1" value="" />（500K以内，建议450 * 450）</td>
                                </tr>
                                
                                <tr>
                                     <td></td>
                                     <td style="padding-top:5px;" colspan="2"><input class="button" type="button" value="提交新增" onClick="javascript:theForm_Submit('add')" /></td>
                                </tr>
                                
						</table>
                        </form>
						<div class="clear"></div>
                    </div>
				</div> 
			</div> 
								
			<div id="footer">
				<small>&copy;佛山市顺德区天鹰网络信息技术服务有限公司版权所有 | <a href="http://www.126jiaju.com/" target="_blank">www.126jiaju.com</a> | <a href="#">Top</a></small>
			</div>
			
		</div>
		
	</div>

</body>

</html>
<!--#include file="inc/foot.asp"-->