
$(function(){
	$('.small_img_list .pic_box').click(function(){
		var _this = $(this).index();
		$('.small_img_list .pic_box').removeClass('on').eq(_this).addClass('on');
		$("#bigimg_src").attr("src",$(this).children("a").children("img").attr("src"))
	});
	
	$(window).scroll(function(){
		var sl = $(window).scrollTop();
		if(sl >= 525){
			$(".leftside").css("top",sl + 50 - 575);
		}
		else{
			$(".leftside").css("top",0);
		}
	});
});