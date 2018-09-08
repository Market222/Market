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
    body {
        background-color: white;
    }
</style>
<c:if test="${userEntity.role_id!=1}">
    <%@include file="../jsp/common/head.jsp" %>
    <h3 style="text-align: center">个人信息</h3>
</c:if>
<div style="display: flex;justify-content: center;margin-top: 50px">
    <c:if test="${userEntity.role_id!=1}">
    <form class="form-horizontal form-label-left" novalidate="" action="/OrangBank/GRupdate" method="post">
        </c:if>
        <c:if test="${userEntity.role_id==1}">
        <form class="form-horizontal form-label-left" novalidate="" method="post">
            </c:if>
            <input type="hidden" value="${users2.users_id} " name="users_id" id="users_id">
            <div class="form-group">
                <label class="control-label col-md-3">用户账号</label>
                <div class="col-md-7 ">
                    <input class="form-control" type="text" value="${users2.users_name} " name="users_name"
                           id="users_name"
                           disabled="disabled">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">用户电话</label>
                <div class="col-md-7 ">
                    <input class="form-control" type="text" value="${users2.users_phone}" name="users_phone"
                           id="users_phone">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">公司名称</label>
                <div class="col-md-7 ">
                    <input class="form-control" type="text" value="${users2.users_company}" name="users_company"
                           id="users_company">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">真实姓名</label>
                <div class="col-md-7 ">
                    <input class="form-control" type="text" value="${users2.users_truename}" name="users_truename"
                           id="users_truename">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" value="${users2.users_email}" name="users_email"
                           id="users_email">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-3">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色</label>
                <div class="col-md-7">
                    <c:if test="${userEntity.role_id==1}">
                        <select class="form-control col-md-5" style="width: 196px" name="role_id" id="role_id">
                            <c:if test="${grroleList != null }">
                                <c:forEach var="dep" items="${grroleList}">
                                    <option
                                            <c:if test="${dep.role_id == users2.role_id}">selected="selected"</c:if>
                                            value="${dep.role_id}">${dep.role_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </c:if>
                    <c:if test="${userEntity.role_id!=1}">
                        <input class="form-control" type="text" value="${users2.role.role_name}" name="role_name"
                               disabled="disabled">
                    </c:if>
                </div>
            </div>
            <div class="ln_solid"></div>
            <div class="form-group">
                <div class="col-md-7">
                    <c:if test="${userEntity.role_id==1}">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button id="send" type="button" class="btn btn-success" href="javascript:;" onclick=" xiugai()">
                            <font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">保存</font></font></button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" href="javascript:;" onclick="x()"><font
                                style="vertical-align: inherit;"><font style="vertical-align: inherit;">返回</font></font>
                        </button>
                    </c:if>
                    <c:if test="${userEntity.role_id!=1}">
                        <button id="send2" type="submit" class="btn btn-success"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">保存</font></font></button>
                        <button type="button" class="btn btn-primary" href="javascript:;" onclick="index()"><font
                                style="vertical-align: inherit;"><font style="vertical-align: inherit;">返回</font></font>
                        </button>
                    </c:if>
                </div>
            </div>
        </form>
</div>
<c:if test="${userEntity.role_id!=1}">
    <%@include file="../jsp/common/foot.jsp" %>
</c:if>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
<script>
    function x() {
        x_admin_close();
    }

    function xiugai() {
        $.ajax({
            type: "POST",
            url: "/OrangBank/Update",
            data: {
                "users_id": $("#users_id").val(),
                "users_phone": $("#users_phone").val(),
                "users_company": $("#users_company").val(),
                "users_truename": $("#users_truename").val(),
                "users_email": $("#users_email").val(),
                "role_id": $("#role_id").val()
            },
            dataType: "json",
            success: function (data) {
                if (data > 0) {
                    window.parent.aa();
                    alert("修改成功！");
                } else {
                    alert("修改失败！");
                }
            }
        });
    };

    function index() {
        window.location.href = "/OrangBank/aa";
    };
</script>
