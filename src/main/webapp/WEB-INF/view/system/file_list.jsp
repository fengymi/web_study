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
            url : '<%=basePath%>file/manager/get_data',
            editurl:"<%=basePath%>file/manager/delete/files",
            sortname:"file_id",
            caption: "${title}",
            multiselect:true,
            colModel: [
                {
                    label:"id",
                    name: 'file_id',
                    index: 'file_id',
                    align: 'center',
                    key:true
                },{
                    label:"文件名",
                    name: 'name',
                    index: 'name',
                    align: 'center'
                },{
                    label:"类型",
                    name: 'ext',
                    index: 'ext',
                    align: 'center'
                },{
                    label:"上传时间",
                    name: 'upload_time',
                    index: 'upload_time',
                    align: 'center',
                    formatter : function(value){
                        return getDate(value,true);
                    }
                },
                {
                    label:'上传者',
                    name: 'author.nickname',
                    index: 'author_id',
                    align: 'center'
                },
                {
                    label:'大小',
                    name: 'length',
                    index: 'length',
                    align: 'center',
                    formatter: function (cellValue) {
                        return getFileSize(cellValue);
                    }
                },{
                    label:'状态',
                    name: 'status',
                    index: 'status',
                    align: 'center',
                    formatter: function (cellValue) {
                        var label_class = "label-info";
                        var label_text = "正常";

                        if(cellValue!=1){
                            label_class = "label-danger";
                            label_text = "异常";
                        }

                        return '<span class="label '+label_class+'">'+label_text+'</span>';
                    },
                    edittype:'select',
                    editoptions:{value:"1:正常;0:异常"},
                    editable: true
                },{
                    label:'操作',
                    align: 'center',
                    formatter: function (cellValue, options, rowObject) {
                        var oper = '<a title="下载文件" class="J_menuItem btn btn-white btn-bitbucket" href="file/download/'+rowObject.file_id+'"><i class="fa fa-download"></i></a>&nbsp;&nbsp;';
                        oper += '<a title="查看详情" class="J_menuItem btn btn-white btn-bitbucket" href="javascript:;"><i class="fa fa-search"></i></a>';

                        return oper;
                    }
                }
            ]
        }));

        table_data.jqGrid('navGrid', '#pager_list', {
            edit: false,
            add: false,
            del: true,
            search:false
        });

        $(window).bind('resize', function () {
            var width = $('.jqGrid_wrapper').width();
            $('#table_data').setGridWidth(width);
        });

        initGrid();
    });

    function changeStatus(obj,css,text) {
        var status  = $(obj).attr("status");
        $(obj).attr("status",status^1);
        $(obj).addClass(css[status^1]);
        $(obj).removeClass(css[status]);
        $(obj).html(text[status^1]);
    }
    /**
     * 计算文件大小
     * @type {string[]}
     */
    var sizeUnit = ["B","KB","MB","GB","TB"];//文件大小单位
    function getFileSize(fileSize) {
        var index = 0;
        while(fileSize/1024>1){
            fileSize = (fileSize/1024).toFixed(2);
            index++;
        }
        return fileSize+sizeUnit[index<sizeUnit.length?index:sizeUnit.length];
    }
</script>




</body>

</html>
