
<%-- User: fengymi--%>
<%-- Date: 16-11-2--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="在线学习" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="static/img/favicon.ico">

    <!-- Animate.css -->
    <link rel="stylesheet" href="static/home/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="static/home/css/icomoon.css">
    <!-- Simple Line Icons -->
    <link rel="stylesheet" href="static/home/css/simple-line-icons.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="static/home/css/owl.carousel.min.css">
    <link rel="stylesheet" href="static/home/css/owl.theme.default.min.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="static/home/css/bootstrap.css">

    <link rel="stylesheet" href="static/home/css/style_1_1.css">

    <!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
    <link rel="stylesheet" id="theme-switch" href="static/home/css/style_1_1.css">
    <!-- End demo purposes only -->

    <style type="text/css">
        #go_top{cursor:pointer;}
    </style>

    <!-- Modernizr JS -->
    <script src="static/home/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="static/home/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<header role="banner" id="fh5co-header">
    <div class="container">
        <!-- <div class="row"> -->
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <!-- Mobile Toggle Menu Button -->
                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                <a class="navbar-brand" href="index"><img src="static/img/logo.png" />${title}</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#" data-nav-section="home"><span>网站首页</span></a></li>
                    <li><a href="#" data-nav-section="services"><span>功能介绍</span></a></li>
                    <li><a href="<%=basePath%>common/course_list"><span>教学视频</span></a></li>
                    <li><a href="#" data-nav-section="testimonials"><span>常见问题</span></a></li>
                    <li><a href="<%=basePath%>user/machine/list"><span>在线虚拟机</span></a></li>
                    <c:if test="${sessionScope.sessionUser!=null}">
                        <li><a href="index/logout" class="icon colored-2">${sessionScope.sessionUser.nickname}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.sessionUser==null}">
                        <li><a href="index/login" class="btn btn-primary btn-sm">登录</a></li>
                        <li><a href="index/register" class="btn btn-primary btn-sm">注册</a></li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <!-- </div> -->
    </div>
</header>
<div id="slider" data-section="home">
    <div class="owl-carousel owl-carousel-fullwidth">

        <div class="item" style="background-image:url(static/home/images/hn0fqc.jpg)">
            <div class="overlay"></div>
            <div class="container" style="position: relative;">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <div class="fh5co-owl-text-wrap">
                            <div class="fh5co-owl-text">
                                <h1 class="fh5co-lead to-animate">超轻松在线学习</h1>
                                <h2 class="fh5co-sub-lead to-animate">使用在线虚拟机直接学习，无需搭建任何环境</h2>
                                <p class="to-animate-2">
                                    <c:if test="${sessionScope.sessionUser==null}">
                                        <a href="index/register" class="btn btn-primary btn-lg">马上加入</a>
                                    </c:if>
                                    <c:if test="${sessionScope.sessionUser!=null}">
                                        <a href="#" class="btn btn-primary btn-lg" data-nav-section="pricing">开始学习</a>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item" style="background-image:url(static/home/images/29uhkr.jpg)">
            <div class="container" style="position: relative;">
                <div class="row">
                    <div class="col-md-7 col-sm-7">
                        <div class="fh5co-owl-text-wrap">
                            <div class="fh5co-owl-text">
                                <h1 class="fh5co-lead to-animate">使用方便，操作简单</h1>
                                <h2 class="fh5co-sub-lead to-animate">只要有浏览器即可直接学习，无需安装任何其它插件</h2>
                                <p class="to-animate-2"><a href="ios.html" class="btn btn-primary btn-lg">查看使用流程</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="item item3" style="background-image:url(static/home/images/0i6fae.jpg)">
            <div class="container" style="position: relative;">
                <div class="row">
                    <div class="col-md-7 col-md-push-1 col-md-push-5 col-sm-7 col-sm-push-1 col-sm-push-5">
                        <div class="fh5co-owl-text-wrap">
                            <div class="fh5co-owl-text">
                                <h1 class="fh5co-lead to-animate">轻松教学</h1>
                                <h2 class="fh5co-sub-lead to-animate">每个人都是老师，分享自己的教学视频</h2>
                                <p class="to-animate-2"><a href="and.html" class="btn btn-primary btn-lg">发布教学</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%--<div class="copyrights">Collect from <a href="#" >ZT云流量</a></div>--%>

