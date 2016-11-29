<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp"%>

<link href="static/index/css/page.css" rel="stylesheet" type="text/css">
<style>
    input,button,select,textarea{outline:none}
    p{margin: 0 !important;}
    .search{
        float: right;margin-right: 40px;
    }
    input{margin: 0;padding: 0;}

    .selector{
        height: 30px;
        min-width: 200px;
        margin-right: 5px;
        padding-left: 15px;
        padding-right: 5px;
        line-height: 30px;
        border-radius: 15px;
        border: 1px;
        background-color: #f3f9ea;
    }
    .selector option{
        margin:0;
        float:left;
        height: 26px;
        padding: 5px 0 5px 20px;/*当时解决输入框光标顶满input框的问题是这么解决的 如果设置了行高就会顶满没有行高的话光标高度=文字的font-size */
        border: none;
        outline: none;
        color:#6d6d6d;
        -webkit-appearance:none; /*去除系统默认的样式*/
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);   /* 点击去除高亮的颜色*/
        background-color: #fff;/*当input框禁止输入的时候会有一个灰色的底色 项目需要我设置了 白色底 跟页面背景一个颜色。*/
    }

    .search input{
        margin-right: 5px;
        padding-left: 15px;
        line-height: 30px;
        border-radius: 15px;
        border: 1px;
    }
    .search span{
        color: #00a2d4;
        font-weight: 600;
        font-size: 16px;
        cursor: pointer;
    }
</style>
<div class="page">
    <div class="blank10"></div>
    <div class="blank10"></div>
    <div class="main" style="margin-top: 75px;">
        <!--banner-->
        <div class="down_banner">
            <div class="images">
                <ul>
                    <c:forEach var="course" varStatus="status" items="${hots}" begin="0" end="${hots.size()>5?5:hots.size()}">
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
                    <c:forEach items="${hots}" varStatus="status" begin="0" end="${hots.size()>5?5:hots.size()}">
                        <li class="<c:if test="${status.index==(courses.size()/2-0.5)}">cur</c:if>"></li>
                    </c:forEach>
                    <%--<li class="cur"></li>--%>
                </ul>
            </div>
        </div>
        <!--banner END-->
        <div class="blank10"></div>
        <div id="filter" style="text-align: left;">
            <form id="search" action="common/course_list" method="post">
                <a href="common/course_list" class="active">全部</a>
                <select name="language" class="selector" >
                    <option value="" selected></option>
                    <c:forEach var="language" items="${languages}">
                        <option value="${language.l_id}" <c:if test="${language.l_id==page.getExtend('language')}">selected</c:if > >${language.name}</option>
                    </c:forEach>
                </select>
                <div class="search" style="">
                    <input name="search_key" placeholder="请输入关键字" value="${page.getExtend("search_key")}" />
                    <span class="icon-magnifier" onclick="$('#search').submit()">&nbsp;&nbsp;&nbsp;&nbsp;</span>
                </div>
            </form>
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
