<%-- User: fengymi--%>
<%-- Date: 16-11-28--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .user_info{
        display: none;
    }
    .user_info div{
        text-align: center;
    }
</style>
<header role="banner" id="fh5co-header" class="navbar-fixed-top fh5co-animated slideInDown">
    <div class="container">
        <!-- <div class="row"> -->
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <!-- Mobile Toggle Menu Button -->
                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
                <a class="navbar-brand" href=""><img src="static/img/logo.png">${title}</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class=""><a href="#" data-nav-section="home"><span>网站首页</span></a></li>
                    <li><a href="#" data-nav-section="services"><span>功能介绍</span></a></li>
                    <li class="active"><a href="<%=basePath%>common/course_list"><span>教学视频</span></a></li>
                    <li><a href="<%=basePath%>user/machine/list" target="_blank"><span>在线虚拟机</span></a></li>
                    <c:if test="${sessionScope.sessionUser!=null}">
                        <li><a href="javascript:;" class="icon colored-2">${sessionScope.sessionUser.nickname}</a>
                            <div class="user_info">
                                <div>
                                    <a href="index/logout" class="icon colored-2">修改密码</a>
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