<div id="fh5co-our-services" data-section="services">
    <div class="container">
        <div class="row row-bottom-padded-sm">
            <div class="col-md-12 section-heading text-center">
                <h2 class="to-animate">功能介绍</h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 to-animate">
                        <h3>基于web的在线学习，让学习者更方便的直接学习，省去复杂的环境搭建环节</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box to-animate">
                    <div class="icon colored-5"><span><i class="icon-rocket"></i></span></div>
                    <h3>网速提升</h3>
                    <p>移动联通4G网络轻松提升，无束缚，轻松上5M/s</p>
                </div>
                <div class="box to-animate">
                    <div class="icon colored-4"><span><i class="icon-heart"></i></span></div>
                    <h3>无需设置</h3>
                    <p>只需要输入您注册的账号和密码，轻松登录即可</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box to-animate">
                    <div class="icon colored-2"><span><i class="icon-screen-desktop"></i></span></div>
                    <h3>安卓/苹果</h3>
                    <p>支持目前最流行的机型，苹果IOS/安卓全机型兼容，我们坚持领先一步</p>
                </div>
                <div class="box to-animate">
                    <div class="icon colored-1"><span><i class="icon-mustache"></i></span></div>
                    <h3>轻松连接</h3>
                    <p>有信号的地方即可使用，连接速度极快，您只需消耗几kb流量即可完成登录。</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box to-animate">
                    <div class="icon colored-3"><span><i class="icon-user"></i></span></div>
                    <h3>操作简单</h3>
                    <p>打开浏览器即可直接进行编程</p>
                </div>
                <div class="box to-animate">
                    <div class="icon colored-6"><span><i class="icon-eye"></i></span></div>
                    <h3>海量资源</h3>
                    <p>无论是差旅，商务，休闲，去到哪里随便看，再也不担心宝宝追不了《老九门》</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="fh5co-press" data-section="press">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h2 class="single-animate animate-press-1">软件安装</h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext single-animate animate-press-2">
                        <h3>云流量无需等待，秒连接！全面兼容，安卓/IOS系统零风险！</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-2">
            <div class="row row-bottom-padded-lg">
                <div class="col-md-6 text-center to-animate">
                    <div class="person">
                        <a href="ios.html"><img src="static/home/picture/person2.jpg" class="img-responsive img-rounded" alt="Person"></a>
                        <a href="ios.html"><h3 class="name">IOS系统</h3></a>
                        <div class="position">切换ID安装即可快速使用</div>
                    </div>
                </div>
                <div class="col-md-6 text-center to-animate">
                    <div class="person">
                        <a href="and.html"><img src="static/home/picture/person3.jpg" class="img-responsive img-rounded" alt="Person"></a>
                        <a href="and.html"><h3 class="name">安卓系统</h3></a>
                        <div class="position">一键下载即可安装使用</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="fh5co-testimonials" data-section="testimonials">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h2 class="to-animate">常见问题</h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext to-animate">
                        <h3>每实际使用1G流量仅扣几M套餐内流量，通过客户端使用的云节流功能，从而实现随时随地无限免费流量上网！</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>A、可能由于服务器连接过于频繁，请关闭软件重新登录重新连接即可<br>
                            B、可能你的手机CPU过热，重启你的手机然后重新登录重新连接即可<br>
                            C、可能是我们的服务器出现问题了，停止使用然后联系客服即可<br>
                            D、每个地区所用线路不一样，使用过程中发现会扣掉自身流量套餐的流量，尝试更改手机网络接入点改为wap或者net试一下</p>
                    </blockquote>
                    <p class="author">账号正常，连接时却一直连接不上</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>因为需要登录苹果美国版商店进行下载软件才可进行云流量的使用，中国苹果商店没有上架该软甲！</p>
                    </blockquote>
                    <p class="author">为什么要退出的苹果ID？</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>A、由于4G手机数据和通话不在一个网络模式下的原因，用户在接打电话是会断开数据通信，所以在通话之后，需要重新连接软件，然后再继续上网；<br>B、锁屏熄屏或者手机清理后台都有可能造成软件掉线，从而不能使用大猫哥流量；<br>C、用户在观看视频的同时请留意屏幕左上角的小钥匙是否还显示，以防掉线完全消耗你自身的流量，具体消耗比例以测试为准。</p>
                    </blockquote>
                    <p class="author">为什么有时候断线连接不上？</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>A、本软件在每次登陆或者连接时可能需要损耗50K左右手机套餐流量，手机自带的软件在后台运行会消耗少量流量。<br>
                            B、在使用过程中如果遇到掉线又重新连接，掉线重新连接需要一定的时间。<br>
                            C、本软件在部分城市存在盲区包括个别手机品牌型号不能兼容导致不能使用，首次使用时一定要先做测试，确认不会消耗你手机流量套餐的流量后再继续使用。</p>
                    </blockquote>
                    <p class="author">使用本软件为什么会消耗本机流量？</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>1、关闭你的wifi，开启你的手机流量数据，把所有正在运行的软件都关闭<br>2、如果手机双卡双待，请切换到您用来上网的手机卡。<br>3、不支持手机开热点。</p>
                    </blockquote>
                    <p class="author">请问有什么注意事项？</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="box-testimony to-animate">
                    <blockquote>
                        <span class="quote"><span><i class="icon-quote-left"></i></span></span>
                        <p>A、拨打电话时，手机网络会自行中断，通话完成之后软件会自动重新连接，可能有部分手机需要手动重新连接软件。<br>
                            B、部分手机自带一键清理功能，或者安装360，手机管家，手机助手等此类软件，请将流量库设置为白名单，可以避免部分掉线问题<br>
                            C、请不要随便恢复手机出厂设置，也不要随便清理手机数据，由此造成的损失自行承担。</p>
                    </blockquote>
                    <p class="author">软件在使用的过程中会发生掉线？</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="fh5co-pricing" data-section="pricing">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-heading text-center">
                <h2 class="single-animate animate-pricing-1">云免服务器+免流系统搭建</h2>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 subtext single-animate animate-pricing-2">
                        <h3>是否已经心动不已？马上合作加盟吧！</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-6 to-animate">
                <div class="price-box popular">
                    <div class="popular-text">云免服务器30M独享+免流系统搭建</div>
                    <div class="price">258<small>元</small></div>
                    <p>每月免费2000G流量</p>
                    <hr>
                    <ul class="pricing-info">
                        <li>续费元65/月</li>
                    </ul>
                    <a href="http://wpa.qq.com/msgrd?v=1&uin=61383668&site=houdao.com&menu=yes" class="btn btn-primary btn-block" class="btn btn-default btn-sm">立即订购</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 to-animate">
                <div class="price-box popular">
                    <div class="popular-text">云免服务器200M独享+免流系统搭建</div>
                    <div class="price">358<small>元起</small></div>
                    <p>每月免费2000G流量</p>
                    <hr>
                    <ul class="pricing-info">
                        <li>续费元130/月</li>
                    </ul>
                    <a href="http://wpa.qq.com/msgrd?v=1&uin=61383668&site=houdao.com&menu=yes" class="btn btn-primary btn-block" class="btn btn-default btn-sm">立即订购</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 to-animate">
                <div class="price-box popular">
                    <div class="popular-text">云免服务器200M独享+免流系统搭建</div>
                    <div class="price">358<small>元</small></div>
                    <p>每月免费2000G流量</p>
                    <hr>
                    <ul class="pricing-info">
                        <li>续费元130/月</li>

                    </ul>
                    <a href="http://wpa.qq.com/msgrd?v=1&uin=61383668&site=houdao.com&menu=yes" class="btn btn-primary btn-block" class="btn btn-default btn-sm">立即订购</a>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 to-animate">
                <div class="price-box popular">
                    <div class="popular-text">云免服务器200M独享+免流系统搭建</div>
                    <div class="price">358<small>元</small></div>
                    <p>每月免费2000G流量</p>
                    <hr>
                    <ul class="pricing-info">
                        <li>续费元130/月</li>

                    </ul>
                    <a href="http://wpa.qq.com/msgrd?v=1&uin=61383668&site=houdao.com&menu=yes" class="btn btn-primary btn-block" class="btn btn-default btn-sm">立即订购</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <a href="http://wpa.qq.com/msgrd?v=1&uin=61383668&site=houdao.com&menu=yes" class="btn btn-primary btn-block">马上成为老板</a>
            </div>
        </div>
    </div>
