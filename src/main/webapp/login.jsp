<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"  id="zc"  href="javascript:;" onclick=" cx()">注册</button>
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
<!-- 模态框  -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">请填写以下信息</h4>
            </div>
            <div class="modal-body">
                <form id="form-insert" class="form-horizontal" action="/OrangBank/insertUsers" method="post">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label col-sm-4">用户名:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="recipient-name" name="users_name" value="">
                            <!-- 放置提示信息 -->
                            <font id="register_error" color="red"></font>
                            <input type="hidden" id="pan" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pwd" class="control-label col-sm-4">登录密码:</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="pwd" name="users_password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pwd2" class="control-label col-sm-4">确认密码:</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="pwd2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label col-sm-4">手机号:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="phone" name="users_phone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label col-sm-4">职位:</label>
                        <div class="col-sm-5">
                            <select class="form-control col-md-5"  name="role_id" id="role_id" onchange="xlk()">
                                <option value="0"  selected="selected">-请选择职位-</option>
                                <option value="1" id="role1">老板</option>
                                <option  value="3" id="role2">员工</option>
                            </select>
                        </div>
                    </div>
                       <%--老板显示公司--%>
                    <div class="form-group"  style="display :none"  id="laob">
                        <label for="name" class="control-label col-sm-4">公司名称:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="name" name="company">
                        </div>
                    </div>
                    <%--员工显示公司--%>
                    <div class="form-group"  style="display :none" id="yung">
                        <label for="name" class="control-label col-sm-4">公司名称:</label>
                        <div class="col-sm-5">
                                <select class="form-control col-md-5"  name="users_companyid" id="users_companyid">

                                </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label col-sm-4">邮箱:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="users_email" name="users_email">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-warning" id="submit">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>


<script src="statics/vendors/jquery/dist/jquery.min.js"></script>
<script src="statics/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/build/js/users.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
<script>

    function xlk(){
        //获取下拉框选中项的value属性值
        var selectValue = $("#role_id").val();
        if(selectValue==0){
            $("#laob").css("display","none");
            $("#yung").css("display","none");
        }else
        if(selectValue==1){
            $("#laob").css("display","");
            $("#yung").css("display","none");
        }else if(selectValue==3){
            $("#yung").css("display","");
            $("#laob").css("display","none");
        }
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


    function cx() {
        alert(2);
        $.ajax({
            type: "POST",
            url: "/OrangBank/SelectCompany",
            dataType:"json",
            success: function (data) {
                if(data){
                    $("#users_companyid").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                    var options = "<option value=\"0\">请选择</option>";
                    for (var i = 0; i < data.length; i++) {
                        options += "<option value=\"" + data[i].id + "\">" + data[i].company_name + "</option>";
                    }
                    $("#users_companyid").html(options);
                }
            }
        })
    };

   /*
    $("#zc").click(function () {
        alert(2);
        $.ajax({
            type: "POST",
            url: "OrangBank/SelectCompany",
            dataType:"json",
            success: function (data) {
                if(data){
                    $("#users_companyid").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                    var options = "<option value=\"0\">请选择</option>";
                    for (var i = 0; i < data.length; i++) {
                        options += "<option value=\"" + data[i].id + "\">" + data[i].company_name + "</option>";
                    }
                    $("#users_companyid").html(options);
                }
            }
        })
    })*/
</script>
