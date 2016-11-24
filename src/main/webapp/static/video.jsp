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
    <link href="http://cdn.bootcss.com/video.js/5.13.2/video-js.css" rel="stylesheet">
</head>
<body>
<div class="player">
    <div style="width: 1000px;height: 600px;">
        <%--<video &lt;%&ndash;poster="https://cdn.selz.com/plyr/1.0/poster.jpg"&ndash;%&gt; controls crossorigin>--%>
            <%--<!-- Video files -->--%>
            <%--<source src="<%=basePath%>common/download?filePath=group1/M00/00/01/cxxD0Vg2msmAALE4AC_ghog0QZM505.mp4" type="video/mp4">--%>
            <%--&lt;%&ndash;<source src="https://cdn.selz.com/plyr/1.0/movie.webm" type="video/webm">&ndash;%&gt;--%>

            <%--<!-- Text track file -->--%>
            <%--&lt;%&ndash;<track kind="captions" label="English captions" src="https://cdn.selz.com/plyr/1.0/movie_captions_en.vtt" srclang="en" default>&ndash;%&gt;--%>

            <%--<!-- Fallback for browsers that don't support the <video> element -->--%>
            <%--&lt;%&ndash;<a href="https://cdn.selz.com/plyr/1.0/movie.mp4">Download</a>&ndash;%&gt;--%>
        <%--</video>--%>
        <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none"
               width="1000" height="600"
               poster="http://video-js.zencoder.com/oceans-clip.png"
               data-setup="{}">
            <source src="http://${applicationScope.fileHost}/group1/M00/00/01/cxxD0Vg2msmAALE4AC_ghog0QZM505.mp4" type='video/mp4' />
        </video>
    </div>
</div>
</body>
<script src="http://cdn.bootcss.com/video.js/5.13.2/video.js"></script>
<script>
    videojs.options.flash.swf = "http://cdn.bootcss.com/video.js/5.13.2/video-js.swf";
</script>
</html>
