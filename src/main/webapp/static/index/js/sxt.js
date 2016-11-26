
/*$(function(){
	$('.recommend img').jqthumb({
		width: 220,
		height: 124,
	});
});
$(function(){
	$('.like img').jqthumb({
		width: 220,
		height: 135,
	});
});
$(function(){
	$('.campus img').jqthumb({
		width: 220,
		height: 165,
	});
});
$(function(){
	$('.interview img').jqthumb({
		width: 288,
		height: 195,
	});
});
$(function(){
	$('.hot img').jqthumb({
		width:215,
		height: 121,
	});
});*/


/*$(function(){
	 $('.recommend li,.like li').hover(function () {
        var $this = $(this);
        $this.stop().animate({marginTop:"0px",marginBottom:"5px"},200);
    },function () {
        var $this   = $(this);
        $this.stop().animate({marginTop:"5px"},200);
    })
});*/


$(function(){
	 $('.hover').hover(function () {
        var e = this;
        $(e).find("b").stop().animate({top:"10px",backgroundPosition:"285"},0);
    },function () {
        var e = this;
        $(e).find("b").animate({top:"170px",backgroundPosition:"0%"},0);
    })
});

$(function(){
	var time = null;
	var list = $("#fx");
	var box = $("#fx_box");
	var lista = list.find("a");
	for(var i=0,j=lista.length;i<j;i++){
		if(lista[i].className == "now"){
			var olda = i;
		}
	}
	var box_show = function(hei){
		box.stop().animate({
			height:hei,
			opacity:1
		},100);
	}
	var box_hide = function(){
		box.stop().animate({
			height:0,
			opacity:0
		},100);
	}
	lista.hover(function(){
		lista.removeClass("now");
		$(this).addClass("now");
		clearTimeout(time);
		var index = list.find("a").index($(this));
		box.find(".cont").hide().eq(index).show();
		var _height = box.find(".cont").eq(index).height()+22;
		box_show(_height)
	},function(){
		time = setTimeout(function(){	
			box.find(".cont").hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});
	box.find(".cont").hover(function(){
		var _index = box.find(".cont").index($(this));
		lista.removeClass("now");
		lista.eq(_index).addClass("now");
		clearTimeout(time);
		$(this).show();
		var _height = $(this).height()+22;
		box_show(_height);
	},function(){
		time = setTimeout(function(){		
			$(this).hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});
});

$(function(){
	var time = null;
	var list = $("#kc_nav");
	var box = $("#kc_box");
	var lista = list.find("a");
	for(var i=0,j=lista.length;i<j;i++){
		if(lista[i].className == "now"){
			var olda = i;
		}
	}
	var box_show = function(hei){
		box.stop().animate({
			height:hei,
			opacity:1
		},100);
	}
	var box_hide = function(){
		box.stop().animate({
			height:0,
			opacity:0
		},100);
	}
	lista.hover(function(){
		lista.removeClass("now");
		$(this).addClass("now");
		clearTimeout(time);
		var index = list.find("a").index($(this));
		box.find(".cont").hide().eq(index).show();
		var _height = box.find(".cont").eq(index).height()+22;
		box_show(_height)
	},function(){
		time = setTimeout(function(){	
			box.find(".cont").hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});
	box.find(".cont").hover(function(){
		var _index = box.find(".cont").index($(this));
		lista.removeClass("now");
		lista.eq(_index).addClass("now");
		clearTimeout(time);
		$(this).show();
		var _height = $(this).height()+22;
		box_show(_height);
	},function(){
		time = setTimeout(function(){		
			$(this).hide();
			box_hide();
		},50);
		lista.removeClass("now");
		lista.eq(olda).addClass("now");
	});
});

$(function(){

	$(".weekly-list li").bind("mouseenter",weekly_ani).bind("mouseleave",function(){
		clearTimeout(
			$(this).data("setTime")
		);
	});
	
	function weekly_ani(e){
		var me=$(e.target).closest("li");
		if(me.hasClass("current")) 
		return;
		var orili=me.parent().find(".current");
		$(this).data("setTime",setTimeout(function(){
			weekly_move(me,orili,110,39)
		},100));
	}
	
	function weekly_move(me,orili,h,h2){
		me.addClass("current");
		$(".weekly-list li").unbind("mouseenter",weekly_ani);
		setTimeout(function(){
			var cur_h=me.height();
			if(cur_h < h-2){
				var cur_orih=orili.height();
				var dh=Math.round((h-cur_h)/2.5);
				me.css("height",cur_h+dh);
				orili.css("height",cur_orih-dh);
				setTimeout(arguments.callee,25);
			}else{
				me.addClass("current").css("height",h);
				orili.css("height",h2);
				$(".weekly-list li").bind("mouseenter",weekly_ani);
				orili.removeClass("current");
			}
		},25);
	}
	
	$(".weekly-list").find("li:first").addClass("current").animate({height:110}, 100);
	
});
/*android*/










