<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>
<link href="../statics/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<link type="text/css" rel="styleSheet"  href="../statics/CSS/index.css" />
<div class="x_content">
    <div class="" role="tabpanel" data-example-id="togglable-tabs" style="position: relative;">
        <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
            <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                                      aria-expanded="true"><font style="vertical-align: inherit;"><font
                    style="vertical-align: inherit;">首页</font></font></a>
            </li>
        </ul>
        <div id="myTabContent" class="row">
            <div role="tabpanel" class="tab-pane fade active in col-md-3" id="tab_content1" aria-labelledby="home-tab">
                <p><font style="vertical-align: inherit;"><strong
                        style="vertical-align: inherit;">深圳市绿色原野公司，张三</strong></font></p>
            </div>
            <div role="tabpanel" class="col-md-3" aria-labelledby="home-tab">
                <p><font style="vertical-align: inherit;"><strong
                        style="vertical-align: inherit;">财富号：</strong><b>88888888</b></font></p>
            </div>
            <div class="col-md-3" aria-labelledby="home-tab">
                <p><font style="vertical-align: inherit;"><strong
                        style="vertical-align: inherit;">天下通：</strong><b>88888888</b></font></p>
            </div>
        </div>

        <div class="main ">
            <div class="row">
                <div class="col-md-5">
                    <label>
                        <input type="radio" checked="" value="0" id="optionsRadios1" name="optionsRadios"
                               style="margin-right: 5px"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;text-align: center">商品库存</font></font></label>
                    <label>
                        <input type="radio" checked="" value="1" id="optionsRadios2" name="optionsRadios"
                               style="margin-right: 5px"><font
                            style="vertical-align: inherit;"><font
                            style="vertical-align: inherit;">商品价格</font></font></label>
                </div>
                <div class="input-group col-md-3" style="width: 300px;margin-top: 16px;">
                    <input type="text" class="form-control" style="margin-left: -10px">
                    <span class="input-group-btn">
                              <button type="button" class="btn"
                                      style="background-color: #ff6f09; color: white">查询</button>
                            </span>
                </div>
                <strong style="font-size: 16px;margin-left: 65px;color: black;margin-right:35px">待办事项</strong>
                待发货<b style="margin-left: 10px">2</b><a
                    style=" border-right: 1px solid #ccc;width: 1px;margin-left: 10px;margin-right: 10px"></a>
                待收款<b style="margin-left: 10px">1</b><a
                    style=" border-right: 1px solid #ccc;width: 1px;margin-left: 10px;margin-right: 10px"></a>
                待收货<b style="margin-left: 10px">1</b><a
                    style=" border-right: 1px solid #ccc;width: 1px;margin-left: 10px;margin-right: 10px"></a>
                待付款<b style="margin-left: 10px">0</b><a
                    style=" border-right: 1px solid #ccc;width: 1px;margin-left: 10px;margin-right: 10px"></a>
                待确认客户进货单<b style="margin-left: 10px">1</b><a
                    style=" border-right: 1px solid #ccc;width: 1px;margin-left: 10px;margin-right: 10px"></a>
            </div>
            <div class="row body2">
                <div class="col-md-3" style="border-left:0px"><a href="/OrangBank/tiao" style="margin-left: -10px"><img
                        src="../statics/img/jinhuo.png"></a></div>
                <div class="col-md-3"><a href="/Returns/tiao" style="margin-left: -6px"><img src="../statics/img/jinhuotuihui.png"></a>
                </div>
                <div class="col-md-3"><a href="/OrangBank/tiao2" style="margin-left: -10px"><img src="../statics/img/fukuan.png"></a></div>
                <div class="col-md-3" style="border-right:0px">
                        <ul style="text-align: center;margin-top: 20px">
                            <li> <a href="#">进货订单入库</a></li>
                            <li><a href="#">要货申请入库</a></li>
                            <li> <a href="#">其他入库</a></li>
                            <li> <a href="#">进货退回</a></li>
                        </ul>
                </div>
                <div class="col-md-3" style="border-left:0px"><a href="/OrangBank/xiaoshou" style="margin-left: -10px">
                    <img src="../statics/img/xiaoshou.png"></a></div>

                <div class="col-md-3"><a href="/sInfo" style="margin-left: -10px">
                    <img src="../statics/img/xiaoshoutuihuo.png"></a></div>

                <div class="col-md-3"><a href="#" style="margin-left: -10px">
                    <img src="../statics/img/shoukuan.png"></a></div>

                <div class="col-md-3" style="border-right:0px;margin: 0"><a href="#" style="margin-left: -10px;">
                    <img src="../statics/img/chuku.png" style="width: 196px"></a></div>
            </div>

        </div>
        <div class="main2" >
            <ul>
                <li style="text-align:center;background-color: orange">快速查看</li>
                <li><a href="#">进货订单及退回单列表</a></li>
                <li><a href="#">销售订单及销售退货列表</a></li>
                <li><a href="#">要货申请单列表</a></li>
                <li><a href="#">收款单列表</a></li>
                <li><a href="#">付款单列表</a></li>
                <li><a href="#">供应商历史价格查询</a></li>
                <li><a href="#">客户历史价格查询</a></li>
                <li><a href="#">销售排行榜</a></li>
            </ul>
        </div>
    </div>
<%@include file="../jsp/common/foot.jsp" %>