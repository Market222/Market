<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>
<style>
    select{
        height:35px;line-height:35px;width: 450px;margin-right: 10%
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
            style="vertical-align: inherit;">新增进货</font></font></a>
    </li>
</ul>
<div class="main" style="height: auto;">
    <form style="margin: 0px auto" class="form-horizontal form-label-left"  novalidate action="/Returns/ReturnsAdd" method="post">
        <span class="section">新增APP基础信息</span>

      <div class="item form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">选择商品<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="shop" style="display: inline-block ;width: 27%"></select>
                数量：
                <input type="number" id="num" style="display: inline-block;height: 4.2%"/>
                <input type="button" value="确定" id="ok"  style="display: inline-block;">
            </div>a
        </div>
        <div class="item form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">退回商品列表<span class="required">*</span>
            </label>
           <textarea id="tui" name="shopList" style="margin-right: 0px"></textarea>
        </div>

        <div class="item form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">供应商<span class="required">*</span>
            </label>
            <input type="text" readonly="readonly" id="gong" />
            <input type="hidden" readonly="readonly" id="gongid" />
        </div>
        <div class="item form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">退回理由<span class="required">*</span>
            </label>
            <textarea id="tuiLi" style="margin-right: 0px" name="returns_returnsobjection"></textarea>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-s  m-3 col-xs-12" for="name">发送状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="pid" name="returns_state" onchange="gradeChange()"
                        name="order_state">
                    <option >未发送</option>
                    <option >已发送</option>
                </select>
            </div>
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
                if (grade == '已拒绝') {
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
                if (grade == '已发货') {
                    $(".shijian").css("display", "block");
                } else {
                    $(".shijian").css("display", "none");
                }
            };
            function gradeChange5() {
                var objS = document.getElementById("gong");
                var grade = objS.options[objS.selectedIndex].value;
                if (grade > 0) {

                    $(".gongyingshang").css("display", "block");
                    $(".sahngp").css("display", "block");
                } else {
                    $(".sahngp").css("display", "none");
                }
            };
        </script>

        <div class="item form-group fasong" style="display: none"
        >


            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">发送时间 <span class="required">*</span>
            </label>
            <input style="margin-left: -53%" name="returns_sendtime" readonly="readonly" class="laydate-icon" id="demo"/>

            <script>
                !function () {
                    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
                    laydate({elem: '#demo'});//绑定元素

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

        <div class="item form-group ">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">供应商确认状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="pid2"
                        onchange="gradeChange2()" name="returns_stateConfirmation">
                    <option>待确认</option>
                    <option>已确认</option>
                </select>
            </div>
        </div>
        <div class="item form-group queren" style="display: none">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">确认时间 <span class="required">*</span>
            </label>
            <input style="margin-left: -53%" class="laydate-icon"  readonly="readonly" name="returns_confirmedtime" id="demo1"/>
            <script>
                !function () {
                    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
                    laydate({elem: '#demo1'});//绑定元素

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
        <div class="item form-group ">
            <label class="control-label col-md-3 col-sm-3 col-xs-7g12">拒绝状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select  id="pid3"
                        onchange="gradeChange3()" name="returns_objectionstatus">
                    <option >未拒绝</option>
                    <option >已拒绝</option>
                </select>
            </div>
        </div>
        <div class="item form-group jujue" style="display: none">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">拒绝理由 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <textarea style="width: 450px;margin-left:6%" id="textarea" required="required" name="returns_objection"
                          class="form-control col-md-7 col-xs-12"></textarea>
            </div>
        </div>

        <div class="ju">
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12">出库状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select id="pid4"
                        onchange="gradeChange4()" name="returns_warehousestatus">
                    <option >未出库</option>
                    <option >已出库</option>
                </select>
            </div>
        </div>
        <div class="item form-group shijian" style="display: none" id="chu">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">出库时间 <span class="required">*</span>
            </label>
            <input  style="margin-left: -52.5%" class="laydate-icon"  readonly="readonly" name="returns_warehousetime" id="demo2" />
            <script>

                !function () {
                    laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
                    laydate({elem: '#demo2'});//绑定元素

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
        <div class="item form-group" >
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">供应商收货状态<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <select  name="returns_takestatus" id="shou">
                        <option>未收货</option>
                        <option>已收货</option>
                </select>
            </div>
        </div>
            <div class="item form-group shijian" id="shoutime" style="display: none">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">供应商收货时间 <span class="required">*</span>
                </label>
                <input  style="margin-left: -52.5%" class="laydate-icon"  readonly="readonly" name="returns_taketime" id="demo3" />
                <script>
                    !function () {
                        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
                        laydate({elem: '#demo3'});//绑定元素

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
            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">供应商付款状态 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <select  name="returns_paymentstatus">
                        <option >未付款</option>
                        <option >已付款</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="ln_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
                <button type="submit" class="btn btn-primary">保存</button>
                <button id="send" type="button" class="btn btn-success">返回</button>
            </div>
        </div>
    </form>


    <script src="../statics/vendors/jquery/dist/jquery.min.js"></script>


    <script>
        /*时间隐藏*/
        $("#pid4").change(function () {
            if($(this).val()=="已出库"){
                $("#chu").show();
            }else{
                $("#chu").hide();
                $("#shou").val("未收货")
            }

        })
        $("#shou").change(function () {

            if($(this).val()=="已收货"){
                $("#shoutime").show();
            }else{
                $("#shoutime").hide();
            }
        })



        shop();
        function shop(){
            /*商品*/
            $.ajax({
                type: "GET",//请求类型
                url: "/Returns/ShopList",//请求的url
                data:{"supId":$("#gongid").val()},
                dataType: "json",//ajax接口（请求url）返回的数据类型
                success: function(data) {//data：返回数据（json对象）
                    if (data!=null) {

                        $("#shop").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                        var options = "<option value=\"0\">请选择</option>";


                        for (var i = 0; i < data.length; i++) {
                            options += "<option>" + data[i].shoopping_name + "</option>";
                        }
                    }


                    $("#shop").html(options);
                }

            });
        }
        function gong(){

            /*供应商*/
            $.ajax({
                type: "POST",//请求类型
                url: "/Returns/SupShopList",//请求的url
                data:{"shop": $("#shop").val()},
                dataType: "json",//ajax接口（请求url）返回的数据类型
                success: function (data) {//data：返回数据（json对象）
                    if (data != null) {
                        $("#gong").html("");
                        $("#gong").val(data.supp.supplierName);
                        var options = "<option value=\"0\">请选择</option>";
                        for (var i = 0; i < data.shop.length; i++) {
                            for (var s = 0; s < data.sup.length; s++) {
                                if (data.shop[i].shoopping_name == data.sup[s].suppliershoop_name) {
                                    options += "<option>" + data.shop[i].shoopping_name + "</option>";
                                }
                            }
                            //alert(data[i].id);
                            //alert(data[i].proName);
                            $("#shop").html("");
                            $("#shop").html(options);
                        }
                    }
                }
            });
        }
        $("#ok").click(function () {

            var tui=$("#tui").text();
            if(tui==null || tui==""){
                tui+=$("#shop").val()+"-"+$("#num").val();

            }else{
                tui+=","+$("#shop").val()+"-"+$("#num").val();
            }
            $("#tui").text(tui);
            $("#num").val("");
            /*供应商*/
            gong();

        })

        /*仓库*/
        $.ajax({
            type: "GET",//请求类型
            url: "/OrangBank/PosList",//请求的url
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）

                if (data != null) {
                    $("#cang").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                    var options = "<option value=\"0\">请选择</option>";
                    for (var i = 0; i < data.length; i++) {
                        //alert(data[i].id);
                        //alert(data[i].proName);
                        options += "<option value=\"" + data[i].position_id + "\">" + data[i].position_name + "</option>";
                    }
                    $("#cang").html(options);
                }
            }
        });
    </script>


    <%--仓库：${orders.stockcommodities.stockcommodity_warehouseid} <br/>--%>
</div>


<%@include file="../jsp/common/foot.jsp" %>







