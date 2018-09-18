<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script src="../statics/JSPwindow/lib/layui/layui.js"></script>
<script type="text/javascript" src="../statics/JSPwindow/js/xadmin.js"></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>title</title>

    <!-- Bootstrap -->
    <link href="statics/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="statics/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="statics/build/css/custom.min.css" rel="stylesheet">

</head>


<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>
    <c:if test="${user !=null}">
        <div class="ui-pnotify dark ui-pnotify-fade-normal ui-pnotify-in ui-pnotify-fade-in ui-pnotify-move"
             aria-live="assertive" aria-role="alertdialog" id="ui-pnotifydark2"
             style="width: 300px; right: 36px; cursor: auto;float: right;position:absolute;">
            <div class="alert alert-success alert-dismissible fade in" role="alert"  style="background-color: #ff4a5f;color: #ffffff">
                <h4 class="ui-pnotify-title"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;温馨提示：</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 账号或密码错误！
            </div>

        </div>
    </c:if>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form action="/OrangBank/Login" method="post">
                    <h1>登录系统</h1>
                    <div>
                        <input type="text" name="users_name" id="users_name" class="form-control" placeholder="请输入用户名" required=""/>
                    </div>
                    <div>
                        <input type="password" name="users_password" id="users_password" class="form-control" placeholder="请输入密码" required=""/>
                    </div>
                    <div class="col-md-10 col-sm-10 col-xs-12 col-md-offset-1">
                        <button type="submit" class="btn btn-primary">登录</button>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"  id="zc"  href="javascript:;" onclick="register('用户注册','/OrangBank/SelectCompany','800','500')">注册</button>
                        <button type="button" class="btn btn-success" onclick="qk()">重填</button>
                    </div>
                    <div class="clearfix"></div>
                    <div class="separator">
                        <p class="change_link">@2018
                            <a href="#signup" class="to_register"> All Rights Reserved. </a>
                        </p>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>


</body>
</html>



<script src="statics/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/build/js/users.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
<script src="statics/vendors/jquery/dist/jquery.min.js"></script>
<script>
    function aa() {
        window.location="login.jsp";
    };
    // 编辑
    function register (title,url,w,h) {
        x_admin_show(title,url,w,h);
    }
    $(window).load(function(){
        setTimeout(function () {
            $("#ui-pnotifydark2").fadeOut(600);
        }, 3000);
    })
    function qk() {
        $("#users_name").val("");
        $("#users_password").val("");
    }

    $("#submit").click(function () {
        var pwd = $("#pwd").val();
        var pwd2 = $("#pwd2").val();
        var pan = $("#pan").val();
        if(pwd!=pwd2){
            alert("两次密码输入不一样");
            return false;
        }
        if(pan=="qqq"){
            return false;
        }
    })
</script>


