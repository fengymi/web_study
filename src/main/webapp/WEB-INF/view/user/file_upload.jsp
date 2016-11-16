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
    <link href="static/css/plugin/webuploader.css" rel="stylesheet">


</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div style="height: 300px;">

                </div>
            </div>
            <div class="ibox float-e-margins">
                <button class="btn btn-primary btn-block">选择文件</button>
                <button class="btn btn-primary btn-block">上传文件</button>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div id="file_list" class="uploader-list">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="../layout/main_js.jsp" %>
<script src="static/admin/js/content.js"></script>
<%--<script src="static/js/plugin/webuploader.min.js"></script>--%>
<script src="static/js/plugin/webuploader.html5only.js"></script>
<%--<script src="http://cdn.staticfile.org/webuploader/0.1.0/webuploader.js"></script>--%>

<script>
    var $list = $("#thelist");
    var uploader = WebUploader.create({

        // swf文件路径
        swf: 'static/swf/Uploader.swf',

        // 文件接收服务端。
        server: '<%=basePath%>file/upload',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id:'#picker',
            label:"点击选择图片",
            innerHTML: "请选择上传文件",
            multiple:true
        },
        dnd: "#list", //开启拖拽
        disableGlobalDnd:true, //禁止浏览器打开文件
//        auto: true,

        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });
    $("#ctlBtn").click(function () {
        uploader.upload(uploader.getFiles());
    });

    // 当有文件被添加进队列的时候
    uploader.on( 'fileQueued', function( file ) {
        $list.append( '<div id="' + file.id + '" class="item">' +
                '<h4 class="info">' + file.name + '</h4>' +
                '<p class="state">等待上传...</p>' +
                '</div>' );
    });
    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
                $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css( 'width', percentage * 100 + '%' );
    });
    uploader.on( 'uploadSuccess', function( file ) {
        $( '#'+file.id ).find('p.state').text('已上传');
    });

    uploader.on( 'uploadError', function( file ) {
        $( '#'+file.id ).find('p.state').text('上传出错');
    });

    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').fadeOut();
    });

</script>
</html>
