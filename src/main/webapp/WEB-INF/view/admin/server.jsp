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


    <title> - jqGird</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <%@include file="../layout/style.jsp"%>
    <!-- jqgrid-->
    <link href="static/admin/css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">


    <style>
        /* Additional style to fix warning dialog position */

        #alertmod_table_list_2 {
            top: 900px !important;
        }
    </style>

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
<script src="static/admin/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="static/admin/js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

<!-- 自定义js -->
<script src="static/admin/js/content.js?v=1.0.0"></script>

<script>
    $(document).ready(function () {

        $.jgrid.defaults.styleUI = 'Bootstrap';

        // Configuration for jqGrid Example 2
        $("#table_data").jqGrid({
            jsonReader : {
                root:"list",
                page:"pageNum",
                total:"pages",
                records:"total"
//                page: "pageNum",
//                total: "pages",
//                rows: "list",
//                records: "total"
            },
            url : '<%=basePath%>admin/server/get_data?pageNum=2&pageSize=10',
            datatype : "json",
            height: 300,
            autowidth: true,
            shrinkToFit: true,
            rowNum: 10,
            colNames: ['id','主机', '名称', '端口'],
            colModel: [
                {
                    name: 'server_id',
                    index: 'server_id',
                    editable: false,
                    sorttype: "int"
                },
                {
                    name: 'host',
                    index: 'host',
                    editable: true
                },
                {
                    name: 'name',
                    index: 'name',
                    editable: true
                },
                {
                    name: 'port',
                    index: 'port',
                    editable: true
                }
            ],

            pager: "#pager_list",
            viewrecords: true,
            caption: "${title}",
            add: true,
            edit: true,
            addtext: 'Add',
            edittext: 'Edit',
            hidegrid: false
        });

        // Add selection
        $("#table_data").setSelection(4, true);


        // Setup buttons
        $("#table_data").jqGrid('navGrid', '#pager_list', {
            edit: true,
            add: true,
            del: true,
            search: true
        }, {
            height: 300,
            reloadAfterSubmit: true
        });

        // Add responsive to jqGrid
        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_data').setGridWidth(width);
        });
    });
</script>




</body>

</html>
