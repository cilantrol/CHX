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
<script type="text/javascript" src="/js/jquery.Xslider.js"></script>
<script type="text/javascript" src="/js/index.js"></script>

<script type="text/javascript" src="/js/Zslide.min.js"></script>
</head>

<body>
<!--#include file="inc/top.asp"-->

<!--#include file="inc/head.asp"-->

<div class="slider" id="slider">
    <div class="slider-list conbox">
        <div style="background:url(/img/flash_1.jpg) center 0 no-repeat #FFF;"></div>
        <div style="background:url(/img/flash_2.jpg) center 0 no-repeat #FFF;"></div>
        <div style="background:url(/img/flash_3.jpg) center 0 no-repeat #FFF;"></div>
    </div>
    <div class="switcher">
        <a class="cur"></a><a></a><a></a>
	</div>
</div>

<div class="index_pro">
    <div class="wrap">
    	<div class="toptitle">Latest Product</div>
        <div class="sectitle">CALIFORNIA HEATING COMPANY specializes in production of heating and steel,<br /> our products include: radiant floor heating, gutter de-icing cables, snow melting mats, heating mats, thermostats, electric towel rack, and electric stainless steel heaters.<br />
        </div>
        <div class="indprocategory">
            <a href="javascript:;" class="cate on" title="Snow Melting Mat">Snow Melting Mat</a>
            <a href="javascript:;" class="cate " title="Floor Heating Systems">Floor Heating Systems</a>
            <a href="javascript:;" class="cate " title="Underfloor Heating Cable">Underfloor Heating Cable</a>
            <a href="javascript:;" class="cate " title="Under Desk Heater">Under Desk Heater</a>
        </div>

        <div id="ind_pro" class="indprolist" style="display:block;">
            <a class="t_l trans3" href="javascript:void(0);"></a>
            <a class="t_r trans3" href="javascript:void(0);"></a>

            <div class="box_re">
                <div class="box_ab">
                    <div class="item trans5 fl sel">
                        <div class="pic pic_box"><a href="SnowMeltingMat.asp" title="Snow Melting Mat"><img src="/img/ind_pro_1.jpg" class="trans5" title="Snow Melting Mat" alt="Snow Melting Mat" /></a><em></em></div>
                        <a href="SnowMeltingMat.asp" class="name ovauto trans5" title="Snow Melting Mat">Snow Melting Mat</a>
                        <div class="brief">Our portable snow melting products are an efficient, convenient way to eliminate snow and ice accumulation around your home or workplace.</div>
                    </div>

                    <div class="item trans5 fl">
                        <div class="pic pic_box"><a href="FloorHeatingSystems.asp" title="Floor Heating Systems"><img src="/img/ind_pro_2.jpg" class="trans5" title="Floor Heating Systems" alt="Floor Heating Systems" /></a><em></em></div>
                        <a href="FloorHeatingSystems.asp" class="name ovauto trans5" title="Floor Heating Systems">Floor Heating Systems</a>
                        <div class="brief">Combine the highest comfort levels with maximum energy efficiency. It’s a proven technology that’s safe ,reliable and energy efficient.</div>
                    </div>

                    <div class="item trans5 fl">
                        <div class="pic pic_box"><a href="UnderfloorHeatingCable.asp" title="Underfloor Heating Cable"><img src="/img/ind_pro_3.jpg" class="trans5" title="Underfloor Heating Cable" alt="Underfloor Heating Cable" /></a><em></em></div>
                        <a href="UnderfloorHeatingCable.asp" class="name ovauto trans5" title="Underfloor Heating Cable">Underfloor Heating Cable</a>
                        <div class="brief">Suited to generate heat under tile, floors in bathrooms, kitchens, entry-ways and sun rooms. Very thin construction makes them ideally suited for renovation of homes, and new builds.</div>
                    </div>

                    <div class="item trans5 fl">
                        <div class="pic pic_box"><a href="UnderDeskHeater.asp" title="Under Desk Heater"><img src="/img/ind_pro_4.jpg" class="trans5" title="Under Desk Heater" alt="Under Desk Heater" /></a><em></em></div>
                        <a href="UnderDeskHeater.asp" class="name ovauto trans5" title="Under Desk Heater">Under Desk Heater</a>
                        <div class="brief">A simple solution for warming your feet. Just plug in the mat, place your feet on it and enjoy the warmth.</div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>
            <script>
			$("#ind_pro").Zslide({chd:".item",border:0,left:"#ind_pro .t_l",right:"#ind_pro .t_r",slideNum:1,seeNum:3});
            </script>
        </div>
    </div>
</div>

<div class="indabout">
    <div class="wrap">
        <div class="title">About Us</div>
        <div class="sectitle">CALIFORNIA HEATING COMPANY is a subsidiary owned by FOSHAN SHUNDE KEYI ELECTRONIC TECHNOLOGY CO. LTD. KE YI was established in 2005,<br /> located in  Shunde, often regarded as the electronical meca of China<br /> Due to the unique geographical location of being located in the middle of Hong Kong, Macao, and Shen Zhen. </div>
        <div class="title">Mission</div>
        <div class="sectitle">Creating affordable and eco-friendly solutions in North America</div>

        <div class="abolist">
            <div class="list">
                <a href="ContactUs.asp#about" class="pic trans7 pic_box"><img src="/img/indabout_1.png" /></a>
                <a href="ContactUs.asp#about" class="name ovauto trans5">Company Profile</a>
                <div class="brief">The company has strong technical force, advanced machinery and equipment, passion to upholding the highest benchmarks..</div>
                <a href="ContactUs.asp#about" class="more trans5">Read More</a>
            </div>

            <div class="list">
                <a href="ContactUs.asp" class="pic trans7 pic_box"><img src="/img/indabout_2.png" /></a>
                <a href="ContactUs.asp" class="name ovauto trans5">Contact Us</a>
                <div class="brief">Tel : +86-757 29211662 / 26118110<br />Fax : +86-757 26120082<br />E-mail : keyioo@hotmail.com</div>
                <a href="ContactUs.asp" class="more trans5">Read More</a>
            </div>

           <div class="list">
                <a href="ContactUs.asp#feedback" class="pic trans7 pic_box"><img src="/img/indabout_3.png" /></a>
                <a href="ContactUs.asp#feedback" class="name ovauto trans5">FEEDBACK</a>
                <div class="brief">We uphold integrity in our products, have sincere service, and establish rapport in our corportation.</div>
                <a href="ContactUs.asp#feedback" class="more trans5">Read More</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!--#include file="inc/foot.asp"-->
</body>
</html>
