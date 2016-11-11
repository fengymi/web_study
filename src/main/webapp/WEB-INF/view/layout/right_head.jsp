<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--${sessionScope.user}-->
<div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="javascript:;"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li class="m-t-xs">
                        <div class="dropdown-messages-box">
                            <a href="static/admin/profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="static/admin/img/a7.jpg">
                            </a>
                            <div class="media-body">
                                <small class="pull-right">46小时前</small>
                                <strong>小四</strong> 是不是只有我死了,你们才不骂爵迹
                                <br>
                                <small class="text-muted">3天前 2014.11.8</small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="dropdown-messages-box">
                            <a href="static/admin/profile.html" class="pull-left">
                                <img alt="image" class="img-circle" src="static/admin/img/a4.jpg">
                            </a>
                            <div class="media-body ">
                                <small class="pull-right text-navy">25小时前</small>
                                <strong>二愣子</strong> 呵呵
                                <br>
                                <small class="text-muted">昨天</small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a class="J_menuItem" href="static/admin/mailbox.html">
                                <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="static/admin/mailbox.html">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                <span class="pull-right text-muted small">4分钟前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="static/admin/profile.html">
                            <div>
                                <i class="fa fa-qq fa-fw"></i> 3条新回复
                                <span class="pull-right text-muted small">12分钟钱</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a class="J_menuItem" href="static/admin/notifications.html">
                                <strong>查看所有 </strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="index/logout">退出登录</a>
            </li>
        </ul>
    </nav>
</div>