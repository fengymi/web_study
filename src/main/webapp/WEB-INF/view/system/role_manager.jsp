<%-- Date: 16-11-3--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <base href="<%=basePath%>">
    <title>${title}</title>
    <%@include file="../layout/style.jsp" %>
    <link rel="stylesheet" href="static/css/plugin/chosen.min.css">
</head>
<body>


<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">

            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${title}</h5>
                </div>
                <div class="ibox-content">
                    <form id="updatePermission" class="form-horizontal m-t" onsubmit="return updateUser(this)">
                        <input type="hidden" name="roleId" value="${role.id}" />
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名称：</label>
                            <div class="col-sm-8">
                                <input name="role_name" value="${role.name}" type="text" class="form-control" required=""
                                       aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">类型：</label>
                            <div class="col-sm-8">

                                <div class="radio">
                                    <label>
                                        <input value="0" <c:if test="${role.isSys==0}" >checked</c:if> name="isSys" type="radio">普通用户
                                    </label>
                                    <label>
                                        <input value="1" <c:if test="${role.isSys==1}" >checked</c:if> name="isSys" type="radio">系统用户
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态：</label>
                            <div class="col-sm-8">

                                <div class="radio">
                                    <label>
                                        <input value="0" <c:if test="${role.available==0}" >checked</c:if> name="available" type="radio">禁用
                                    </label>
                                    <label>
                                        <input value="1" <c:if test="${role.available==1}" >checked</c:if> name="available" type="radio">正常
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">权限：</label>
                            <div class="col-sm-8">
                                <select data-placeholder="为角色添加权限" id="permission_id" style="width:100%;" multiple class="chosen-select-no-results" tabindex="11">
                                    <option value=""></option>
                                    <c:forEach var="permission" items="${permissions}">
                                        <option value="${permission.permission_id}" <c:if test="${permission.isIn==true}">selected</c:if> >${permission.permission_name}:${permission.url}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button type="submit" class="btn btn-w-m btn-info">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <%@include file="../layout/main_js.jsp"%>
<script src="static/js/plugin/chosen.jquery.min.js" type="text/javascript"></script>
<script src="static/js/design/design.js" type="text/javascript"></script>
    <script type="text/javascript">
        initToast();
        var oldPermissions = [${oldPermissions}];
        var config = {
            '.chosen-select-no-results': {no_results_text: '没有可用权限'}
        };
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }

        function updateUser(form) {
            var permission_ids = $("#permission_id").val();
            var addPermissions = [];
            var delPermissions = [];
            var role_ids_str = permission_ids?permission_ids.toString():"";
            var oldRoles_str = oldPermissions?oldPermissions.toString():"";
            for(var i in oldPermissions){
                if(role_ids_str.indexOf(oldPermissions[i])==-1){
                    delPermissions.push(oldPermissions[i]);
                }
            }
            for(i in permission_ids){
                if(oldRoles_str.indexOf(permission_ids[i])==-1){
                    addPermissions.push(permission_ids[i]);
                }
            }
            if($(form).find("input[name='delPermissions']").length==0){
                $(form).append("<input type='hidden' name='delPermissions' value='"+delPermissions+"' />");
                $(form).append("<input type='hidden' name='addPermissions' value='"+addPermissions+"' />");
            }
            $.ajax({
                url:"<%=basePath%>system/role/update",
                data:$(form).serialize(),
                type:"post",
                success:function (result) {
                    toastr["info"](result);
                    oldPermissions = permission_ids;
                },
                error:function () {
                    toastr["error"]("修改失败");
                }
            });
            return false;
        }
    </script>
</body>
</html>