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
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${title}</h5>
                </div>
                <div class="ibox-content">
                    <div class="row form-body form-horizontal m-t">
                        <div class="col-md-12">
                            <form action="course_manager/publish" method="post">
                                <input type="hidden" name="img_url" />
                                <input type="hidden" name="img_id" />
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">课程名称：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="course_name" class="form-control" placeholder="请输入课程名称" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">主讲人：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="course_author" class="form-control" placeholder="课程主讲人" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">语言：</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="course_language" style="height: 36px;">
                                            <option value="">请选择相应的开发语言</option>
                                            <c:forEach var="language" items="${languages}">
                                                <option value="${language.l_id}">${language.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">课程描述：</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="course_desc" maxlength="1000" placeholder="对该课程的相应介绍" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">课程封面：</label>
                                    <div class="col-sm-9">
                                        <div id="picker">选择文件</div>
                                        <div style="position: relative;width: 216px;height: 120px;border: 1px dashed #c0c0c0;border-radius: 5px;">
                                            <div id="img_nav" style="position: absolute;left: 0;top:0;width: 100%;height: 100%;text-align: center;line-height: 120px;background:rgba(0, 0, 0, 0.3);color: #ffffff">
                                                <span>请选择文件</span>
                                            </div>
                                            <img id="img" style="height: 100%;width:100%">
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-9">
                                        <button  class="btn btn-primary" type="submit">发布课程</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<%@include file="../layout/main_js.jsp" %>
<script src="static/js/plugin/webuploader.min.js"></script>
<script>
    var uploader = WebUploader.create({
        // swf文件路径
        swf: '<%=basePath%>static/swf/Uploader.swf',
        // 文件接收服务端。
        server: '<%=basePath%>file/upload',
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id:'#picker',
            label:"选择封面",
            innerHTML: "选择封面",
            multiple:true
        },
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        },
        auto:true, // 自动上传
        thumb:{ //缩略图
            width: 216,
            height: 120,
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 100,
            // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
            allowMagnify: true,
            // 是否允许裁剪。
            crop: false
        },
        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });
    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        var $img = $("#img");
        $("#img_nav").fadeIn(100);

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, $img.parent().width(),  $img.parent().height() );
    });
    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        $("#img_nav").find("span").html((percentage*100).toFixed(0)+"%");
    });
    uploader.on( 'uploadSuccess', function( file,response ) {
        $("input[name='img_id']").val(response.file_id);
        $("input[name='img_url']").val(response.group+"/"+response.remote_name);
        var $img_nav = $("#img_nav");
        $img_nav.fadeOut(100);
        $img_nav.find("span").html("0%");
    });


</script>
</html>
