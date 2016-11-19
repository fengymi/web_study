<%-- User: fengymi--%>
<%-- Date: 16-11-3--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--360浏览器优先以webkit内核解析-->


    <title>主页</title>

    <%@include file="../layout/style.jsp"%>


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title" style="border-bottom:none;background:#fff;">
                    <h5>服务器状态&nbsp;<span id="num"></span></h5>
                </div>
                <div class="ibox-content" style="border-top:none;">
                    <div id="main" style="height:400px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<%@include file="../layout/main_js.jsp"%>
<script src="static/js/plugin/echarts.js"></script>
<script src="static/js/design/design.js"></script>
<!--flotdemo-->
<script type="text/javascript">
    $(function() {
        $.ajax({
            url: "<%=basePath%>index/get_user_num",
            success: function (data) {
                var con = "在线浏览人数:" + data.visitorNum + ";在线用户:" + data.userNum + ";连接数:" + data.connectionNum;
                $("#num").text(con);
            }
        });


        var myChart = echarts.init(document.getElementById('main'));

        var xAxis = [];
        for(var i=0;i<60;i++){
            xAxis[i] = i+1;
        }
        var yAxis = [];
        myChart.setOption({
            grid:{
                containLabel:true
            },
            title: {
                text: '服务器监控'
            },
            tooltip: {
                trigger:"axis",
                formatter:"时间:{b0}<br/>{a0}:{c0}%"
            },
            legend: {
                data:['CPU使用率']
            },
            xAxis: {
                data: xAxis
            },
            yAxis: {
                name:"CPU使用率%",
                data:[1,2,3,4,5,6,7,8],
                nameGap:15,
                interval:5,
                boundaryGap:[0,0]
            },
            series:[{
                name:'CPU使用率',
                type:'line',
                areaStyle: {
                    normal: {}
                }
            }],
            color:["#98F5FF"]
        });

        function updateData() {
            console.log("开始执行");
            $.ajax({
                url:'<%=basePath%>admin/get_info',
                async:false,
                success:function (data) {
                    myChart.setOption({
                        series: [{
                            data: data
                        }]
                    });

                }
            });

        }
        updateData();

//        setInterval(function () {
//            updateData();
//        },10000);


    });

</script>
</body>

</html>