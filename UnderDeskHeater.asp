<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="inc/conn.asp"-->
<!--#include file="inc/title.asp"-->
<%
sql = "select * from products where id = 4"
set rspro = conn.execute(sql)
if not rspro.eof then
    title_en = rspro("title_en")
    content1_en = rspro("content1_en")
    content2_en = rspro("content2_en")
end if
rspro.close
set rspro = nothing
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=web_title%>—<%=title_en%></title>
<meta name="keywords" content="<%=web_keyword%>" />
<meta name="description" content="<%=web_description%>" />
<link href="/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/pro.js"></script>
</head>

<body>
<!--#include file="inc/top.asp"-->

<!--#include file="inc/head.asp"-->

<div class="banner_2"></div>

<div class="positionbg">
    <div id="position" class="wrap">
        <span class="pagetitle">Products</span>
        <a href="/">Home</a>&nbsp;&gt;&nbsp;<a class="last" href="UnderDeskHeater.asp"><%=title_en%></a>
    </div>
</div>

<div class="wrap" style="position:relative; min-height:600px;">
    <div class="leftside">
        <div class="leftmenu">
            <div class="item"><a href="SnowMeltingMat.asp" title="Snow Melting Mat">Snow Melting Mat</a></div>
            <div class="item"><a href="FloorHeatingSystems.asp" title="Floor Heating Systems">Floor Heating Systems</a></div>
            <div class="item"><a href="UnderfloorHeatingCable.asp" title="Underfloor Heating Cable">Underfloor Heating Cable</a></div>
            <div class="item cur"><a href="UnderDeskHeater.asp" title="Under Desk Heater">Under Desk Heater</a></div>
        </div>
    </div>
    
    <div class="rightside fr">
        <div id="pdetail">
			<%
			picitem = ""
			sql = "select top 5 * from pro_pic where pid = 4 order by px asc,id desc"
			set rspic = conn.execute(sql)
			do while not rspic.eof
			    picitem = picitem & rspic("pic") & ","
				rspic.movenext
			loop
			rspic.close
			set rspic = nothing
			%>
			<div class="gallery fl">
                <div class="bigimg"><img src="/upload/<%=split(picitem,",")(0)%>" id="bigimg_src" alt="<%=title_en%>" /></div>
                <div id="small_img">
                    <div class="small_img_list">
                        <div class="bd clean">
                            <%for i = 0 to ubound(split(picitem,",")) - 1%>
                            <span class="pic_box <%if i = 0 then%>on<%end if%>"><a><img src="/upload/<%=split(picitem,",")(i)%>" alt="<%=title_en%>" /></a></span>
                            <%next%>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="detail fr">
                <h1 class="name"><%=title_en%></h1>
                <div class="brief">
                    <%=content1_en%>
                </div>
            </div>
            
        </div>
        
        <div class="clear"></div>
        
        <div class="description">
            <%=content2_en%>
        </div>
        
        <div class="clear"></div>
    </div>
</div>

<!--#include file="inc/foot.asp"-->
</body>
</html>
