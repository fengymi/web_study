<%-- User: fengymi--%>
<%-- Date: 16-11-2--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>服务器列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <%@include file="../layout/style.jsp"%>

    <link href="static/admin/css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
        <h2>代理服务器列表</h2>
    </div>
</div>

<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="middle-box text-center animated fadeInRightBig">
                <h3 class="font-bold">这里是页面内容</h3>

                <div class="error-desc">
                    您可以在这里添加栅格，参考首页及其他页面完成不同的布局
                    <br/><a href="#" class="btn btn-primary m-t">打开主页</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<%@include file="../layout/main_js.jsp"%>

<!-- jqGrid -->
<script src="static/admin/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="static/admin/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

<!-- 自定义js -->
<script src="static/admin/js/content.js?v=1.0.0"></script>
<!--${machine.get("servers")}-->
<script type="javascript">
    var data = ${machine.get("servers")};

</script>


</body>

</html>