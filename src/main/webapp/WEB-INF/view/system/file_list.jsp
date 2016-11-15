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
                        <form action="file/upload" method="post" enctype="multipart/form-data" >
                            <input name="file" type="file" class="btn btn-primary btn-block">
                            <input type="submit" value="提交" />
                        </form>
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
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">

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
