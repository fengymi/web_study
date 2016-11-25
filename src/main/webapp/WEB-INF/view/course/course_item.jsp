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
        .course_item{
            /*background: #ccc351;*/
            line-height: 30px;
        }
        .course_item table{
            width: 100%;
            line-height: 30px;
            border: 1px solid rgb(231, 231, 231);
            text-align: center;
        }
        .course_item table tHead tr th{
            text-align: center;
            width: 16.66%;
            border-right: solid 1px rgb(231, 231, 231);

        }
        .course_item table tBody tr{
            border-top: solid 1px rgb(231, 231, 231);
        }
        .course_item table tBody tr td{
            width: 16.66%;
            border-right: solid 1px rgb(231, 231, 231);
            padding: 5px 0;
        }
        .course_item table tBody tr td button{
            margin-bottom: 0 !important;
        }
        .course_item input{
            line-height: 30px;
            text-align: center;
            border: 0;
            width: 90%;
        }

        .file-progress-content{
            width: 80%;height:30px;float: left;
        }
        .file-progress-text{
            width: 20%;float: left;overflow: hidden;
        }

        /*.course_item ul{}*/
        /*.course_item_title{*/
            /*font-weight: 600;*/
            /*font-size: 16px;*/
        /*}*/
        /*.course_item :after{*/
            /*content: " ";*/
            /*display: block;*/
            /*clear: both;*/
        /*}*/
        /*.course_item ul li {*/
            /*list-style-type:none;*/
            /*width: 16.6666%;*/
            /*float: left;*/
            /*text-align: center;*/
        /*}*/
    </style>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${title}</h5>
                    <div class="ibox-tools">
                        <button type="button" class="btn btn-success btn-xs">删除该课程</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row form-body form-horizontal m-t">
                        <div class="col-md-12">
                            <form action="course_manager/course_update" method="post">
                                <input type="hidden" name="img_url" value="${course.img_url}" />
                                <input type="hidden" name="img_id"  value="${course.img_id}" />
                                <input type="hidden" name="course_id"  value="${course.course_id}" />
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">课程名称：</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="course_name" value="${course.course_name}" class="form-control" placeholder="请输入课程名称" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">主讲人：</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="course_author" value="${course.course_author}" class="form-control" placeholder="课程主讲人" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">语言：</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="course_language" style="height: 36px;">
                                            <option value="">请选择相应的开发语言</option>
                                            <c:forEach var="language" items="${languages}">
                                                <option value="${language.l_id}" <c:if test="${language.name==course.language}">selected</c:if> >${language.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">课程描述：</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="course_desc" maxlength="1000" placeholder="对该课程的相应介绍" rows="4">${course.course_desc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">课程封面：</label>
                                    <div class="col-sm-10">
                                        <div id="picker">封面修改</div>
                                        <div style="position: relative;width: 216px;height: 120px;border: 1px dashed #c0c0c0;border-radius: 5px;">
                                            <div id="img_nav" style="position: absolute;left: 0;top:0;width: 100%;height: 100%;text-align: center;line-height: 120px;background:rgba(0, 0, 0, 0.3);color: #ffffff;display: none">
                                                <span></span>
                                            </div>
                                            <img id="img" src="${applicationScope.fileHost}/${course.img_url}" style="height: 100%;width:100%">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">章节：</label>
                                    <div style="display: none">
                                        <div id="file_button"></div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="course_item">
                                            <table>
                                                <tHead>
                                                    <tr>
                                                        <th>序号</th>
                                                        <th>标题</th>
                                                        <th>描述</th>
                                                        <th>视频</th>
                                                        <th>资料</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </tHead>
                                                <tBody>
                                                    <c:forEach var="courseItem" items="${course.courseItems}">
                                                        <tr>
                                                            <td>
                                                                <input name="curriculum_num" value="${courseItem.curriculum_num}" type="number" required/>
                                                            </td>
                                                            <td><input name="name" value="${courseItem.name}" required /></td>
                                                            <td><input name="desc" value="${courseItem.desc}" /></td>
                                                            <td>
                                                                <input type="hidden" name="video_url" value="${courseItem.video_url}" />
                                                                <input type="hidden" name="video_id" value="${courseItem.video_id}" />
                                                                <c:if test="${courseItem.video_url==null}">
                                                                    <button class="btn btn-success" title="上传" type="button" onclick="changeButton(this)">
                                                                        <i class="fa fa-upload"></i>
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${courseItem.video_url!=null}">
                                                                    <button class="btn btn-info" title="预览/下载" type="button" onclick="lookFile('${courseItem.video_url}')">
                                                                        <i class="fa fa-eye"></i>
                                                                    </button>
                                                                    <button class="btn btn-success" title="重新上传" type="button" onclick="changeButton(this)">
                                                                        <i class="fa fa-refresh"></i>
                                                                    </button>
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                <input type="hidden" name="resource_url" value="${courseItem.resource_url}" />
                                                                <input type="hidden" name="resource_id" value="${courseItem.resource_id}" />
                                                                <c:if test="${courseItem.video_url==null}">
                                                                    <button class="btn btn-success" title="上传" type="button" onclick="changeButton(this)">
                                                                        <i class="fa fa-upload"></i>
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${courseItem.video_url!=null}">
                                                                    <button class="btn btn-info" title="预览/下载" type="button" onclick="lookFile('${courseItem.resource_url}')">
                                                                        <i class="fa fa-eye"></i>
                                                                    </button>
                                                                    <button class="btn btn-success" title="重新上传" type="button" onclick="changeButton(this)">
                                                                        <i class="fa fa-refresh"></i>
                                                                    </button>
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                <button class="btn btn-primary" type="button" onclick="addCourseItem(this)">
                                                                    <i class="fa fa-arrow-up"></i>&nbsp;&nbsp;提交
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td><input name="curriculum_num" value="1" type="number" required/></td>
                                                        <td><input name="name" value="java环境搭建" required /></td>
                                                        <td><input name="desc" value="环境搭建教程" /></td>
                                                        <td>
                                                            <button class="btn btn-success" title="上传" type="button" onclick="changeButton(this)">
                                                                <i class="fa fa-upload"></i>
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-info" title="预览/下载" type="button" onclick="lookFile()">
                                                                <i class="fa fa-eye"></i>
                                                            </button>
                                                            <button class="btn btn-success" title="重新上传" type="button" onclick="changeButton(this)">
                                                                <i class="fa fa-refresh"></i>
                                                            </button>
                                                        </td>
                                                        <td>
                                                            <button class="btn btn-primary" type="button">
                                                                <i class="fa fa-arrow-up"></i>&nbsp;&nbsp;提交
                                                            </button>
                                                        </td>
                                                    </tr>

                                                </tBody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-10">
                                        <button  class="btn btn-primary" type="submit">课程修改</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<%@include file="../layout/main_js.jsp" %>
<script src="static/js/design/design.js"></script>
<script src="static/js/plugin/webuploader.min.js"></script>
<script src="static/plugin/layer/layer.js"></script>
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
    var uploader = WebUploader.create({
        // swf文件路径
        swf: '<%=basePath%>static/swf/Uploader.swf',
        // 文件接收服务端。
        server: '<%=basePath%>file/upload',
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id:'#picker',
            label:"封面修改",
            innerHTML: "封面修改",
            multiple:true
        },
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        },
        auto:true, // 自动上传
        thumb:{ //缩略图
            width: 216,
            height: 120,
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 100,
            // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
            allowMagnify: true,
            // 是否允许裁剪。
            crop: false
        },
        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });
    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        var $img = $("#img");
        $("#img_nav").fadeIn(100);

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, $img.parent().width(),  $img.parent().height() );
    });
    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        $("#img_nav").find("span").html((percentage*100).toFixed(0)+"%");
    });
    uploader.on( 'uploadSuccess', function( file,response ) {
        $("input[name='img_id']").val(response.file_id);
        $("input[name='img_url']").val(response.group+"/"+response.remote_name+"."+response.ext);
        var $img_nav = $("#img_nav");
        $img_nav.fadeOut(100);
        $img_nav.find("span").html("0%");
    });


    //视频文件上传

    var fileUpload = WebUploader.create({
        // swf文件路径
        swf: '<%=basePath%>static/swf/Uploader.swf',
        // 文件接收服务端。
        server: '<%=basePath%>file/upload',
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id:'#file_button',
            label:"视频文件",
            innerHTML: "视频文件",
            multiple:true
        },
        auto:true
    });
    var $td;
    var $file_button;

    //上传时
    var wait_up = '   <div class="file-progress-content">'+
                '       <div class="progress progress-striped active" style="margin-bottom: 0;margin-top: 5px;">'+
                '           <div style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar">'+
                '               <span class="sr-only"></span>'+
                '           </div>'+
                '       </div>'+
                '   </div>'+
                '   <div class="file-progress-text">'+
                '       <span>等待中</span>'+
                '   </div>';

    // 当有文件添加进来的时候
    fileUpload.on( 'fileQueued', function( file ) {
        $td.attr("id","td_"+file.id);
        $td.html(wait_up);
    });

    fileUpload.on( 'uploadError', function( file ) {
        toastr["error"](file.name+"上传失败");
        $("#td_"+file.id).html(getUpAfterInfo());
    });

    //上传成功
    fileUpload.on( 'uploadSuccess', function( file,response ) {
        var $now_td = $("#td_"+file.id);
        toastr["info"](file.name+"上传成功");
        $now_td.html(getUpAfterInfo(response.group+"/"+response.remote_name));
    });

    // 文件上传过程中创建进度条实时显示。
    fileUpload.on( 'uploadProgress', function( file, percentage ) {
        var $now_td = $("#td_"+file.id);
        $now_td.find(".progress-bar").css("width",percentage*100+"%");
        $now_td.find(".file-progress-text").find("span").html((percentage*100).toFixed(0)+"%");
    });

    function changeButton(obj) {
        $td=$(obj).parent("td");
        if(!$file_button){
            $file_button=$("#file_button").find("div").eq(1).find("input");
        }
        $file_button.click();
    }

    function getUpAfterInfo(fileId) {
        return  '   <button class="btn btn-info" title="预览/下载" type="button" onclick="lookFile(\''+fileId+'\')">'+
                '       <i class="fa fa-eye"></i>'+
                '   </button>'+
                '   <button class="btn btn-success" title="重新上传" type="button" onclick="changeButton(this)">'+
                '       <i class="fa fa-refresh"></i>'+
                '   </button>';
    }

    function lookFile(fileId) {
        fileId = "group1/M00/00/01/cxxD0Vg2msmAALE4AC_ghog0QZM505.mp4";
        if(fileId.substring(fileId.lastIndexOf(".")+1).toLowerCase()=="mp4"){

        }
        layer.open({
            type: 2,
            title: false,
            shade: 0.8,
            area: ['630px','360px'],
            closeBtn: 0,
            fixed:true,
            resize:false,
            shadeClose: true,
            content: ['<%=basePath%>static/video.jsp?filePath='+fileId+'&imgUrl='+$("input[name='img_url']").val(),'no']
        });
    }

    function addCourseItem(obj) {
        var $tr = $(obj).parents("tr");
        var inputs = $tr.find("input");
        var data = "course_id=${course.course_id}";
        for(var i=0;i<inputs.length;i++){
            data += "&"+$(inputs[i]).attr("name")+"="+$(inputs[i]).val()
        }
        $.ajax({
            url:"course_manager/add_item",
            method:"post",
            dataType:"text",
            data:data,
            success:function () {

            }
        });
    }
</script>
</html>
