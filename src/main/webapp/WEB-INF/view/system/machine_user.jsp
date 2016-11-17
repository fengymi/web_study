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
            url : '<%=basePath%>system/machine_user/get_data?machine_id=${machine_id}',
            editurl:"<%=basePath%>system/machine_user/edit_data",
            sortname:"mu_id",
            caption: "${title}",
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
                    editrules:{required:true,number:true},
                    editable: true,
                    edittype:'select',
                    editoptions:{
                        dataUrl:'<%=basePath%>system/machine/get_select',
                        buildSelect: function (response) {
                            var data = eval(response);
                            return selectFormat(data,"machine_id","name","暂无可用虚拟机","${machine_id}");
                        }
                    },
                    sorttype: "int",
                    align: 'center'
                },
                {
                    label:'账号',
                    name: 'username',
                    index: 'username',
                    editrules:{required:true},
                    align: 'center',
                    editable: true
                },
                {
                    label:'密码',
                    name: 'password',
                    index: 'password',
                    editrules:{required:true},
                    align: 'center',
                    editable: true
                },
                {
                    label:'状态',
                    name: 'status',
                    index: 'status',
                    align: 'center',
                    editrules:{required:true},
                    editable: true,
                    edittype:'select',
                    editoptions:{value:"1:可用;2:禁用"},
                    formatter: function (cellvalue, options, rowObject) {
                        var label_class;
                        var label_text;
                        switch (cellvalue){
                            case "1":
                                label_class = "label-info";
                                label_text = "可用";
                                break;
                            case "0":
                                label_class = "label-warning";
                                label_text = "使用中";
                                break;
                            default :
                                label_class = "label-danger";
                                label_text = "异常";
                                break;
                        }
                        return '<span class="label '+label_class+'">'+label_text+'</span>';;
                    }
                }
            ]
        });
    });
</script>




</body>

</html>
