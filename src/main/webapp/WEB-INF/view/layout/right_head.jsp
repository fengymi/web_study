<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--${sessionScope.user}-->
<div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="javascript:;"><i class="fa fa-bars"></i> </a>
            <%--<form role="search" class="navbar-form-custom" method="post" action="search_results.html">--%>
                <%--<div class="form-group">--%>
                    <%--<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">--%>
                <%--</div>--%>
            <%--</form>--%>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    ${sessionScope.sessionUser.nickname}
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <%--<li>--%>
                        <%--<a href="static/admin/mailbox.html">--%>
                            <%--<span><i class="fa fa-envelope fa-fw"></i>&nbsp;个人信息</span>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <li>
                        <a href="index/logout">
                            <span><i class="fa fa-sign-out fa-fw"></i>&nbsp;退出登录</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</div>