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
        <div class="col-sm-12 animated fadeInRight">
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
<script src="static/js/design/design.js"></script>

<script>
    $(document).ready(function () {
        initToast();
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });
</script>
</html>
