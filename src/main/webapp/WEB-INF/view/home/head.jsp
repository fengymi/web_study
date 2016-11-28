<%-- User: fengymi--%>
<%-- Date: 16-11-28--%>
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
    <title>${title}</title>
    <link href="static/index/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="static/index/css/font-awesome.css">
    <link href="static/index/css/hover.css" rel="stylesheet" type="text/css">

    <link rel="shortcut icon" href="static/img/favicon.ico">

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="static/home/css/bootstrap.css">

    <link rel="stylesheet" href="static/home/css/style_1_1.css">

    <!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
    <link rel="stylesheet" id="theme-switch" href="static/home/css/style_1_1.css">

    <script src="static/index/js/jquery-1.js"></script>
    <script src="static/index/js/jquery_002.js"></script>
    <script type="text/javascript" src="static/index/js/jqthumb.js"></script>
    <script type="text/javascript" src="static/index/js/sxt.js"></script>
    <script type="text/javascript" src="static/index/js/jquery.js"></script>
    <script type="text/javascript" src="static/index/js/wap.js"></script>
</head>
<body>
<%@include file="header.jsp"%>
