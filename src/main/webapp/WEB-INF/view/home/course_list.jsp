<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp"%>

<link href="static/index/css/page.css" rel="stylesheet" type="text/css">
<style>
    p{margin: 0 !important;}
</style>
<div class="page">
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="main" style="margin-top: 75px;">
        <!--banner-->
        <div class="down_banner">
            <div class="images">
                <ul>
                    <c:forEach var="course" varStatus="status" items="${courses}" begin="0" end="${courses.size()>5?5:courses.size()}">
                        <li class="no${(status.index+2)%5}">
                            <a href="common/course_info/${course.course_id}" target="_blank">
                                <img src="${applicationScope.fileHost}/${course.img_url}">
                            </a>
                        </li>
                    </c:forEach>
                    <%----%>
                    <%--<li class="no4">--%>
                        <%--<a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">--%>
                            <%--<img src="static/index/20160911051342976.jpg">--%>
                        <%--</a>--%>
                    <%--</li>--%>
                </ul>
            </div>
            <div class="btnbox"><a class="leftbut"></a> <a class="rightbut"></a></div>
            <div class="dotlz">
                <ul>
                    <c:forEach items="${courses}" varStatus="status" begin="0" end="${courses.size()>5?5:courses.size()}">
                        <li class="<c:if test="${status.index==(courses.size()/2-0.5)}">cur</c:if>"></li>
                    </c:forEach>
                    <%--<li class="cur"></li>--%>
                </ul>
            </div>
        </div>
        <!--banner END-->
        <div class="blank10"></div>
        <div id="filter" style="text-align: left;">
            <a href="http://www.bjsxt.com/download.html" class="active">全部</a>
            <select >
                <option value="1">java</option>
                <option value="1">android</option>
                <option value="1">c</option>
                <option value="1">c++</option>
            </select>

        </div>
        <div id="list_container">
            <ul>
                <c:forEach var="course" items="${courses}">
                    <li class="hvr-float"><a href="common/course_info/${course.course_id}">
                        <div class="img"><img src="${applicationScope.fileHost}/${course.img_url}"><b>主讲：${course.course_author}</b></div>
                        <p>${course.course_name}</p></a>
                        <span><font class="fl">
                            已有12757人在学习
                        </font><em>${course.language}</em></span>
                    </li>
                </c:forEach>

                <%--<li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0425/34.html" target="_blank">--%>
                    <%--<div class="img"><img src="static/index/20161026112751823.jpg"><b>主讲：高淇、裴新</b></div>--%>
                    <%--<p>高淇Java300集视频教程</p></a><span><font class="fl">--%>
                 <%----%>
				<%--已有12757人在学习--%>
                <%--</font><em>初级教程</em></span></li>--%>
                <%--<li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0425/13.html" target="_blank">--%>
                    <%--<div class="img"><img src="static/index/20160918041510876.png"><b>主讲：马士兵</b></div>--%>
                    <%--<p>马士兵JAVA基础教程</p></a><span><font class="fl">--%>
                 <%----%>
				<%--已有8968人在学习--%>
                <%--</font><em>初级教程</em></span></li>--%>
                <%--<li class="hvr-float"><a href="http://www.bjsxt.com/2014/down_0430/36.html" target="_blank">--%>
                    <%--<div class="img"><img src="static/index/20140430045113977.jpg"><b>主讲：高明鑫</b></div>--%>
                    <%--<p>android开发零基础入门教程</p></a><span><font class="fl">--%>
                 <%----%>
				<%--已有3115人在学习--%>
                <%--</font><em>初级教程</em></span></li>--%>

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
<%@include file="footer.jsp"%>
