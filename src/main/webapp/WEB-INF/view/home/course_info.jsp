<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- User: fengymi--%>
<%-- Date: 16-11-28--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp" %>
<link href="static/index/css/page.css" rel="stylesheet" type="text/css">
<link href="static/css/plugin/video-js.min.css" rel="stylesheet">
<style type="text/css">
    .course-item{
        padding: 2px 5px;
    }
    .course-item:hover{
        background-color: #efe3d3;
        cursor: pointer;
    }
    .course-item:after{
        content: " ";
        display: block;
        clear: both;
    }
    .course-item .r{
        float: right;
        margin-left: 5px;
    }
</style>

<div class="page">
    <div class="main" style="margin-top: 75px;">
        <div class="blank10"></div>
        <%--<div class="page_n"><a href="http://www.bjsxt.com/">首页</a><em>&gt;</em><a--%>
                <%--href="http://www.bjsxt.com/download.html">视频下载</a><em>&gt;</em>android开发零基础入门教程--%>
        <%--</div>--%>
        <div class="kc_list_t">
            <div class="l">
                <%--<img src="${applicationScope.fileHost}/${course.img_url}">--%>
                <div class="player">
                    <div style="width: 630px;height: 360px;">
                        <video id="course_video" class="video-js vjs-default-skin"
                               data-setup=
                                       '{
                            "controls":true,
                            "autoplay": false,
                            "preload": false,
                            "poster": "${applicationScope.fileHost}/${course.img_url}",
                            "width":630,
                            "height":360,
                            "controlBar":{}
                       }'
                        >
                            <source src="${applicationScope.fileHost}/${course.courseItems[0].video_url}" type='video/mp4'/>
                            <p class="vjs-no-js">该浏览器暂不支持</p>
                        </video>
                    </div>
                </div>
            </div>
            <div class="r">
                <h1><a href="javascript:;">${course.course_name}</a></h1>
                <em>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;讲：</em>${course.course_author}<br>
                <em>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</em>${course.language}<br>
                <%--<em>适合对象：</em>Android初学者--%><br>
                <div class="blank10"></div>
                <div class="blank10"></div>
                <!--<div class="btn"><a href="" target="_blank"><i class="icon-download-alt"></i>下载完整视频</a></div>-->
                <%--<div class="btn"><a href="http://pan.baidu.com/s/1eSFmrmE" target="_blank"><i--%>
                        <%--class="icon-cloud-download"></i>资料下载</a></div>--%>
            </div>
        </div>
    </div>
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="main">
        <!--left-->
        <div class="">
            <div id="kclistSlideTxt">
                <div class="parHd">
                    <ul>
                        <li class="on">课程介绍</li>
                        <li class="">课程目录</li>
                        <li class="">课程资料</li>
                    </ul>
                </div>
                <div class="parBd">
                    <div class="parBdIn">
                        <div class="kclistTxtBox" style="display: block;">
                            <div class="js">
                                <div>
                                    ${course.course_desc}
                                </div>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                        <div class="kclistTxtBox" style="display: none;">
                            <div class="js">
                                <h2>${course.course_name}</h2><br/>
                                <div>
                                    <c:forEach var="item" items="${course.courseItems}">
                                        <div class="course-item" title="立即学习" data="${applicationScope.fileHost}/${item.video_url}" onclick="divSelect(this)">
                                            <%--<input type="checkbox" />--%>
                                            <span>${item.curriculum_num}.&nbsp;&nbsp;${item.name}</span>
                                            <%--<div class="r">下载</div>--%>
                                            <%--<div class="r">学习</div>--%>
                                        </div>
                                    </c:forEach>
                                </div>

                                <%--<div class="course-item" onclick="divSelect(this)">--%>
                                    <%--<input type="checkbox" />--%>
                                    <%--<span>${item.curriculum_num}.&nbsp;&nbsp;${item.name}</span>--%>
                                    <%--<div class="r">下载</div>--%>
                                    <%--<div class="r">学习</div>--%>
                                <%--</div>--%>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                        <div class="kclistTxtBox" style="display: none;">
                            <div class="js">
                                <c:forEach var="item" items="${course.courseItems}">
                                    <c:if test="${item.resource_id!=null}">
                                        <div class="course-item" title="下载" onclick="downloadFile('file/download/${item.resource_id}')">
                                                <%--<input type="checkbox" />--%>
                                            <span>${item.curriculum_num}.&nbsp;&nbsp;${item.name}</span>
                                                <%--<div class="r">下载</div>--%>
                                                <%--<div class="r">学习</div>--%>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <script type="text/javascript">jQuery("#kclistSlideTxt").slide({
                titCell: ".parHd li",
                mainCell: ".parBdIn",
                trigger: "click"
            });</script>
        </div>
        <!--left END-->
        <div class="blank10"></div>
        <div class="blank10"></div>
        <div class="blank10"></div>
    </div>
</div>


<script src="static/js/plugin/video.min.js"></script>
<%--<script src="static/js/plugin/file_lib.js"></script>--%>
<script>

    videojs.options.flash.swf = "http://cdn.bootcss.com/video.js/5.13.2/video-js.swf";
    var myPlayer = videojs("course_video");
    myPlayer.volume(0.1);
    $(function () {
        $(".vjs-poster").css("background-size", "cover");
    });

    function divSelect(obj) {
        var url = $(obj).attr("data");
        myPlayer.src(url);
        myPlayer.load(url);
        myPlayer.play();
//        $(obj).find("input[type='checkbox']").click();
    }

    function downloadFile(url) {
//        Downer({"test.txt":url});
        window.open(url);
    }

    function downloadAll() {
        Downer([""]);
    }
</script>
<%@include file="footer.jsp" %>
