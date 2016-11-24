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
    <style type="text/css">
        #search_table_data{display: table-cell;}
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
<script src="static/admin/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="static/admin/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>

<!-- 自定义js -->
<script src="static/admin/js/content.js"></script>
<script src="static/js/design/design.js"></script>

<script>
    $(document).ready(function () {
        var table_data = $("#table_data");
        $.jgrid.defaults.styleUI = 'Bootstrap';
        table_data.jqGrid(getJqGirdInit({
            url : '<%=basePath%>course_manager/get_data',
            <%--editurl:"<%=basePath%>course_manager/delete",--%>
            sortname:"course_id",
            caption: "${title}",
//            multiselect:true,
            colModel: [
                {
                    label:"id",
                    name: 'course_id',
                    index: 'course_id',
                    align: 'center',
                    key:true
                },{
                    label:"课程名称",
                    name: 'course_name',
                    index: 'course_name',
                    align: 'center'
                },{
                    label:"主讲人",
                    name: 'course_author',
                    index: 'course_author',
                    align: 'center'
                },{
                    label:"语言类型",
                    name: 'language',
                    index: 'course_language',
                    align: 'center'
                },{
                    label:"发布人",
                    name: 'user.nickname',
                    index: 'c_user_id',
                    align: 'center'
                },{
                    label:"章节数",
                    name: 'courseItems.length',
                    sortable: false,
                    editable: false,
                    align: 'center'
                },{
                    label:'操作',
                    align: 'center',
                    sortable: false,
                    editable: false,
                    formatter: function (cellValue, options, rowObject) {
                        var oper = '<a title="查看详情" href="course_manager/info/'+rowObject.course_id+'" class="J_menuItem btn btn-white btn-bitbucket" href="javascript:;"><i class="fa fa-search"></i></a>';
                        return oper;
                    }
                }
            ]
        }));

        table_data.jqGrid('navGrid', '#pager_list', {
            edit: false,
            add: false,
            del: false,
            search:false
        });

        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_data').setGridWidth(width);
        });

        initGrid();
    });
</script>




</body>

</html>
