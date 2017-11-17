
$(function(){
	$('.indprocategory .cate').click(function(){
		var _this = $(this).index();
		$('.indprocategory .cate').removeClass('on').eq(_this).addClass('on');
		$('.indprolist .item').removeClass('sel').eq(_this).addClass('sel');
		if(_this == 0){
			$(".box_ab").css("left",0);
		}
		else if(_this == 3){
			$(".box_ab").css("left",-410);
		}
	});
	
	
	// 焦点图片淡隐淡现
	$("#slider").Xslider({
		affect:'fade',
		ctag: 'div'
	});
});