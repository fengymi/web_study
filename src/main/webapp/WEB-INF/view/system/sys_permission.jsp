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
                    <div class="ibox-tools">
                        <button onclick="permissionReset()" title="修改后需要重置才能生效" type="button" class="btn btn-success btn-xs">重置权限</button>
                    </div>
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
    var menu = ${menus};
    $(document).ready(function () {
        initToast();
        initGrid({
            url : '<%=basePath%>system/permission/get_data?available=${available}&role_id=${role_id}',
            editurl:"<%=basePath%>system/permission/edit_data",
            sortname:"permission_id",
            grouping:true,
            groupingView: {
                groupField: ['menu_id'],
                groupColumnShow: [false],
                groupText: ['<b>{0}</b>'],
                groupCollapse: true
            },
            colModel: [
                {
                    label:"权限id",
                    name: 'permission_id',
                    index: 'permission_id',
                    editable: false,
                    align: 'center',
                    key:true
                },
                {
                    label:'权限名称',
                    name: 'permission_name',
                    index: 'permission_name',
                    align: 'center',
                    editable: true
                },
                {
                    label:'地址',
                    name: 'url',
                    index: 'url',
                    align: 'center',
                    editable: true
                },{
                    label:'菜单',
                    name: 'menu_id',
                    index: 'menu_id',
                    hidden:true,
                    formatter: function (cellvalue, options, rowObject) {
                        var result = menu[cellvalue];
                        if(!result){
                            result = "其它"
                        }
                        return result;
                    },
                    editrules:{edithidden:true,required:true,number:true},
                    editable: true,
                    edittype:'select',
                    editoptions:{
                        dataUrl:'<%=basePath%>system/menu/get_select',
                        buildSelect: function (response) {
                            var data = eval(response);
                            return selectFormat(data,"menu_id","name","暂无可用菜单");
                        }
                    },
                    sorttype: "int",
                    align: 'center'
                },
                {
                    label:'状态',
                    name: 'p_available',
                    index: 'p_available',
                    align: 'center',
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class = "label-info";
                        var label_text = "正常";
                        if(rowObject.p_available==0){
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
                        var id = rowObject.permission_id;
                        var con ='  <a title="分配角色" class="J_menuItem" href="system/permission/manager?permission_id='+id+'">' +
                                '       <i class="fa fa-user-secret"></i>'+
                                '   </a>';
                        return con;
                    }
                }
            ]
        });
    });
    function permissionReset() {
        $.ajax({
            url:"<%=basePath%>system/permission/reset",
            success:function () {
                toastr["info"]("重置完成");
            }
        });
    }
</script>




</body>

</html>
