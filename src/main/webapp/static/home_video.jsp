<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="static/index/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/index/css/font-awesome.css">
    <link href="static/index/css/hover.css" rel="stylesheet" type="text/css">
    <script src="static/index/js/jquery-1.js"></script>
    <script src="static/index/js/jquery_002.js"></script>
    <script type="text/javascript" src="static/index/js/jqthumb.js"></script>
    <script type="text/javascript" src="static/index/js/sxt.js"></script>
    <script type="text/javascript" src="static/index/js/jquery.js"></script>
    <script type="text/javascript" src="static/index/js/wap.js"></script>
</head>
<body>
<div style="z-index:9999; position:relative; background:#fff; width:100%; ">
    <div class="main">
        <div class="top">
            <div class="fl"><a href="http://www.bjsxt.com/"><img src="static/index/logo.jpg"></a></div>
            <div class="menu">
                <ul>
                    <li><a href="http://www.bjsxt.com/">首页</a></li>
                    <li id="kc_nav"><a href="javascript:void(0);" class="">课程介绍</a></li>
                    <div class="kc_box" id="kc_box" style="height: 0px; opacity: 0;">
                        <div class="cont" style="display: block;">
                            <a href="http://www.bjsxt.com/html/java/" target="_blank"><img
                                    src="static/index/nav_java.jpg">
                                <p>JAVAEE课程</p></a>
                            <a href="http://www.bjsxt.com/html/android/" target="_blank"><img
                                    src="static/index/nav_android.jpg">
                                <p>Android课程</p></a>
                            <a href="http://www.bjsxt.com/html/ios/" target="_blank"><img
                                    src="static/index/nav_ios.jpg">
                                <p>iOS课程</p></a>
                            <a href="http://www.bjsxt.com/html/cloud/" target="_blank"><img
                                    src="static/index/nav_cloud.jpg">
                                <p>大数据课程</p></a>
                            <a href="http://www.bjsxt.com/html/html5/" target="_blank"><img
                                    src="static/index/nav_web.jpg">
                                <p>HTML5课程</p></a>
                            <a href="http://www.bjsxt.com/html/ui/" target="_blank"><img src="static/index/nav_ui.jpg">
                                <p>UI课程</p></a>
                            <a href="http://www.bjsxt.com/html/framework/" style="border:none" target="_blank"><img
                                    src="static/index/nav_framework.jpg">
                                <p>互联网架构课程</p></a>
                        </div>
                    </div>
                    <li><a href="http://www.bjsxt.com/Teachers/">专家师资</a></li>
                    <li><a href="http://www.bjsxt.com/employment/">就业喜报</a></li>
                    <li><a href="http://www.bjsxt.com/download.html">视频下载</a></li>
                    <li><a href="http://www.bjsxt.com/story/">学员故事</a></li>
                    <li class="hot"><a href="http://www.bjsxt.com/html/zb/" style="color:#f52f3e"
                                       target="_blank">教学直播间</a><b></b></li>
                </ul>
                <div class="fx" id="fx"><a href="javascript:void(0);">全国分校&nbsp;<i class="icon-angle-down"></i></a>
                </div>
                <div class="fx_box" id="fx_box">
                    <div class="cont">
                        <a href="http://www.bjsxt.com/">北京校区</a>
                        <a href="http://www.shsxt.com/" target="_blank">上海校区</a>
                        <a href="http://www.cssxt.com/" target="_blank">长沙校区</a>
                        <a href="http://www.cd-sxt.com/" target="_blank">四川校区</a>
                        <a href="http://www.zzsxt.cn/" target="_blank">郑州校区</a>
                        <a href="http://www.gzsxt.cn/" target="_blank">广州校区</a>
                        <a href="http://www.whsxt.com/" target="_blank">武汉校区</a>
                        <a href="http://www.tysxt.com/" target="_blank">太原校区</a>
                    </div>
                </div>
                <div class="btn_bm"><a href="http://www.bjsxt.com/html/bm/1/">报名流程</a></div>
            </div>
        </div>
    </div>
    <div class="blank10"></div>
    <div class="blank10"></div>
</div>
<link href="static/index/css/page.css" rel="stylesheet" type="text/css">
<div class="page">
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="main">
        <!--banner-->
        <div class="down_banner">
            <div class="images">
                <ul>
                    <li class="no0">
                        <a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                            <img src="static/index/20160911051945514.jpg">
                        </a>
                    </li>
                    <li class="no1">
                        <a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                            <img src="static/index/20160911052047128.jpg">
                        </a>
                    </li>
                    <li class="no2">
                        <a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                            <img src="static/index/20160911051857850.jpg">
                        </a>
                    </li>
                    <li class="no3">
                        <a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                            <img src="static/index/20160911052203724.jpg">
                        </a>
                    </li>
                    <li class="no4">
                        <a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                            <img src="static/index/20160911051342976.jpg">
                        </a>
                    </li>
                </ul>
            </div>
            <div class="btnbox"><a class="leftbut"></a> <a class="rightbut"></a></div>
            <div class="dotlz">
                <ul>
                    <li class=""></li>
                    <li class=""></li>
                    <li class="cur"></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
            </div>
        </div>
        <!--banner END-->
        <div class="blank10"></div>
        <div id="filter">
            <a href="http://www.bjsxt.com/download.html" class="active">全部</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=70">JAVA</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=72">Android</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=71">iOS</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=73">云计算&amp;大数据</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=74">HTML5前端</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=75">UI</a>
            <a href="http://www.bjsxt.com/index.php?m=content&amp;c=type&amp;catid=7&amp;typeid=76">互联网架构师</a>
        </div>
        <div id="list_container">
            <ul>
                <li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0425/34.html" target="_blank">
                    <div class="img"><img src="static/index/20161026112751823.jpg"><b>主讲：高淇、裴新</b></div>
                    <p>高淇Java300集视频教程</p></a><span><font class="fl">
                 
				已有12757人在学习
                </font><em>初级教程</em></span></li>
                <li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0425/13.html" target="_blank">
                    <div class="img"><img src="static/index/20160918041510876.png"><b>主讲：马士兵</b></div>
                    <p>马士兵JAVA基础教程</p></a><span><font class="fl">
                 
				已有8968人在学习
                </font><em>初级教程</em></span></li>
                <li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">
                    <div class="img"><img src="static/index/20140430045113977.jpg"><b>主讲：高明鑫</b></div>
                    <p>android开发零基础入门教程</p></a><span><font class="fl">
                 
				已有3115人在学习
                </font><em>初级教程</em></span></li>

            </ul>
        </div>
    </div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="blank10"></div>
</div>
<script type="text/javascript" src="static/index/js/down_banner.js"></script>
<!--footer-->
<div class="footer">

    <div class="foot_b">

    </div>
</div>
<!--footer END-->
</body>
</html>
