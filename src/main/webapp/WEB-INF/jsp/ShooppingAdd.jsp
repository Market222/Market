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
${zui}
<div class="main" style="height: auto;">
    <form style="margin: 0px auto" class="form-horizontal form-label-left"  novalidate action="/OrangBank/AddShop" method="post">
        <span class="section">新增APP基础信息</span>
        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
            商品名称: <input type="text" id="input10" class="form-control form-control2 has-feedback-left"
                         name="shoopping_name"/>

        </div>

        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
            商品描述: <input type="text" id="input11" class="form-control form-control2 has-feedback-left"
                         name="shoopping_describe"/>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
            商品单位:
            <div id="xuan"  style="display: inline-block">
                <select  name="shoopping_unit">
                    <option>个</option>
                    <option>瓶</option>
                    <option>箱</option>
                    <option>件</option>
                    <option>kg</option>
                </select>
            </div>

            <input type="button" id="btnn"  value="手动输入" style="display: inline-block">

        </div>

        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
            商品数量: <input type="number" id="input14" class="form-control form-control2 has-feedback-left"
                         name="shoopping_count" />

        </div>


        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback-left">
            仓库:<select id="cang" name="shoopping_warehouseid">

        </select>

        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <button id="send" type="button" class="btn btn-success">返回</button>
    </form>


    <script src="../statics/vendors/jquery/dist/jquery.min.js"></script>
    <script>

        /*供应商*/
        $.ajax({
            type: "GET",//请求类型
            url: "/OrangBank/Suplist",//请求的url
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）

                if (data != null) {
                    $("#gong").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                    var options = "<option value=\"0\">请选择</option>";
                    for (var i = 0; i < data.length; i++) {
                        //alert(data[i].id);
                        //alert(data[i].proName);
                        options += "<option value=\"" + data[i].supplierId + "\">" + data[i].supplierName + "</option>";
                    }
                    $("#gong").html(options);
                }
            }
        });
        $("#gong").change(function () {
            /*供应商商品*/
            $.ajax({
                type: "GET",//请求类型
                url: "/OrangBank/Suppliershoop",//请求的url
                data:{"id":$("#gong").val()},
                dataType: "json",//ajax接口（请求url）返回的数据类型
                success: function (data) {//data：返回数据（json对象）

                    if (data != null) {
                        $("#sahngp").html("");//通过标签选择器，得到select标签，适用于页面里只有一个select
                        var options='';
                        for (var i = 0; i < data.length; i++) {
                            options+="<input type='checkbox' name='name' value='"+data[i].suppliershoop_id+"'/> <label >"+data[i].suppliershoop_name+"</label>&nbsp;&nbsp;<label >数量：</label><input type='number' name='count'/> <br/>"
                            // options += " <input type=\"checkbox\" id=\"check1\" value='sf' name=\"name\" >\n" +
                            //     "\n" +
                            //     "                            <label for=\"check1\">data[i].suppliershoop_name </label>\n";


                        }

                        $("#sahngp").html(options);
                    }
                }
            });
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
<script>

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
    $("#btnn").click(function() {
        if( $(this).val()=="手动输入"){
            $("#xuan").html(" <input type=\"text\" class=\"form-control form-control2 has-feedback-left\"\n" +
                "                         name=\"shoopping_unit\" />");
            $(this).val("返回")
        }else{
            $("#xuan").html(" <select  name=\"shoopping_unit\">\n" +
                "                    <option>个</option>\n" +
                "                    <option>瓶</option>\n" +
                "                    <option>箱</option>\n" +
                "                    <option>件</option>\n" +
                "                    <option>kg</option>\n" +
                "                </select>")
            $(this).val("手动输入")
        }


    })
</script>







