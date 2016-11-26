var shijian = 500;
var jiangeshijian = 3000;
var nowimg = 2;
var lock = false;
var mytimer = 0;

var s0 = {"width":248 ,"height":131 , "top":100 , "left": 0 ,"opacity":0}
var s1 = {"width":725, "height":321,  "top":50, 	"left": 0,"opacity":1}
var s2 = {"width":874, "height":382,  "top":20,	    "left": 163,"opacity":1}
var s3 = {"width":725, "height":321,  "top":50, 	"left": 476,"opacity":1}
var s4 = {"width":248 ,"height":131 , "top":100 , 	"left": 600,"opacity":0}

zidong();
function zidong(){
	window.clearInterval(mytimer);
	mytimer = window.setInterval(
		function(){
			$(".rightbut").trigger("click");
		}
	,jiangeshijian);
}

$(".down_banner").mouseenter(
	function(){
		window.clearInterval(mytimer);
	}
);

$(".down_banner").mouseleave(zidong);

$(".rightbut").click(
	function(){
		if(!$(".images ul li").is(":animated") || lock){
			//折腾信号量
			if(nowimg < $(".images ul li").length - 1){
				nowimg = nowimg + 1;
			}else{
				nowimg = 0;
			}
			//设置小圆点：
			$(".dotlz ul li").eq(nowimg).addClass("cur").siblings().removeClass("cur");

			//先交换位置、状态
			$(".no1").animate(s0,shijian);
			$(".no2").animate(s1,shijian);
			$(".no3").animate(s2,shijian);
			$(".no4").animate(s3,shijian);
			$(".no0").css(s4);

			//控制遮罩：
			$(".no3 .zhezhao").animate(
				{
					"opacity":0
				},shijian
			);
			$(".no2 .zhezhao").animate(
				{
					"opacity":0.6
				},shijian
			);

			//交换身份
			$(".no0").attr("class","denghou");
			$(".no1").attr("class","no0");
			$(".no2").attr("class","no1");
			$(".no3").attr("class","no2");
			$(".no4").attr("class","no3");

			if($(".no3").next().length != 0){
				$(".no3").next().attr("class","no4");
			}else{
				$(".images ul li:first").attr("class","no4");
			}
			$(".no4").css(s4);					
		}
	}
);

$(".leftbut").click(
	function(){
		if(!$(".images ul li").is(":animated") || lock){
			//折腾信号量
			if(nowimg > 0){
				nowimg = nowimg - 1;
			}else{
				nowimg = $(".images ul li").length - 1;
			}
			$(".dotlz ul li").eq(nowimg).addClass("cur").siblings().removeClass("cur");

			$(".no0").animate(s1,shijian);
			$(".no1").animate(s2,shijian);
			$(".no2").animate(s3,shijian);
			$(".no3").animate(s4,shijian);
			$(".no4").css(s0);

			$(".no1 .zhezhao").animate(
				{
					"opacity":0
				},shijian
			);
			//控制遮罩：
			$(".no2 .zhezhao").animate(
				{
					"opacity":0.6
				},shijian
			);

			$(".no4").attr("class","denghou");
			$(".no3").attr("class","no4");
			$(".no2").attr("class","no3");
			$(".no1").attr("class","no2");
			$(".no0").attr("class","no1");
			if($(".no1").prev().length != 0){
				$(".no1").prev().attr("class","no0");
			}else{
				$(".images li:last").attr("class","no0");
			}
			$(".no0").css(s0);
		}
	}
);

$(".dotlz ul li").click(
	function(){
		lock = true;
		shijian = 100;

		if($(this).index() > nowimg){
			var cishu = $(this).index() - nowimg;
			for(var i = 1 ; i <= cishu ; i = i + 1){
				$(".rightbut").trigger("click");
			}
		}else{
			var cishu = nowimg - $(this).index();
			for(var i = 1 ; i <= cishu ; i = i + 1){
				$(".leftbut").trigger("click");
			}
		}

		lock = false;
		shijian = 500;

		nowimg = $(this).index();
		$(".dotlz ul li").eq(nowimg).addClass("cur").siblings().removeClass("cur");
	}
);