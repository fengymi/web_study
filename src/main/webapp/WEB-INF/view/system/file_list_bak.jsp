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
    <link href="static/admin/css/plugins/iCheck/custom.css" rel="stylesheet">
    <style type="text/css">
        .file-box{height: 200px;}
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-md-3">
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
                        <div class="clearfix">
                            <button onclick="checkAll()">全选</button>
                            <button onclick="reCheck()">反选</button>
                            <button onclick="deleteFile()">删除文件</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 animated fadeInRight">
            <div class="row">
                <div class="col-md-12">
                    <c:forEach var="file" items="${files}">
                        <div class="file-box">
                            <a href="javascript:;" onclick="selectOne(this)" desc="file/download/${file.file_id}">
                                <div class="file">
                                    <input type="checkbox" value="${file.file_id}" name="fileIds" class="i-checks" />
                                    <span class="corner"></span>

                                    <div class="icon">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="file-name">
                                        ${file.name}.${file.ext}
                                        <br/>
                                        <small>上传时间：${file.upload_time}</small>
                                    </div>
                                </div>
                            </a>
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
<!-- iCheck -->
<script src="static/admin/js/plugins/iCheck/icheck.min.js"></script>

<script>

    $(document).ready(function () {
//        initToast();
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    
    function reCheck() {
        $("ins[class='iCheck-helper']").each(function (index,obj) {
            $(obj).click();
        });
    }
    function checkAll() {
        var allIns = $("ins[class='iCheck-helper']");
        if(!allIns||allIns.length<=0){
            return;
        }
        var checked = $(allIns).eq(0).parent().hasClass("checked");
        allIns.each(function (index,obj) {
            if(checked==$(obj).parent().hasClass("checked")){
                $(obj).click();
            }
        });
    }
    function selectOne(obj) {
        $(obj).find('ins[class="iCheck-helper"]').click();
    }

    function deleteFile() {
        var fileIds =[];//要删除的文件
        var fileViews = []; //要删除的文件盒子
        if(!confirm("确定要删除吗?")){
            return;
        }
        $("input[name='fileIds']:checked").each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数
            fileIds.push($(this).val());
            fileViews.push($(this).parent().parent().parent());
        });
        $(fileViews).each(function () {
            $(this).remove();
        });
        <%--$.ajax({--%>
            <%--url:"<%=basePath%>file/manager/delete/files",--%>
            <%--method:"post",--%>
            <%--data:{fileIds:fileIds},--%>
            <%--success:function(data){--%>
                <%--if(data!=0){--%>
                    <%--toastr["error"]("删除失败");--%>
                <%--}else{--%>
                    <%--toastr["success"]("删除成功");--%>
                <%--}--%>
            <%--}--%>
        <%--});--%>
    }
</script>
</html>
