<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../layout/header.jsp"%>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">

<!--${sessionScope.user}-->
<div id="wrapper">
    <%@include file="../layout/nav.jsp"%>

    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <%@include file="../layout/right_head.jsp"%>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="admin/index" frameborder="0" data-id="" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<%@include file="../layout/footer.jsp"%>
