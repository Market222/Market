<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../jsp/common/head.jsp" %>
<style>
    .form-control {
        text-align: center;
    }
    select{
        text-align: center;
        text-align-last: center;
    }
    option{
        text-align: center;
        text-align-last: center;
    }
</style>

<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li><a href="/OrangBank/tiao2"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">首页</font></font></a>
    </li>
    <li><a href="/OrangBank/tiaoShop"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">仓库商品</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">商品详情</font></font></a>
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
                    商品编号: <input type="text" id="input9" class="form-control has-feedback-left" disabled="disabled"
                                 value="${shop.shoopping_id}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品名称: <input type="text" id="input10" class="form-control form-control2 has-feedback-left" readonly="readonly"
                                 value="${shop.shoopping_name}"/>

                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品描述: <input type="text" id="input11" class="form-control form-control2 has-feedback-left" readonly="readonly"
                                 value="${shop.shoopping_describe}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品单位:<input type="text" id="input12" class="form-control"
                                readonly="readonly" value="${shop.shoopping_unit}"/>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品数量: <input type="number" id="input14" class="form-control form-control2 has-feedback-left" readonly="readonly"
                                 value="${shop.shoopping_count}" />

                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    进货单价:<input type="text" id="input15" class="form-control"
                               readonly="readonly"
                               value="${shop.shoopping_stockmoney}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    销货单价:<input type="text" id="input16" class="form-control"
                               readonly="readonly"
                               value="${shop.shoopping_marketmoney}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    销量:<input type="text" id="input17" class="form-control"
                               readonly="readonly"
                               value="${shop.shoopping_sales}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    仓库:<input type="text" id="input18" class="form-control"
                               readonly="readonly"
                               value="${shop.pos.position_name}"/>
                </div>

                <div class="clearfix"></div>
                <div class="ln_solid"></div>

                    <div class="col-md-3 col-sm-12 col-xs-12 col-md-offset-3" style="margin-left:45%">
                        <button type="submit" class="btn btn-primary"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">返回</font></font></button>
                        <button type="button" class="btn btn-success bianji" onclick="bj()">编辑</button>
                    </div>
            </form>
        </div>
    </div>

</div>


<%@include file=".././jsp/common/foot.jsp" %>
<script>
    $("#name").change(function () {
         var num=$(this).val();
        $.ajax({
            type: "GET",//请求类型
            url: "/OrangBank/Shop",//请求的url
            data:{"id":num},
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）

              $("#input9").val(data[0].stock_id);
                $("#input11").val(data[0].stock_describe);
                $("#input12").val(data[0].stock_unit);
                $("#input13").val(data[0].stock_ordermoney);
                $("#input14").val(data[0].stock_count);
                $("#input15").val(data[0].stock_count*data[0].stock_ordermoney);
                $("#pid4").val(data[0].stock_warehouseid)
            }
        });
    })
    function bj() {
        if($(".bianji").html()=='编辑'){
            if(confirm("确认编辑此订单信息么？")){
                $(".bianji").html("保存");
            }else {
                return;
            }
        }else if($(".bianji").html()=='保存'){
            if(confirm("确认保存您修改的订单信息么？")){
                var id=$("#input9").val();
                var de=$("#input11").val();
                var co=$("#input13").val();
                var m=$("#input14").val();
                $.ajax({
                    type: "GET",//请求类型
                    url: "/OrangBank/UpdateOrder",//请求的url
                    data: {
                            "id":id,
                                "describe":de,
                                "count":co,
                                "ordermoney":m
                        },
                    dataType: "json",//ajax接口（请求url）返回的数据类型
                    success: function (data) {//data：返回数据（json对象）
                        if(data=="true"){
                            alert("保存成功")
                        }else{
                            alert("保存失败");
                        }
                    }
                });

                $(".bianji").html("编辑");
            }else {
                return;
            }
        }
        $(".form-control2").removeAttr("readOnly");
        // $('.laydate-icon').removeAttr("disabled");
        // $('#pid3').removeAttr("disabled");
        // $('#pid2').removeAttr("disabled");
        // $('#pid').removeAttr("disabled");
        // $('#pid4').removeAttr("disabled");
    }

</script>

