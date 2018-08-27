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
    <li><a href="/OrangBank/tiao"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">进货订单</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">进货订单详情</font></font></a>
    </li>
</ul>
<div class="main">

    <div class="x_panel">
        <div class="x_title">
            <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">详情</font></font>
                <small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">商品详情</font></font>
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
            <form class="form-horizontal form-label-left input_mask">

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    订单编号：<input type="text" class="form-control" value="${mar.shoopping.shoopping_id}" readonly="readonly">
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品名称:<input type="text" class="form-control" value="${mar.shoopping.shoopping_name}" readonly="readonly">
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品描述:<input type="text" class="form-control" value="${mar.shoopping.shoopping_describe}" readonly="readonly">
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品单位:<input type="text" class="form-control" value="${mar.shoopping.shoopping_unit}"
                                readonly="readonly">
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品数量: <input type="text" class="form-control has-feedback-left" readonly="readonly"
                                 value="${mar.marketBack.marketBack_count}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    进货单价:<input type="text" class="form-control" value="${mar.shoopping.shoopping_stockmoney}" readonly="readonly">
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    销货单价: <input type="text" class="form-control has-feedback-left" readonly="readonly"
                                 value="${mar.shoopping.shoopping_marketmoney}"/>
                </div>
                <div class="clearfix"></div>
                <div class="ln_solid"></div>
                <div class="form-group">
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
</script>