<%-- User: fengymi--%>
<%-- Date: 16-11-2--%>
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

    <%@include file="../layout/style.jsp"%>
    <!-- jqgrid-->
    <link href="static/admin/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>${title}</h5>
                </div>
                <div class="ibox-content">
                    <div class="jqGrid_wrapper">
                        <table id="table_data"></table>
                        <div id="pager_list"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../layout/main_js.jsp"%>

<!-- Peity -->
<script src="static/admin/js/plugins/peity/jquery.peity.min.js"></script>

<!-- jqGrid -->
<script src="static/admin/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="static/admin/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>

<!-- 自定义js -->
<script src="static/admin/js/content.js"></script>
<script src="static/js/design/design.js"></script>

<script>
    $(document).ready(function () {

        $.jgrid.defaults.styleUI = 'Bootstrap';

        // Configuration for jqGrid Example 2
        $("#table_data").jqGrid(getJqGirdInit({
            url : '<%=basePath%>system/server/get_data',
            editurl:"<%=basePath%>system/server/edit_data",
            sortname:"server_id",
            caption: "${title}",
//            colNames: ['服务器id','主机', '名称', '端口','操作'],
            colModel: [
                {
                    label:"服务器id",
                    name: 'server_id',
                    index: 'server_id',
                    editable: false,
                    sorttype: "int",
                    align: 'center',
                    key:true
                },
                {
                    label:'名称',
                    name: 'name',
                    index: 'name',
                    align: 'center',
                    editable: true
                },
                {
                    label:'主机',
                    name: 'host',
                    index: 'host',
                    align: 'center',
                    editable: true
                },
                {
                    label:'端口',
                    name: 'port',
                    index: 'port',
                    align: 'center',
                    editable: true
                },
                {
                    label:'操作',
                    align: 'center',
                    sortable: false,
                    editable: false,
                    formatter: function (cellvalue, options, rowObject) {
                        return "操作";
                    }
                }
            ]
        }));

        $("#table_data").jqGrid('navGrid', '#pager_list', {
            edit: true,
            add: true,
            del: true
        }, {
            reloadAfterSubmit: true
        });
        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_data').setGridWidth(width);
        });
    });
</script>




</body>

</html>
