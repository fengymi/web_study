<%-- User: fengymi--%>
<%-- Date: 16-11-24--%>
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
    <link href="static/css/plugin/video-js.min.css" rel="stylesheet">
    <style type="text/css">
        *{margin: 0;padding: 0}
    </style>
</head>
<body>
<div class="player">
    <div style="width: 630px;height: 360px;">
        <video id="example_video_1" class="video-js vjs-default-skin"
               data-setup=
                       '{
                            "controls":true,
                            "autoplay": false,
                            "preload": "auto",
                            "poster": "${applicationScope.fileHost}/${param.imgUrl}",
                            "width":630,
                            "height":360,
                            "controlBar":{"fullscreenToggle":false}
                       }'
        >
            <source src="${applicationScope.fileHost}/${param.filePath}" type='video/mp4' />
            <p class="vjs-no-js">该浏览器暂不支持</p>
        </video>
    </div>
</div>
</body>
<script src="static/admin/js/jquery.min.js"></script>
<script src="static/js/plugin/video.min.js"></script>
<script>
    videojs.options.flash.swf = "http://cdn.bootcss.com/video.js/5.13.2/video-js.swf";
    var myPlayer = videojs("example_video_1");
    myPlayer.volume(0.1);
    $(function () {
        $(".vjs-poster").css("background-size","cover");
    });
</script>
</html>
