﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>智慧社区管理系统 </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
    <script src="${pageContext.request.contextPath }/static/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript"> if ("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath }/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");</script>
    <script src="${pageContext.request.contextPath }/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/js/ace.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript"> $(function () {
        var cid = $('#nav_list> li>.submenu');
        cid.each(function (i) {
            $(this).attr('id', "Sort_link_" + i);
        })
    })
    jQuery(document).ready(function () {/*初始化宽度、高度*/
        $("#main-container").height($(window).height() - 76);
        $(".sidebar").height($(window).height() - 99);
        var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
        $(".submenu").height();
        $("#nav_list").children(".submenu").css("height", thisHeight);/*当文档窗口发生改变时 触发*/
        $(window).resize(function () {
            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);
            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);
        });
        $(document).on('click', '.iframeurl', function () {
            var cid = $(this).attr("name");
            var cname = $(this).attr("title");
            $("#iframe").attr("src", cid).ready();
            $("#Bcrumbs").attr("href", cid).ready();
            $(".Current_page a").attr('href', cid).ready();
            $(".Current_page").attr('name', cid);
            $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
            $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
            $("#parentIfour").html('').css("display", "none").ready();
        });
    });/******/
    $(document).on('click', '.link_cz > li', function () {
        $('.link_cz > li').removeClass('active');
        $(this).addClass('active');
    });


    /*********************点击事件*********************/ $(document).ready(function () {
        // check();/*24小时 执行一次这个函数*/
        $('#nav_list,.link_cz').find('li.home').on('click', function () {
            $('#nav_list,.link_cz').find('li.home').removeClass('active');
            $(this).addClass('active');
        });/*时间设置*/
        function currentTime() {
            var d = new Date(), str = '';
            str += d.getFullYear() + '年';
            str += d.getMonth() + 1 + '月';
            str += d.getDate() + '日';
            str += d.getHours() + '时';
            str += d.getMinutes() + '分';
            str += d.getSeconds() + '秒';
            return str;
        }

        setInterval(function () {
            $('#time').html(currentTime)
        }, 1000);/*修改密码*/
        $('.change_Password').on('click', function () {
            layer.open({
                type: 1,
                title: '修改密码',
                area: ['300px', '300px'],
                shadeClose: true,
                content: $('#change_Pass'),
                btn: ['确认修改'],
                yes: function (index, layero) {
                    if ($("#password").val() == "") {
                        layer.alert('原密码不能为空!', {title: '提示框', icon: 0,});
                        return false;
                    }
                    if ($("#Nes_pas").val() == "") {
                        layer.alert('新密码不能为空!', {title: '提示框', icon: 0,});
                        return false;
                    }
                    if ($("#c_mew_pas").val() == "") {
                        layer.alert('确认新密码不能为空!', {title: '提示框', icon: 0,});
                        return false;
                    }
                    if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                        layer.alert('密码不一致!', {title: '提示框', icon: 0,});
                        return false;
                    } else {
                        layer.alert('修改成功！', {title: '提示框', icon: 1,});
                        layer.close(index);
                    }
                }
            });
        });
        $('#Exit_system').on('click', function () {
            layer.confirm('是否确定退出系统？', {btn: ['是', '否'],/*按钮*/ icon: 2,}, function () {
                location.href = "${pageContext.request.contextPath }/Logout.action";
            });
        });
    });

    function link_operating(name, title) {
        var cid = $(this).name;
        var cname = $(this).title;
        $("#iframe").attr("src", cid).ready();
        $("#Bcrumbs").attr("href", cid).ready();
        $(".Current_page a").attr('href', cid).ready();
        $(".Current_page").attr('name', cid);
        $(".Current_page").html(cname).css({"color": "#333333", "cursor": "default"}).ready();
        $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
        $("#parentIfour").html('').css("display", "none").ready();
    }</script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript"> try {
        ace.settings.check('navbar', 'fixed')
    } catch (e) {
    }</script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left"><a href="#" class="navbar-brand"><small><img
                src="${pageContext.request.contextPath }/static/images/logo.png" width="470px"></small></a>
            <!-- /.brand --></div><!-- /.navbar-header -->
        <div class="navbar-header operating pull-left"></div>
        <div class="navbar-header pull-right" role="navigation"><input type="hidden" value="${sessionScope.user.userid}"
                                                                       id="userid"><input type="hidden" value=""
                                                                                          id="check">
            <ul class="nav ace-nav">
                <li class="light-blue"><a data-toggle="dropdown" href="#" class="dropdown-toggle"><span class="time"><em
                        id="time"></em></span><span class="user-info"><small>欢迎您,</small>${sessionScope.user.realname} </span><i
                        class="icon-caret-down"></i></a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="javascript:void(0)" name="/Systems" title="系统设置" class="iframeurl"><i
                                class="icon-cog"></i>网站设置</a></li>
                        <li><a href="javascript:void(0)"
                               name="${pageContext.request.contextPath }/getInformationByUserName.action?username=${sessionScope.user.username}"
                               title="个人信息" class="iframeurl"><i class="icon-user"></i>个人资料</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                    </ul>
                </li>
        </div>
    </div>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript"> try {
        ace.settings.check('main-container', 'fixed')
    } catch (e) {
    }</script>
    <div class="main-container-inner" style="height: 480px;"><a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span></a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript"> try {
                ace.settings.check('sidebar', 'fixed')
            } catch (e) {
            }</script>

            <div id="menu_style" class="menu_style">
                <ul class="nav nav-list" id="nav_list">
                    <li class="home"><a href="javascript:void(0)"
                                        name="${pageContext.request.contextPath }/getAllNotices.action"
                                        class="iframeurl" title=""><i class="icon-home"></i><span class="menu-text"> 系统首页 </span></a>
                    </li>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-medkit"></i><span
                            class="menu-text">社区医疗</span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/appointment" title="预约挂号"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>预约挂号</a></li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/sendDoctors"
                                                title="上门服务" class="iframeurl"><i class="icon-double-angle-right"></i>上门服务</a>
                            </li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/healthInfo"
                                                title="健康信息填报" class="iframeurl"><i class="icon-double-angle-right"></i>健康信息填报</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-trash"></i><span
                            class="menu-text">社区环境</span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:window.location.href='${pageContext.request.contextPath }/refuseClassification';"
                                                title="垃圾分类"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>垃圾分类</a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-hospital"></i><span
                            class="menu-text">社区养老</span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/lifeCare" title="生活照料"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>生活照料</a></li>
