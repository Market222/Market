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
                    订单编号：<input type="text" class="form-control" id="input1" value="${orders.order_id}"
                                disabled="disabled">
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback" >
                    发送状态:
                        <select id="pid"  onchange="gradeChange()" class="form-control"   disabled="disabled"
                                name="order_state">
                            <option <c:if test="${orders.order_state=='未发送'}"> selected="selected"</c:if>>未发送</option>
                            <option <c:if test="${orders.order_state=='已发送'}"> selected="selected"</c:if>>已发送</option>
                        </select>
                </div>
                <script>
                    function gradeChange() {
                        var objS = document.getElementById("pid");
                        var grade = objS.options[objS.selectedIndex].value;
                        if (grade == '已发送') {
                            $(".fasong").css("display", "block");
                        } else {
                            $(".fasong").css("display", "none");
                        }
                    };

                    function gradeChange2() {
                        var objS = document.getElementById("pid2");
                        var grade = objS.options[objS.selectedIndex].value;
                        if (grade == '已确认') {
                            $(".queren").css("display", "block");
                        } else {
                            $(".queren").css("display", "none");
                        }
                    };

                    function gradeChange3() {
                        var objS = document.getElementById("pid3");
                        var grade = objS.options[objS.selectedIndex].value;
                        if (grade == 1) {
                            $(".jujue").css("display", "block");
                            $(".ju").css("display", "none");
                        } else {
                            $(".ju").css("display", "block");
                            $(".jujue").css("display", "none");

                        }
                    };

                    function gradeChange4() {
                        var objS = document.getElementById("pid4");
                        var grade = objS.options[objS.selectedIndex].value;
                        if (grade == 1) {
                            $(".shijian").css("display", "block");
                        } else {
                            $(".shijian").css("display", "none");
                        }
                    };

                </script>
                <div class=" item col-md-6 col-sm-6 col-xs-12 form-grou fasong p "  >
                    发送时间: <input disabled="disabled"  class="form-control laydate-icon " style="height: 33px" id="demo5" value="<fmt:formatDate  type="date" value="${orders.order_sendtime}" />" />
                    <script>
                        !function () {
                            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
                            laydate({elem: '#demo5'});//绑定元素

                        }();
                        //日期范围限制
                        var start = {
                            elem: '#start',
                            format: 'YYYY-MM-DD',
                            min: laydate.now(), //设定最小日期为当前日期
                            max: '2099-06-16', //最大日期
                            istime: true,
                            istoday: false,
                            choose: function (datas) {
                                end.min = datas; //开始日选好后，重置结束日的最小日期
                                end.start = datas //将结束日的初始值设定为开始日
                            }
                        };
                        var end = {
                            elem: '#end',
                            format: 'YYYY-MM-DD',
                            min: laydate.now(),
                            max: '2099-06-16',
                            istime: true,
                            istoday: false,
                            choose: function (datas) {
                                start.max = datas; //结束日选好后，充值开始日的最大日期
                            }
                        };
                        laydate(start);
                        laydate(end);
                        //自定义日期格式
                        laydate({
                            elem: '#test1',
                            format: 'YYYY年MM月DD日',
                            festival: true, //显示节日
                            choose: function (datas) { //选择日期完毕的回调
                                alert('得到：' + datas);
                            }
                        });
                        //日期范围限定在昨天到明天
                        laydate({
                            elem: '#hello3',
                            min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
                            max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
                        });
                    </script>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    确认状态:<select id="pid2" class="form-control"   onchange="gradeChange2()"   disabled="disabled"
                                 name="order_state">
                    <option <c:if test="${orders.order_stateConfirmation=='未确定'}"> selected="selected"</c:if>>未确认</option>
                    <option <c:if test="${orders.order_stateConfirmation=='已确定'}"> selected="selected"</c:if>>已确认</option>
                </select>
                </div>
                <c:if test="${orders.order_confirmedTime!=null && orders.order_confirmedTime!='' }">
                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback queren">
                        确认时间:
                        <input type="text" id="input5" class="form-control has-feedback-left" readonly="readonly"
                                     value="<fmt:formatDate  type="date" value="${orders.order_confirmedTime}" />"/>
                    </div>
                </c:if>
                <c:if test="${orders.order_objection!=null && orders.order_objection!='' }">
                    <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                        拒绝理由:<input type="text" id="input6" class="form-control" value="${orders.order_objection}"
                                    readonly="readonly">
                    </div>
                </c:if>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    发货状态:
                    <select id="pid3" class="form-control"  onchange="gradeChange3()"   disabled="disabled"
                            name="order_state">
                        <option <c:if test="${orders.order_isship=='未发货'}"> selected="selected"</c:if>>供应商未发货</option>
                        <option <c:if test="${orders.order_isship=='已发货'}"> selected="selected"</c:if>>供应商已发货</option>
                        </select>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    发货时间:<input type="text" id="input8" class="form-control"
                                readonly="readonly"
                                value="<fmt:formatDate  type="date" value="${orders.order_shiptime}" />"/>
                </div>



                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品名称:<select id="name" class="form-control has-feedback-left">
                                    <c:forEach items="${orders.stocks}" var="sto">
                                        <option value="${sto.stock_id}">${sto.stock_name}</option>
                                    </c:forEach>
                             </select>

                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品编号: <input type="text" id="input9" class="form-control has-feedback-left" disabled="disabled"
                                 value="${stocks.stock_id}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品描述: <input type="text" id="input11" class="form-control form-control2 has-feedback-left" readonly="readonly"
                                 value="${stocks.stock_describe}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品单位:<input type="text" id="input12" class="form-control"
                                readonly="readonly" value="${stocks.stock_unit}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    单价:<input type="text" id="input13" class="form-control form-control2"   readonly="readonly" value="${stocks.stock_ordermoney}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    商品数量: <input type="number" id="input14" class="form-control form-control2 has-feedback-left" readonly="readonly"
                                 value="${stocks.stock_count}" />

                </div>

                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
                    总金额:<input type="text" id="input15" class="form-control"
                               readonly="readonly"
                               value="${stocks.stock_count*stocks.stock_ordermoney}"/>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                    <%--仓库: <input type="text" id="input16" class="form-control has-feedback" readonly="readonly"--%>
                    <%--value="${orders.shoopping.shoopping_warehouseid}"/>--%>
                    仓库:  <select id="pid4" class="form-control"   onchange="gradeChange4()"  disabled="disabled"
                                 name="order_state">
                    <option <c:if test="${stocks.stock_warehouseid==1}"> selected="selected"</c:if>>1</option>
                    <option <c:if test="${stocks.stock_warehouseid==2}"> selected="selected"</c:if>>2</option>
                    </select>
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
                $.ajax({
                    type: "GET",//请求类型
                    url: "/OrangBank/UpdateOrder",//请求的url
                    data:{"orderId":$("#input1").val()},
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