</div>

<hr>
<footer id="footer" role="contentinfo">
    <div class="container">
        <div class="row row-bottom-padded-sm">
            <div class="col-md-12">
                <p class="copyright text-center">&copy; 2016 <a href="./">ZT云流量</a>. All Rights Reserved.</p>
            </div>
        </div>
        <div class="row hide">
            <div class="col-md-12 text-center">
                <ul class="social social-circle">
                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                    <li><a href="#"><i class="icon-youtube"></i></a></li>
                    <li><a href="#"><i class="icon-pinterest"></i></a></li>
                    <li><a href="#"><i class="icon-linkedin"></i></a></li>
                    <li><a href="#"><i class="icon-instagram"></i></a></li>
                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div id="go_top" title="回到顶部" style="position: fixed;z-index: 1000;right: 30px;bottom: 30px;display: none;">
    <img src="static/img/go_top" width="29px" height="65px">
</div>



<!-- jQuery -->
<script src="static/home/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="static/home/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="static/home/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="static/home/js/jquery.waypoints.min.js"></script>
<!-- Owl Carousel -->
<script src="static/home/js/owl.carousel.min.js"></script>

<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
<script src="static/home/js/jquery.style.switcher.js"></script>
<script>
    $(function(){
        $('#colour-variations ul').styleSwitcher({
            defaultThemeId: 'theme-switch',
            hasPreview: false,
            cookie: {
                expires: 30,
                isManagingLoad: true
            }
        });
        $('.option-toggle').click(function() {
            $('#colour-variations').toggleClass('sleep');
        });
    });
</script>
<!-- End demo purposes only -->

<!-- Main JS (Do not remove) -->
<script src="static/home/js/main.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script src="static/home/js/jquery.fancybox.js" type="text/javascript"></script>
<link href="static/home/css/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<!-- fancybox_app -->
<script src="static/home/js/fancybox_app.js" type="text/javascript"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script src="static/home/js/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
<script src="static/js/plugin/layer.js" type="text/javascript"></script>
</body>
<script>

    $(function () {
        $(window).scroll(function(){
            if ($(window).scrollTop()>100){
                $("#go_top").fadeIn(500);
            }else{
                $("#go_top").fadeOut(300);
            }
        });
        $("#go_top").click(function () {
            $('body,html').animate({scrollTop:0},500);
        });
    });
</script>

</html>

