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
            url : '<%=basePath%>system/menu/get_data',
            editurl:"<%=basePath%>system/menu/edit_data",
            sortname:"menu_id",
            colModel: [
                {
                    label:"菜单id",
                    name: 'menu_id',
                    index: 'menu_id',
                    editable: false,
                    align: 'center',
                    key:true
                },
                {
                    label:'菜单名称',
                    name: 'name',
                    index: 'name',
                    align: 'center',
                    editable: true
                },{
                    label:'图标',
                    name: 'menu_icon',
                    index: 'menu_icon',
                    align: 'center',
                    editable: true
                },
                {
                    label:'类型',
                    name: 'type',
                    index: 'type',
                    align: 'center',
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class = "label-info";
                        var label_text = "按钮";
                        if(rowObject.type==0){
                            label_class = "label-success";
                            label_text = "链接";
                        }
                        return '<span class="label '+label_class+'">'+label_text+'</span>';
                    },
                    edittype:'select',
                    editoptions:{value:"1:按钮;0:链接"},
                    editable: true
                }
            ]
        });
    });
</script>




</body>

</html>
