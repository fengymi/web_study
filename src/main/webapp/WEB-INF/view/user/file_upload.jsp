<%-- User: fengymi--%>
<%-- Date: 16-11-14--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <%@include file="../layout/style.jsp" %>
    <link href="static/css/plugin/webuploader.css" rel="stylesheet">

    <style type="text/css">
        /*文件拖动*/
        #dnd_file{
            height: 300px;
            border: dashed 3px #c0c0c0;
            border-radius: 5px;
            font-size: 20px;
            line-height: 300px;
            text-align: center;
            color: #cccccc;
            font-weight: 700;
            cursor:crosshair;
        }
        #dnd_file span{cursor:pointer;}
        /*待上传文件列表*/
        #file_list:after{content: " ";display: block;clear: both;}
        #files_status:after{content: " ";display: block;clear: both;}

        .tools-bar{}
        .tools-bar:after{content: " ";display: block;clear: both;}
        .file-tools{
            display: inline-block;
            float: right;
            margin-top: 0;
            margin-right: 5px;
            padding: 0;
            cursor: pointer;
        }

        .upload-title{
            position: absolute;left: 0;right: 0;
            text-align: center;
            color: #c0c0c0;
        }
        .upload-title .success{
            color: #676a6c;
        }
        .upload-title .warning{
            color: #ee3939;
        }
    </style>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div id="files_status">
                    <div class="col-sm-3">
                        成功:<span>0</span>
                    </div>
                    <div class="col-sm-3">
                        失败:<span>0</span>
                    </div>
                    <div class="col-sm-3">
                        取消:<span>0</span>
                    </div>
                    <div class="col-sm-3">
                        等待:<span>0</span>
                    </div>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div id="dnd_file">
                    <span title="点击上传" onclick="$('input[name=\'file\']').click()">将需要上传的文件拖至此处</span>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div id="picker" >选择文件</div>
                <button id="ctlBtn" class="btn btn-primary btn-block">上传文件</button>
            </div>
        </div>
        <div class="col-sm-9 animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div id="file_list">
                        <%--<div id="WU_FILE_0" class="file-box">--%>
                            <%--<div class="file">--%>
                                <%--<div class="tools-bar">--%>
                                    <%--<div class="file-tools">--%>
                                        <%--<i title="开始上传" class="fa fa-check"></i>--%>
                                        <%--<i title="删除文件" class="fa fa-times"></i>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="icon" style="padding: 0;height: 80px;"><i class="img-responsive fa fa-film"></i></div>--%>
                                <%--<div class="file-name"><span>文件名: iconfont.html</span><br>--%>
                                    <%--<small>大小: 5.96KB</small>--%>
                                <%--</div>--%>
                                <%--<div class="progress progress-striped active" style="margin-bottom: 2px;border: dotted 1px #c0c0c0">--%>
                                    <%--<div class="upload-title">--%>
                                        <%--<span class="success">等待上传</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="progress-bar" role="progressbar"></div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="../layout/main_js.jsp" %>
<script src="static/admin/js/content.js"></script>
<script src="static/js/plugin/webuploader.min.js"></script>
<script src="static/js/design/design.js"></script>
<%--<script src="static/js/plugin/webuploader.html5only.js"></script>--%>
<%--<script src="http://cdn.staticfile.org/webuploader/0.1.0/webuploader.js"></script>--%>

<script>
    initToast({
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "onclick": null,
        "showDuration": "400",
        "hideDuration": "1000",
        "timeOut": "2000",
        "extendedTimeOut": "500",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    var $list = $("#file_list");
    var uploader = WebUploader.create({

        // swf文件路径
        swf: 'static/swf/Uploader.swf',

        // 文件接收服务端。
        server: '<%=basePath%>file/upload',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id:'#picker',
            label:"点击选择文件",
            innerHTML: "请选择上传文件",
            multiple:true
        },
        dnd: "#dnd_file", //开启拖拽
        disableGlobalDnd:true, //禁止浏览器打开文件
//        auto: true,

        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });


    $("#ctlBtn").click(function () {
        uploader.upload();//上传文件
//        uploader.retry();
    });

    // 当有文件被添加进队列的时候
    uploader.on( 'fileQueued', function( file ) {
        $list.append(appendFileItem(file));
    });
    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        console.log(percentage);
        var $li = $( '#'+file.id ), $percent = $li.find('.progress .progress-bar');
        if(!$percent.length){
            var con ='      <div class="progress progress-striped active" style="margin-bottom: 2px;">'+
                    '           <div class="progress-bar" role="progressbar" style="background-color: #23b7e5"></div>'+
                    '       </div>';
            $li.find(".file").append(con);
        }
        /*else{
            if($li.find(".progress").css("display")=="none"){
                $li.find(".progress").fadeIn();
            }
        }*/
        $li.find('.upload-title span').text('上传中..'+percentage+"%");
        $percent.css( 'width', percentage * 100 + '%' );
    });
    uploader.on( 'uploadSuccess', function( file ) {
        toastr["success"](file.name+"上传成功");
        removeFile(file);
    });

    uploader.on( 'uploadError', function( file ) {
        toastr["error"](file.name+"上传失败");
    });

    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').fadeOut();
        updateFilesStatus();
    });



    /**
     * 更新上传文件数量显示
     */
    var files_status = $("#files_status").find("span");
    function updateFilesStatus() {
        var status = uploader.getStats();
        $(files_status[0]).html(status.successNum);
        $(files_status[1]).html(status.uploadFailNum);
        $(files_status[2]).html(status.cancelNum);
        $(files_status[3]).html(status.queueNum);
    }
    /**
     * 删除列表中的文件
     * @param file 文件或者文件id
     */
    function removeFile(file) {
        uploader.removeFile(file,true);//从队列删除
        uploader.cancelFile(file);
        var fileView;
        if(file.id){
            fileView = $("#"+file.id);
        }else {
            fileView = $("#"+file);
        }
        fileView.remove();
        updateFilesStatus();
    }
    /**
     * 添加一个文件到列表
     * @param file
     * @returns {string}
     */
    function appendFileItem(file) {
        var item =  '<div id="'+file.id+'" class="file-box">'+
                    '   <div class="file">' +
                    '      <div class="tools-bar">'+
                    '           <div class="file-tools">'+
                    '               <i title="上传" onclick="uploader.upload(\''+file.id+'\')" class="fa fa-check"></i>'+
                    '               <i title="删除" onclick="removeFile(\''+file.id+'\')" class="fa fa-times"></i>'+
                    '           </div>'+
                    '       </div>'+
                    '       <div class="icon" style="padding: 0;height: 80px;">'+
                                getFileIcon(file.name)+
                    '       </div>'+
                    '       <div class="file-name">'+
                    '           <span>文件名: '+file.name+'</span><br/>'+
                    '           <small>大小: '+getFileSize(file.size)+'</small>'+
                    '       </div>'+
//                    '       <div class="progress progress-striped active" style="margin-bottom: 2px;border: dotted 1px #c0c0c0">'+
//                    '           <div class="upload-title">'+
//                    '               <span class="success">等待上传</span>'+
//                    '           </div>'+
//                    '           <div class="progress-bar" role="progressbar"></div>'+
//                    '       </div>'+
                    '   </div>';
            item += '</div>';
        return item;
    }

    /**
     * 获取文件图标
     * @param fileName
     * @returns {string}
     */
    function getFileIcon(fileName) {
        return '<i class="img-responsive fa fa-film"></i>';
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
</html>
