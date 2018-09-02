<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../statics/JSPwindow/lib/layui/layui.js"></script>
<script type="text/javascript" src="../statics/JSPwindow/js/xadmin.js"></script>
<!-- Bootstrap -->
<link href="../statics/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../statics/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../statics/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="../statics/build/css/custom.min.css" rel="stylesheet">
<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>
<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">

<style>
    body{
        background-color: white;
    }
</style>
<div  style="display: flex;justify-content: center;margin-top: 50px">


    <form class="form-horizontal form-label-left" novalidate="" action="/OrangBank/update" method="post">
        <input type="hidden" value="${users2.users_id} " name="users_id">
        <div class="form-group" >
            <label class="control-label col-md-3">用户账号</label>
            <div class="col-md-7 ">
                <input  class="form-control" type="text" value="${users2.users_name} " name="users_name" disabled="disabled" >
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3" >用户电话</label>
            <div class="col-md-7 ">
                <input  class="form-control" type="text" value="${users2.users_phone}"  name="users_phone">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3" >公司名称</label>
            <div class="col-md-7 ">
                <input class="form-control" type="text" value="${users2.users_company}"  name="users_company">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3" >真实姓名</label>
            <div class="col-md-7 ">
                <input  class="form-control" type="text" value="${users2.users_truename}"  name="users_truename">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
            <div class="col-md-7">
                <input  class="form-control" type="text" value="${users2.users_email}"  name="users_email">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色</label>
            <div class="col-md-7">
                <select  class="form-control col-md-5" style="width: 196px">
                    <option >1</option>
                    <option >2</option>
                </select>
            </div>
        </div>
        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-7">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="send" type="submit" class="btn btn-success" href="javascript:;" onclick="x()"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">保存</font></font></button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" href="javascript:;" onclick="x()"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">返回</font></font></button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script>
    function x() {
        x_admin_close()
    }
</script>
