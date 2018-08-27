<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>

<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">
<script src="../statics/build/js/laydate/laydate.js"></script>
<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">销售订单</font></font></a>
    </li>
</ul>
<div class="main">
    <div class="row">
        <div class="col-md-3">
            客户：
            <select style="height:30px;line-height: 30px;width: 150px">
                <option>1</option>
            </select>
        </div>
        <div class="col-md-3">
            <div class="demo1">
                销售日期：
                <input class="laydate-icon" id="demo"/>
            </div>
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
        <div class="col-md-3">
            商品名称：
            <input class="icon" id="shangpinmingcheng"/>
        </div>
        <div class="col-md-3 xian">
            <a href="/OrangBank/insertMarket" >新增</a>
        </div>
        <div class="col-md-3 xian">
            <a href="#" id="xianshi" onclick="xs()">显示</a>
        </div>

        <div class="none" style="display: none;">

            <div class="row">
                <div class="row">
                    <div class="col-md-3">送货地址：<input type="text" id="cityChoice" value="请选择城市" readonly="readonly">
                        <script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
                        <script type="text/javascript" src="../statics/build/js/city-data.js"></script>
                        <script type="text/javascript" src="../statics/build/js/hzw-city-picker.min.js"></script>
                        <script>
                            var cityPicker = new HzwCityPicker({
                                data: data,
                                target: 'cityChoice',
                                valType: 'k-v',
                                hideCityInput: {
                                    name: 'city',
                                    id: 'city'
                                },
                                hideProvinceInput: {
                                    name: 'province',
                                    id: 'province'
                                },
                            });
                            cityPicker.init();
                        </script>
                    </div>
                    <div class="col-md-3">联系人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
                            class="cityChoice" id="marketBack_linkman"/></div>
                    <div class="col-md-3">手机：<input class="cityChoice" id="marketBack_phone" /></div>
                    <div class="col-md-3">座机：<input class="cityChoice" id="marketBack_plane"/></div>
                </div>
                <div class="row">
                    <div class="col-md-3">销售员：&nbsp;&nbsp;&nbsp;<input class="cityChoice" id="marketBack_salesman"/></div>
                    <div class="col-md-3">销售发票号：<input class="cityChoice" id="marketBack_bill"/></div>
                    <div class="col-md-3">制单人：张三</div>
                    <%
                        Date d = new Date();
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String now = df.format(d);
                    %>
                    <div class="col-md-3">制单时间：<%=now %></div>
                </div>

            </div>
        </div>
        <div class="x_content" style="overflow-x: auto; overflow-y: auto; height: 300px;margin-top: 20px">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th>商品名称</th>
                    <th>单位</th>
                    <th>数量</th>
                    <th>销售单价</th>
                    <th>金额</th>
                    <th>仓库</th>
                </tr>
                </thead>
                <tbody class="box">

                </tbody>
            </table>
        </div>

    </div>

</div>
<%@include file="../jsp/common/foot.jsp" %>
<script>

    $("#xianshi").click(function (event) {
        $(".none").toggle();
        var cur = $(this).text();
        if (cur) {
            $(this).text(cur === '显示' ? '隐藏' : '显示');
        }
    });

</script>
<script type="text/javascript" src="../statics/build/js/xiaoshou.js"></script>