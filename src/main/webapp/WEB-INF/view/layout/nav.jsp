<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--左侧导航栏--%>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="nav-close"><i class="fa fa-times-circle"></i>
    </div>
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-book"></i>
                                        <strong class="font-bold">Admin</strong>
                                    </span>
                                </span>
                    </a>
                </div>
                <div class="logo-element">webAdmin
                </div>
            </li>
            <c:forEach var="menu" items="${sessionScope.sessionUser.menus}">
                <c:choose>
                    <c:when test="${menu.type=='0'}">
                        <li>
                            <a class="J_menuItem" href="${menu.urls[0].url}">
                                    ${menu.menu_icon}
                                <span class="nav-label">${menu.name}</span>
                            </a>
                        </li>
                    </c:when>
                    <c:when test="${menu.type=='1'}">
                        <li>
                            <a href="#">
                                ${menu.menu_icon}
                                <span class="nav-label">${menu.name}</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                            <c:forEach var="url" items="${menu.urls}">
                                <li>
                                    <a class="J_menuItem" href="${url.url}">
                                        ${url.permission_name}
                                    </a>
                                </li>
                            </c:forEach>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </c:forEach>

            <%--<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">--%>
                <%--<span class="ng-scope">系统管理</span>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a class="J_menuItem" href="admin/index">--%>
                    <%--<i class="fa fa-home"></i>--%>
                    <%--<span class="nav-label">主页</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a class="J_menuItem" href="system/menu/list">--%>
                    <%--<i class="fa fa-home"></i>--%>
                    <%--<span class="nav-label">菜单管理</span>--%>
                <%--</a>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-server"></i>--%>
                    <%--<span class="nav-label">服务器</span>--%>
                    <%--<span class="fa arrow"></span>--%>
                <%--</a>--%>
                <%--<ul class="nav nav-second-level">--%>
                    <%--<li>--%>
                        <%--<a class="J_menuItem" href="system/server/list">代理服务器</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a class="J_menuItem" href="system/machine/list">远程虚拟机</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a class="J_menuItem" href="system/machine_user/list">虚拟机登录账号</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a href="javascript:;">--%>
                    <%--<i class="fa fa-user-secret"></i> <span class="nav-label">用户管理 </span><span class="fa arrow"></span>--%>
                <%--</a>--%>
                <%--<ul class="nav nav-second-level">--%>
                    <%--<li><a class="J_menuItem" href="system/user/list">系统用户</a></li>--%>
                    <%--<li><a class="J_menuItem" href="system/user/list_common">一般用户</a></li>--%>
                    <%--<li><a class="J_menuItem" href="system/role/list">角色管理</a></li>--%>
                    <%--<li><a class="J_menuItem" href="system/permission/list">权限管理</a></li>--%>
                <%--</ul>--%>
            <%--</li>--%>
        </ul>
    </div>
</nav>
<!--左侧导航结束-->