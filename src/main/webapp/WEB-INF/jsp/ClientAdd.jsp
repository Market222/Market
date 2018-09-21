<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>

<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">

<style>
    .form-control{
        text-align: center;
    }
</style>
<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li><a href="/OrangBank/tiao2"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">首页</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">我的客户新增</font></font></a>
    </li>
</ul>
<div class="main">

    <div class="x_panel">
        <div class="x_title">
            <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">详情</font></font>
                <small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新增客户</font></font>
                </small>
            </h2>
            <ul class="nav navbar-right panel_toolbox">
                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i
                            class="fa fa-wrench"></i></a>
                </li>
                <li><a class="close-link"><i class="fa fa-close"></i></a>
                </li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
            <br>
            <form class="form-horizontal form-label-left input_mask" method="post" action="/OrangBank/ClientAdd">
                <input type="hidden" class="form-control" readonly="readonly" name="client_id"/>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    联系人:<input type="text" class="form-control" id="ClientName" name="client_name"/>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    送货地址:<input type="text" class="form-control"  name="client_address"/>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    手机:<input type="text" class="form-control"
                                name="client_phone"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    座机: <input type="text" class="form-control has-feedback-left"
                                  name="client_specialplane"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    销售员:<input type="text" class="form-control"  name="client_salesman"/>
                </div>
                <div class="clearfix"></div>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                        <button type="submit" class="btn btn-primary" id ="btnn"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">保存</font></font></button>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                        <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;" onclick="guanbi()">关闭</font></font></button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>


<%@include file="../jsp/common/foot.jsp" %>

<script>
    function guanbi() {
        window.history.go(-1);
    }

    $("#ClientName").blur(function () {
       var name =  $("#ClientName").val();
       if(name.trim().length == 0){
           document.getElementById("btnn").disabled=false;
           return;
       }else{
           $.ajax({
               type:"POST",//请求类型
               url:"/OrangBank/countClient",//请求的url
               data:{"client_name":name},
               dataType:"json",//ajax接口（请求url）返回的数据类型
               success: function (data) {//data：返回数据（json对象）
                   if(data>0){
                       alert("用户名已存在");
                       document.getElementById("btnn").disabled=true;
                   }else{
                       document.getElementById("btnn").disabled=false;
                   }
               }
           });
       }

    })
</script>