<%--                            <li class="home"><a href="javascript:void(0)"--%>
<%--                                                name="${pageContext.request.contextPath }/getPosts.action" title="紧急救助"--%>
<%--                                                class="iframeurl"><i class="icon-double-angle-right"></i>紧急救助</a></li>--%>
                        </ul>
                    </li>
                    <c:choose><c:when test="${ sessionScope.user.userroleid == 2}">
                        <li><a href="#" class="dropdown-toggle"><i class="icon-user"></i><span
                                class="menu-text">社区安全</span><b class="arrow icon-angle-down"></b></a>
                            <ul class="submenu">
                                <li class="home"><a href="javascript:void(0)"
                                                    name="${pageContext.request.contextPath }/getAllUsers.action"
                                                    title="用户列表" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>用户列表</a></li>
                                <c:choose><c:when test="${ sessionScope.user.userroleid == 2}">
                                    <li class="home"><a href="javascript:void(0)"
                                                        name="${pageContext.request.contextPath }/getAllSecuritys.action"
                                                        title="安保人员列表" class="iframeurl"><i
                                            class="icon-double-angle-right"></i>安保人员列表</a></li>
                                </c:when></c:choose><c:choose><c:when test="${ sessionScope.user.userroleid == 1}">
                                <li class="home"><a href="javascript:void(0)"
                                                    name="${pageContext.request.contextPath }/getAllVehicles.action"
                                                    title="车辆管理" class="iframeurl"><i
                                        class="icon-double-angle-right"></i>车辆列表</a></li>
                            </c:when></c:choose>
