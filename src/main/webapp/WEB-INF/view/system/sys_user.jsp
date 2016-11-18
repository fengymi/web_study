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
        initGrid({
            url : '<%=basePath%>system/user/get_data?is_sys=${is_sys}&role_id=${role_id}',
            editurl:"<%=basePath%>system/user/edit_data",
            sortname:"user_id",
            colModel: [
                {
                    label:"用户id",
                    name: 'user_id',
                    index: 'user_id',
                    editable: false,
                    align: 'center',
                    key:true
                },
                {
                    label:'用户',
                    name: 'nickname',
                    index: 'nickname',
                    align: 'center',
                    editable: true
                },
                {
                    label:'用户名',
                    name: 'username',
                    index: 'username',
                    align: 'center',
                    editable: true
                },
                {
                    label:'状态',
                    name: 'locked',
                    index: 'locked',
                    align: 'center',
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class = "label-info";
                        var label_text = "正常";
                        if(rowObject.locked==1){
                            label_class = "label-danger";
                            label_text = "锁定";
                        }
                        return '<span class="label '+label_class+'">'+label_text+'</span>';
                    },
                    edittype:'select',
                    editoptions:{value:"0:正常;1:锁定"},
                    editable: true
                },
                {
                    label:'操作',
                    align: 'center',
                    sortable: false,
                    editable: false,
                    formatter: function (cellvalue, options, rowObject) {
                        var id = rowObject.user_id;
                        var con =   '<a title="分配角色" class="J_menuItem btn btn-white btn-bitbucket" href="system/user/manager?user_id='+id+'">' +
                                '   <i class="fa fa-users"></i>'+
                                '</a>';
                        return con;
                    }
                }
            ]
        });
    });
</script>




</body>

</html>
