
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
    <style type="text/css">
        .user_info{
            display: none;
            position: absolute;
        }
        .user_info div{
            text-align: center;
            width: 120px;
        }

    </style>
</head>
<body>

<header role="banner" id="fh5co-header">
    <div class="container">
        <!-- <div class="row"> -->
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <!-- Mobile Toggle Menu Button -->
                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                <a class="navbar-brand" href=""><img src="static/img/logo.png" />${title}</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#" data-nav-section="home"><span>网站首页</span></a></li>
                    <li><a href="#" data-nav-section="services"><span>功能介绍</span></a></li>
                    <li><a href="common/course_list"><span>教学视频</span></a></li>
                    <li><a href="user/machine/list" target="_blank"><span>在线虚拟机</span></a></li>
                    <c:if test="${sessionScope.sessionUser!=null}">
                        <li id="user_info_show"><a href="javascript:;" class="icon colored-2">${sessionScope.sessionUser.nickname}</a>
                            <div id="user_info" class="user_info">
                                <div>
                                    <a href="javascript:;" onclick="changePassword()" class="icon colored-2">修改密码</a>
                                </div>
                                <div>
                                    <a href="index/logout" class="icon colored-2">退出登录</a>
                                </div>
                            </div>
                        </li>
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
                                        <a href="common/course_list" class="btn btn-primary btn-lg" data-nav-section="pricing">开始学习</a>
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
<hr>
<footer id="footer" role="contentinfo">
    <div class="container">
        <div class="row row-bottom-padded-sm">
            <div class="col-md-12">
                <p class="copyright text-center">&copy; 2016 <a href="">在线学习</a></p>
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
    function changeUserInfo() {
        var $user = $("#user_info");
        if($user.css("display")=="none"){
            $user.fadeIn(200);
        }else {
            $user.fadeOut(200);
        }
    }
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
        $("#user_info_show").bind("click",function (event) {
            var $user = $("#user_info");
            if($user.css("display")=="none"){
                $user.fadeIn(200);
            }else {
                $user.fadeOut(200);
            }
            event.stopPropagation();
        });
        $(window).click(function () {
            $("#user_info").fadeOut(200);
        });
        $(window).scroll(function(){
            $("#user_info").fadeOut(200);
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
    function changePassword() {
        layer.prompt({
            formType: 1,
            value: '',
            title: '修改密码'
        }, function(value, index, elem){
            $.ajax({
                url:"user/chang_password",
                method:"post",
                data:{password:value},
                success:function (data) {
                    alert(data.message);
                }
            });
            layer.close(index);
        });
    }
</script>

</html>

