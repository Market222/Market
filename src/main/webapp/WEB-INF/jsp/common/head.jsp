<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap -->
    <link href="../../statics/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../statics/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../../statics/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../statics/build/css/custom.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../statics/CSS/hzw-city-picker.css">
    <script src="../../statics/laydate/laydate.js"></script>
</head>
<style>

    .heade li {
        display: inline-block;
        color: rgb(59, 59, 59);
        margin: 0 3px;
    }

    .heade li a {
        text-decoration: none;
        color: black;
        font-size: 15px;
    }

    .heade li a:hover {
        text-decoration: none;
        color: rgba(255, 66, 0, 0.71);
    }

    .shouYe li {
        display: inline-block;
        margin: 10px 20px;
        color: white;
    }
    .shouYe li a {
        text-decoration: none;
        color: white;
    }

</style>
<body style="background-color: white">
<nav class="navbar navbar-default" role="navigation" style="height:70px;line-height: 70px;margin: 0px">
    <div style="margin: 0 ">
        <div style="height:68px;line-height: 68px">
            <form class="navbar-form navbar-left" role="search" style="margin: 0">
                <img src="../../statics/img/head.png" style="height: 100%;margin: 0">
            </form>
            <div class="heade">
                <ul style="margin:0 25px;list-style: none;text-align: right;">
                    <li><a href="#">后台商品</a></li>
                    <li><a style=" border-right: 1px solid #ccc;width: 1px;"></a></li>
                    <li><font style="vertical-align: inherit;"><a class="btn btn-app">消息<span class="badge bg-red"><font
                            style="vertical-align: inherit;">13</font></span></a></font></li>
                    <li><a style=" border-right: 1px solid #ccc;width: 1px"></a></li>
                    <li><a href="#">服务支持</a></li>
                    <li><a style=" border-right: 1px solid #ccc;width: 1px"></a></li>
                    <li><a href="#">用户中心</a></li>
                    <li><a style=" border-right: 1px solid #ccc;width: 1px"></a></li>
                    <li><a href="#">帮助</a></li>
                    <li><a style=" border-right: 1px solid #ccc;width: 1px"></a></li>
                    <li><a href="#">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="shouYe">
    <ul style="list-style: none;background-color: rgba(255,79,4,0.63)">
        <li><a href="#">进货</a></li>
        <li><a href="#">销货</a></li>
        <li><a href="#">仓库</a></li>
        <li><a href="#">资金</a></li>
        <li><a href="#">报表</a></li>
        <li><a href="#">设置</a></li>
    </ul>
</div>