<%--                                <li class="home"><a href="javascript:void(0)"--%>
<%--                                                    name="${pageContext.request.contextPath }/getAllUsers.action"--%>
<%--                                                    title="一键求助" class="iframeurl"><i--%>
<%--                                        class="icon-double-angle-right"></i>一键求助</a></li>--%>
                            </ul>
                        </li>
                    </c:when></c:choose>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-picture "></i><span
                            class="menu-text">社区生活</span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/getPosts.action" title="社区贴吧"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>社区贴吧</a></li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/getPostList" title="贴吧管理"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>贴吧管理</a></li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/searchNotices" title="公告管理"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>公告管理</a></li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/housekeepingService" title="家政服务"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>家政服务</a></li>
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/actingAssistant" title="社区代办"
                                                class="iframeurl"><i class="icon-double-angle-right"></i>社区代办</a></li>
                            <li><a href="#" class="dropdown-toggle"><span
                                    class="menu-text">社区购物</span><b class="arrow icon-angle-down"></b></a>
                                <ul class="submenu">
                                    <li class="home"><a href="javascript:void(0)"
                                                        name="${pageContext.request.contextPath }/getAllFood.action"
                                                        title="社区购物" class="iframeurl"><i
                                            class="icon-double-angle-right"></i>社区代购</a></li>
                                    <c:choose><c:when test="${ sessionScope.user.userroleid == 2}">
                                        <li class="home"><a href="javascript:void(0)"
                                                            name="${pageContext.request.contextPath }/getAllOrder.action"
                                                            title="代购订单" class="iframeurl"><i
                                                class="icon-double-angle-right"></i>代购订单</a></li>
                                    </c:when></c:choose>
                                    <li class="home"><a href="javascript:void(0)"
                                                        name="${pageContext.request.contextPath }/getMyOrder.action?name=${sessionScope.user.realname}"
                                                        title="我的订单" class="iframeurl"><i
                                            class="icon-double-angle-right"></i>我的订单</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropdown-toggle"><span class="menu-text"> 疫情防控 </span><b
                                    class="arrow icon-angle-down"></b></a>
                                <ul class="submenu">
                                    <li class="home"><a href="javascript:void(0)"
                                                        name="https://voice.baidu.com/act/newpneumonia/newpneumonia"
                                                        title="疫情实时大数据报告" class="iframeurl"><i
                                            class="icon-double-angle-right"></i>疫情实时大数据报告</a></li>
                                    <li class="home"><a href="javascript:void(0)" name="/ForeignEpidemic" title="国外疫情"
                                                        class="iframeurl"><i
                                            class="icon-double-angle-right"></i>国外疫情</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#" class="dropdown-toggle"><i class="icon-cogs"></i><span
                            class="menu-text"> 系统管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:void(0)"
                                                name="${pageContext.request.contextPath }/getInformationByUserName.action?username=${sessionScope.user.username} "
                                                title="个人信息" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <script type="text/javascript"> $("#menu_style").niceScroll({
                cursorcolor: "#888888",
                cursoropacitymax: 1,
                touchbehavior: false,
                cursorwidth: "5px",
                cursorborder: "0",
                cursorborderradius: "5px"
            });</script>
            <div class="sidebar-collapse" id="sidebar-collapse"><i class="icon-double-angle-left"
                                                                   data-icon1="icon-double-angle-left"
                                                                   data-icon2="icon-double-angle-right"></i></div>
            <script type="text/javascript"> try {
                ace.settings.check('sidebar', 'collapsed')
            } catch (e) {
            }</script>
        </div>
        <div class="main-content" style="height: 400px;">
            <script type="text/javascript"> try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }</script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home home-icon"></i><a href="/index">首页</a></li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>
            <iframe id="iframe" style="scrolling : no;border:0; width:100%;height:750px; background-color:#FFF;" name="iframe"
                    frameborder="0" src="${pageContext.request.contextPath }/getAllNotices.action"></iframe>
            <!-- /.page-content --></div><!-- /.main-content -->
        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn"><i
                    class="icon-cog bigger-150"></i></div>
            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left"><select id="skin-colorpicker" class="hide">
                        <option data-skin="default" value="#438EB9">#438EB9</option>
                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                    </select></div>
                    <span>&nbsp; 选择皮肤</span></div>
                <div><input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/><label class="lbl"
                                                                                                         for="ace-settings-sidebar">
                    固定滑动条</label></div>
                <div><input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/><label class="lbl"
                                                                                                     for="ace-settings-rtl">切换到左边</label>
                </div>
                <div><input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/><label
                        class="lbl" for="ace-settings-add-container">切换窄屏<b></b></label></div>
            </div>
        </div><!-- /#ace-settings-container --></div><!-- /.main-container-inner --></div><!--底部样式--><!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="原密码" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="新密码" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="再次确认密码" type="password" class="" id="c_mew_pas"></li>
    </ul>
</div><!-- /.main-container --><!-- basic scripts --></body>
</html>
