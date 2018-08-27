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
    <li><a href="/OrangBank/"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">首页</font></font></a>
    </li>
    <li><a href="/OrangBank/"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">销售订单</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">销售订单</font></font></a>
    </li>
</ul>
<div class="main">

    <div class="x_panel">
        <div class="x_title">
            <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">销售</font></font>
                <small><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">订单修改</font></font>
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
            <br>

            <form class="form-horizontal form-label-left input_mask" action="/OrangBank/ShopUpdate">

                <input type="hidden" name="marketBack_id" value="${marketBackList.marketBack_id}">

                <div  class="form-group">
                    <label for="marketBack_clientId" class="col-sm-2 control-label">客户名称：</label>
                    <div class="col-sm-3">
                        <select class="form-control" name="marketBack_clientId" style="height: 3rem;line-height: 50px" id="marketBack_clientId">
                            <c:if test="${clientList != null }">
                                <option value="0">--请选择--</option>
                                <c:forEach var="client" items="${clientList}">
                                    <option <c:if test="${client.client_id == marketBack_clientId }">selected="selected"</c:if>
                                            value="${client.client_id}">${client.client_name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div  class="form-group">
                    <label for="marketBack_count" class="col-sm-2 control-label">商品名称：</label>
                    <div class="col-sm-3">
                        <input type="text" readonly= "true " class="form-control has-feedback-left" value="${Ms.shoopping.shoopping_name}">
                    </div>
                </div>

                <div  class="form-group">
                    <label for="marketBack_count" class="col-sm-2 control-label">商品数量：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control has-feedback-left" name="marketBack_count" id="marketBack_count" value="${marketBackList.marketBack_count}"/>
                    </div>
                </div>

                <div  class="form-group">
                    <label for="marketBack_address" class="col-sm-2 control-label">送货地址：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control has-feedback-left" name="marketBack_address" id="marketBack_address" value="${marketBackList.marketBack_address}"/>
                    </div>
                </div>

                <div  class="form-group">
                    <label for="marketBack_salesman" class="col-sm-2 control-label">销售员：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control has-feedback-left" name="marketBack_salesman" id="marketBack_salesman" value="${marketBackList.marketBack_salesman}"/>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="ln_solid"></div>
                <div  class="form-group">
                    <div class="col-sm-6">
                        <input type="submit" class="btn btn-primary" value="提交">
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