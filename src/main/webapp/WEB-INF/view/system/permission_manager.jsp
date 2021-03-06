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
                    <form id="updateUser" class="form-horizontal m-t" onsubmit="return updateManager(this)">
                        <input type="hidden" name="permissionId" value="${permission.id}" />
                        <input type="hidden" name="menuId" value="${permission.menu_id}" />
                        <input id="addIds" name="addRoles" type="hidden" />
                        <input id="delIds" name="delRoles" type="hidden" />
                        <div class="form-group">
                            <label class="col-sm-3 control-label">名称：</label>
                            <div class="col-sm-8">
                                <input name="permissionName" value="${permission.permissionName}" type="text" class="form-control" required=""
                                       aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">url：</label>
                            <div class="col-sm-8">
                                <input name="url" type="text" class="form-control" value="${permission.url}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">状态：</label>
                            <div class="col-sm-8">

                                <div class="radio">
                                    <label>
                                        <input value="1" <c:if test="${permission.available==1}" >checked</c:if> name="available" type="radio">正常
                                    </label>
                                    <label>
                                        <input value="0" <c:if test="${permission.available==0}" >checked</c:if> name="available" type="radio">禁用
                                    </label>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">角色：</label>
                            <div class="col-sm-8">
                                <select data-placeholder="为权限确定角色" id="role_id" style="width:100%;" multiple class="chosen-select-no-results" tabindex="11">
                                    <option value=""></option>
                                    <option value=""></option>
                                    <optgroup label="系统角色">
                                        <c:forEach var="role" items="${sysRoles}">
                                            <option value="${role.role_id}" <c:if test="${role.isIn==true}">selected</c:if> >${role.role_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                    <optgroup label="普通角色">
                                        <c:forEach var="role" items="${oRoles}">
                                            <option value="${role.role_id}" <c:if test="${role.isIn==true}">selected</c:if> >${role.role_name}</option>
                                        </c:forEach>
                                    </optgroup>
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
        initSelector();
        var oldIds = [${oldRolesId}]||"";

        function updateManager(form) {
            setUpdateData({
                selectedIds:$("#role_id").val(),
                oldIds:oldIds,
                addData:$("#addIds"),
                delData:$("#delIds"),
                url:"<%=basePath%>system/permission/update",
                form:$(form),
                success:function () {
                    oldIds = $("#role_id").val();
                }
            });
            return false;
        }
    </script>
</body>
</html>