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
            url : '<%=basePath%>system/machine_user/get_data?machine_id=${machine_id}',
            editurl:"<%=basePath%>system/machine_user/edit_data?machine_id=${machine_id}",
            sortname:"mu_id",
            caption: "${title}",
//            colNames: ['虚拟机id','主机', '名称', '端口'],
            colModel: [
                {
                    label:"账号id",
                    name: 'mu_id',
                    index: 'mu_id',
                    editable: false,
                    sorttype: "int",
                    align: 'center',
                    key:true
                },{
                    label:"虚拟机id",
                    name: 'machine_id',
                    index: 'machine_id',
                    editable: false,
                    sorttype: "int",
                    align: 'center'
                },
                {
                    label:'账号',
                    name: 'username',
                    index: 'username',
                    align: 'center',
                    editable: true
                },
                {
                    label:'密码',
                    name: 'password',
                    index: 'password',
                    align: 'center',
                    editable: true
                },
                {
                    label:'状态',
                    name: 'status',
                    index: 'status',
                    align: 'center',
                    editable: true,
                    formatter: function (cellvalue, options, rowObject) {
                        var value;
                        switch (cellvalue){
                            case "1":
                                value = "可用";
                                break;
                            case "0":
                                value = "使用中";
                                break;
                            default :
                                value = "异常";
                                break;
                        }
                        return value;
                    }
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
            del: true,
            search: true
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
