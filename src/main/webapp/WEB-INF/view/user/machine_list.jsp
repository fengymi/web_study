<%-- User: fengymi--%>
<%-- Date: 16-11-14--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>${title}</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <%@include file="../layout/style.jsp" %>


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>显示：</h5>
                        <a href="file_manager.html#" class="file-control active">所有</a>
                        <a href="file_manager.html#" class="file-control">文档</a>
                        <a href="file_manager.html#" class="file-control">视频</a>
                        <a href="file_manager.html#" class="file-control">图片</a>
                        <div class="hr-line-dashed"></div>
                        <button class="btn btn-primary btn-block">上传文件</button>
                        <div class="hr-line-dashed"></div>
                        <h5>文件夹</h5>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> 文件</a>
                            </li>
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> 图片</a>
                            </li>
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> Web页面</a>
                            </li>
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> 插图</a>
                            </li>
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> 电影</a>
                            </li>
                            <li><a href="file_manager.html"><i class="fa fa-folder"></i> 书籍</a>
                            </li>
                        </ul>
                        <h5 class="tag-title">标签</h5>
                        <ul class="tag-list" style="padding: 0">
                            <li><a href="file_manager.html">爱人</a>
                            </li>
                            <li><a href="file_manager.html">工作</a>
                            </li>
                            <li><a href="file_manager.html">家庭</a>
                            </li>
                            <li><a href="file_manager.html">孩子</a>
                            </li>
                            <li><a href="file_manager.html">假期</a>
                            </li>
                            <li><a href="file_manager.html">音乐</a>
                            </li>
                            <li><a href="file_manager.html">照片</a>
                            </li>
                            <li><a href="file_manager.html">电影</a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <c:forEach var="machine" items="${machines}">
                        <div class="file-box">
                            <div class="file">
                                <a target="_blank"
                                   <c:if test="${machine.free_num>=machine.count_num}">href='javascript:void(0);' onclick="toastr['error']('连接用户已满,请更换其它虚拟机')" </c:if>
                                   <c:if test="${machine.free_num<machine.count_num}">href='user/machine/connection?machine_id=${machine.machine_id}'</c:if>>
                                    <span class="corner"></span>
                                    <div class="icon">
                                        <c:choose>
                                            <c:when test="${machine.system==1}">
                                                <i style="color: #3c4a1e;" class="fa fa-linux"></i>
                                            </c:when>
                                            <c:when test="${machine.system==2}">
                                                <i style="color: #14f9e9;" class="fa fa-windows"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa fa-apple"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="file-name">
                                        ${machine.name}
                                        <br/>
                                        <small>连接协议：${machine.protocol}</small>
                                        <small style="float: right;">人数：${machine.free_num}/${machine.count_num}</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="../layout/main_js.jsp" %>
<script src="static/admin/js/content.js"></script>

<script>
    $(document).ready(function () {
        initToast();
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });
</script>
</html>
