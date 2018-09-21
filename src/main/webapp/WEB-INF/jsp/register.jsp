<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    body {
        background-color: white;
    }
</style>


<div>
    <div style="margin-top:20px ">
        <h4 class="modal-title" id="exampleModalLabel" style="text-align: center">请填写以下信息</h4>
    </div>
    <div style="margin-top:20px">
        <form id="form-insert" class="form-horizontal" action="/OrangBank/insertUsers" method="post">
            <div class="form-group">
                <label for="users_name" class="control-label col-sm-4">用户名:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="users_name" name="users_name" value="">
                    <!-- 放置提示信息 -->
                    <font id="register_error" color="red"></font>
                    <input type="hidden" id="pan" value="">
                </div>
            </div>
            <div class="form-group">
                <label for="users_truename" class="control-label col-sm-4">真实姓名:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="users_truename" name="users_truename" value="">
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
                    <select class="form-control col-md-5" name="role_id" id="role_id" onchange="xlk()">
                        <option value="0" selected="selected">-请选择职位-</option>
                        <option value="1" id="role1">老板</option>
                        <option value="3" id="role2">员工</option>
                    </select>
                </div>
            </div>
            <%-- // 老板显示公司--%>
            <div class="form-group" style="display :none" id="laob">
                <label for="company" class="control-label col-sm-4">公司名称:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="company" name="company" onblur="gs()">
                </div>
            </div>
            <%--   员工显示公司--%>
            <div class="form-group" style="display :none" id="yung">
                <label for="company" class="control-label col-sm-4">公司名称:</label>
                <div class="col-sm-5">
                    <select class="form-control" name="companyid" id="companyid">
                        <c:if test="${companies != null }">
                            <c:forEach var="dep" items="${companies}">
                                <option name="users_companyid" id="users_companyid"
                                        value="${dep.company_id}">${dep.company_name}
                                </option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="control-label col-sm-4">邮箱:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="users_email" name="users_email">
                </div>
            </div>
            <div align="center">
                <button type="button" class="btn btn-default" href="javascript:;" onclick="x()" style="margin-right:5%">
                    关闭
                </button>

                <button type="button" class="btn btn-warning" id="submit" href="javascript:;" onclick=" xiugai()">注册
                </button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
<script src="../statics/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>


<script>
    function x() {
        x_admin_close();
    }

    //获取下拉框选中项的value属性值
    function xlk() {
        var selectValue = $("#role_id").val();
        if (selectValue == 0) {
            $("#laob").css("display", "none");
            $("#yung").css("display", "none");
        } else if (selectValue == 1) {
            $("#laob").css("display", "");
            $("#yung").css("display", "none");
        } else if (selectValue == 3) {
            $("#yung").css("display", "");
            $("#laob").css("display", "none");
        }
    }

    function gs() {
        $.ajax({
            type: "POST",
            url: "/OrangBank/countCompany",
            data: {
                "company_name": $("#company").val(),
            },
            dataType: "json",
            success: function (data) {
                if (data.Companyname == 'exist') {
                    alert("已存在该公司名！");
                } else {
                    alert("该公司名可用");
                }
            }
        });
    };
</script>