<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--${sessionScope.user}-->
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
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">webAdmin</strong>
                                    </span>
                                </span>
                    </a>
                </div>
                <div class="logo-element">hAdmin
                </div>
            </li>
            <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span class="ng-scope">系统管理</span>
            </li>
            <li>
                <a class="J_menuItem" href="admin/index">
                    <i class="fa fa-home"></i>
                    <span class="nav-label">主页</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa fa-server"></i>
                    <span class="nav-label">服务器</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem" href="system/server/list">代理服务器</a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="system/machine/list">远程虚拟机</a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="system/machine_user/list">虚拟机登录账号</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="fa fa-user-secret"></i> <span class="nav-label">系统用户 </span><span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/mailbox.html">系统用户</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/mail_detail.html">角色管理</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/mail_compose.html">权限管理</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/form_basic.html">基本表单</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/form_validate.html">表单验证</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/form_advanced.html">高级插件</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/form_wizard.html">表单向导</a>
                    </li>
                    <li>
                        <a href="#">文件上传 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/form_webuploader.html">百度WebUploader</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/form_file_upload.html">DropzoneJS</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">编辑器 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/form_editors.html">富文本编辑器</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/form_simditor.html">simditor</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/form_markdown.html">MarkDown编辑器</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/code_editor.html">代码编辑器</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/layerdate.html">日期选择器layerDate</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/contacts.html">联系人</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/profile.html">个人资料</a>
                    </li>
                    <li>
                        <a href="#">项目管理 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/projects.html">项目</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/project_detail.html">项目详情</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/teams_board.html">团队管理</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/social_feed.html">信息流</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/clients.html">客户管理</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/file_manager.html">文件管理器</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/calendar.html">日历</a>
                    </li>
                    <li>
                        <a href="#">博客 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/blog.html">文章列表</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/article.html">文章详情</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/faq.html">FAQ</a>
                    </li>
                    <li>
                        <a href="#">时间轴 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/timeline.html">时间轴</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/timeline_v2.html">时间轴v2</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/pin_board.html">标签墙</a>
                    </li>
                    <li>
                        <a href="#">单据 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/invoice.html">单据</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/invoice_print.html">单据打印</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/search_results.html">搜索结果</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/forum_main.html">论坛</a>
                    </li>
                    <li>
                        <a href="#">即时通讯 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/chat_view.html">聊天窗口</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">登录注册相关 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a href="static/admin/login.html" target="_blank">登录页面</a>
                            </li>
                            <li><a href="static/admin/login_v2.html" target="_blank">登录页面v2</a>
                            </li>
                            <li><a href="static/admin/register.html" target="_blank">注册页面</a>
                            </li>
                            <li><a href="static/admin/lockscreen.html" target="_blank">登录超时</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/404.html">404页面</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/500.html">500页面</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/empty_page.html">空白页</a>
                    </li>
                </ul>
            </li>
            <li class="line dk"></li>
            <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span class="ng-scope">分类</span>
            </li>
            <li>
                <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/typography.html">排版</a>
                    </li>
                    <li>
                        <a href="#">字体图标 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li>
                                <a class="J_menuItem" href="static/admin/fontawesome.html">Font Awesome</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="static/admin/glyphicons.html">Glyphicon</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="static/admin/iconfont.html">阿里巴巴矢量图标库</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">拖动排序 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/draggable_panels.html">拖动面板</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/agile_board.html">任务清单</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/buttons.html">按钮</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/tabs_panels.html">选项卡 &amp; 面板</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/notifications.html">通知 &amp; 提示</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/badges_labels.html">徽章，标签，进度条</a>
                    </li>
                    <li>
                        <a class="J_menuItem" href="static/admin/grid_options.html">栅格</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/plyr.html">视频、音频</a>
                    </li>
                    <li>
                        <a href="#">弹框插件 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/layer.html">Web弹层组件layer</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/modal_window.html">模态窗口</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/sweetalert.html">SweetAlert</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">树形视图 <span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a class="J_menuItem" href="static/admin/jstree.html">jsTree</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/tree_view.html">Bootstrap Tree View</a>
                            </li>
                            <li><a class="J_menuItem" href="static/admin/nestable_list.html">nestable</a>
                            </li>
                        </ul>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/toastr_notifications.html">Toastr通知</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/diff.html">文本对比</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/spinners.html">加载动画</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/widgets.html">小部件</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/table_basic.html">基本表格</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/table_data_tables.html">DataTables</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/table_jqgrid.html">jqGrid</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/table_foo_table.html">Foo Tables</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/table_bootstrap.html">Bootstrap Table
                        <span class="label label-danger pull-right">推荐</span></a>
                    </li>
                </ul>
            </li>
            <li class="line dk"></li>
            <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                <span class="ng-scope">分类</span>
            </li>
            <li>
                <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/basic_gallery.html">基本图库</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/carousel.html">图片切换</a>
                    </li>
                    <li><a class="J_menuItem" href="static/admin/blueimp.html">Blueimp相册</a>
                    </li>
                </ul>
            </li>
            <li>
                <a class="J_menuItem" href="static/admin/css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a>
            </li>
            <li>
                <a href="#"><i class="fa fa-cutlery"></i> <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a class="J_menuItem" href="static/admin/form_builder.html">表单构建器</a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</nav>
<!--左侧导航结束-->