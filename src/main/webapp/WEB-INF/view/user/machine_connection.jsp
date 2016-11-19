<%-- User: fengymi--%>
<%-- Date: 16-11-14--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <style type="text/css">
        #display:-webkit-full-screen {
            width: 100%;
            height: 100%;
        }
        a{
            font-size: 30px;
            color: #c4c4c4;
            text-decoration:none;
            padding-left: 10px;
            padding-right: 10px;
        }
        a:hover{
            color: #f2f8f0;
        }
        a:active{
            color: #b9a876;
        }
        .trigger_bar{
            height: 5px;position: absolute;top:0;z-index: 10001;
            width: 60%;
            left: 50%;
            margin-left: -30%;
        }
        .show_bar{
            position: absolute;
            top: 0;
            z-index: 10000;
            width: 60%;
            left: 50%;
            margin-left: -30%;
            display: none;
            text-align: center;
            color: #ccc;
            background-color: rgba(10, 5, 5, 0.47);
        }
        #connect_toast a{
            font-size: 14px;
        }
        #connect_toast a:hover{
            color: #b9a876;
        }
    </style>

</head>
<body>
<div id="content" style="position: relative">
    <div id="trigger" class="trigger_bar"></div>
    <div id="show" class="show_bar">
        <a title="进入全屏" onclick="launchFullscreen()"><i class="fa fa-expand"></i></a>
        <a title="退出全屏" style="display: none" onclick="exitFullscreen()"><i class="fa fa-compress"></i></a>
        <a title="重新连接" onclick="resetConnect()"><i class="fa fa-refresh"></i></a>
        <%--<button onclick="disConnection()">断开连接</button>--%>
    </div>
    <div id="display">

    </div>
</div>
<div id="connect_toast" class="col-sm-3" style="position:fixed;left:0;right:0;margin-left:auto;margin-right:auto;display: none;">
    <div class="spiner-example">
        <div class="sk-spinner sk-spinner-wave">
            <div class="sk-rect1"></div>
            <div class="sk-rect2"></div>
            <div class="sk-rect3"></div>
            <div class="sk-rect4"></div>
            <div class="sk-rect5"></div>
        </div>
        <div style="text-align: center;">
            <span id="connection_text">正在连接...</span>
            <a onclick="disConnection()">断开连接</a>
        </div>
    </div>
</div>
</body>
<%@include file="../layout/main_js.jsp" %>
<script type="text/javascript"
        src="static/js/guacamole/guacamole_all.js"></script>
<script type="text/javascript"
        src="static/js/guacamole/guacamole_manager.js"></script>
<script src="static/js/design/design.js"></script>
<script src="static/js/design/full_screen.js"></script>
<script type="text/javascript">
    var element = document.getElementById("content");
    var height,width,data;
    var guac;
    var show = $("#show");
    function launchFullscreen() {
        show.find("a").eq(0).css("display","none");
        show.find("a").eq(1).css("display","inline");
        full_screen(element);
    }
    function exitFullscreen() {
        show.find("a").eq(1).css("display","none");
        show.find("a").eq(0).css("display","inline");
        exit_full_screen(element);
    }

    $(function(){
        showNavBar({
            "trigger":$("#trigger"),
            "show":$("#show")
        });
        initToast();
        initGuac();
    });

    function initGuac() {
        guac = GuacamoleManager.init("tunnel");
        var display = document.getElementById("display");
        display.appendChild(guac.getDisplay().getElement());
        height = window.screen.height;
        width = $(document).width();
        data = "GUAC_WIDTH="+width+"&GUAC_HEIGHT="+height+"&machine_id=${clientInfo.machine_id}";

        try {
            guac.connect(data);
        } catch (error) {
            initToast["error"]("连接出错");
            disConnection();
        }
        guac.onerror = function (error) {
            initToast["error"]("连接出错");
            disConnection();
        };
        //绑定键盘事件
        GuacamoleManager.bindKey(document);
        window.onunload = function () {
            disConnection();
        };
    }
    function resetConnect() {
        guac.disconnect();
        guac.connect(data);
    }
    function disConnection() {
        guac.disconnect();
    }
</script>
</html>
