<%-- User: fengymi--%>
<%-- Date: 16-12-7--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="500 web在线学习" />
    <meta name="description" content="web在线学习500" />
    <title>500</title>

    <link rel="shortcut icon" href="static/img/favicon.ico">
    <link href="static/error/css/error.css" rel="stylesheet" type="text/css" />
    <script>
        if (window.top !== window.self) {
            window.top.location = "<%=basePath%>error/505.jsp";
        }
    </script>
</head>
<body>


<div id="container">
    <img class="png" src="static/error/images/500.png" />
    <img class="png msg" src="static/error/images/500_msg.png" />
    <p><a href=""><img class="png" src="static/error/images/404_to_index.png" /></a> </p>
</div>

<div id="cloud" class="png"></div>



</body>
</html>
