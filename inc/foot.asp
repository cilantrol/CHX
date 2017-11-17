<div id="footer">
    <div class="fnav wrap">
        <div class="nav">
            <a href="/">Home</a>
            <a href="ContactUs.asp#about">About Us</a>
            <a href="SnowMeltingMat.asp">Products</a>
		    <a href="ContactUs.asp#feedback">FEEDBACK</a>
            <a href="ContactUs.asp">Contact Us</a>
        </div>    
    </div>
    <div class="copyright wrap">
        <%if web_foot1 <> "" then%><div class="addr"><%=web_foot1%></div><%end if%>
        <%if web_foot2 <> "" then%><div class="tel"><%=web_foot2%></div><%end if%>
        <%if web_foot3 <> "" then%><div class="email"><a href="mailto:<%=web_foot3%>" title="<%=web_foot3%>"><%=web_foot3%></a></div><%end if%>
        <div class="copy">© Jin Yi All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.esodesign.cn/" target="_blank">POWERED BY ESO</a></div>
    </div>
</div>