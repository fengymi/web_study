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
            url : '<%=basePath%>system/role/get_data',
            editurl:"<%=basePath%>system/role/edit_data",
            sortname:"role_id",
            colModel: [
                {
                    label:"角色id",
                    name: 'role_id',
                    index: 'role_id',
                    editable: false,
                    align: 'center',
                    key:true
                },
                {
                    label:'角色名称',
                    name: 'role_name',
                    index: 'role_name',
                    align: 'center',
                    editable: true
                },
                {
                    label:'角色类型',
                    name: 'is_sys',
                    index: 'is_sys',
                    align: 'center',
                    editrules:{required:true,number:true},
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class = "label-info";
                        var label_text = "普通角色";
                        if(rowObject.is_sys==1){
                            label_class = "label-danger";
                            label_text = "系统角色";
                        }
                        return '<span class="label '+label_class+'">'+label_text+'</span>';
                    },
                    edittype:'select',
                    editoptions:{value:"1:系统角色;0:普通角色"},
                    editable: true
                },
                {
                    label:'状态',
                    name: 'available',
                    index: 'available',
                    align: 'center',
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class = "label-info";
                        var label_text = "正常";
                        if(rowObject.available==0){
                            label_class = "label-danger";
                            label_text = "禁用";
                        }
                        return '<span class="label '+label_class+'">'+label_text+'</span>';
                    },
                    edittype:'select',
                    editoptions:{value:"1:正常;0:禁用"},
                    editable: true
                },
                {
                    label:'操作',
                    align: 'center',
                    sortable: false,
                    editable: false,
                    formatter: function (cellvalue, options, rowObject) {
                        var oper = '<a title="查看用户" class="J_menuItem btn btn-white btn-bitbucket" href="system/user/list?is_sys='+rowObject.is_sys+'&role_id='+rowObject.role_id+'"><i class="fa fa-users"></i></a>&nbsp;&nbsp;';
                        oper += '<a title="分配权限" class="J_menuItem btn btn-white btn-bitbucket" href="system/role/manager?role_id='+rowObject.role_id+'"><i class="fa fa-key"></i></a>';

                        return oper;
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
