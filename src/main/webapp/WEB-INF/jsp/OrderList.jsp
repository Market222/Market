<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/OrderList.css"/>

<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">

<!-- Datatables -->
<link href="../statics/datatables/css/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li><a href="/OrangBank/tiao2"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">首页</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">进货订单</font></font></a>
    </li>
</ul>
<div class="main">
    条件：<select id="pan">
    <option value="1">订单号</option>
    <option value="2">商品名称</option>
    <option value="3">仓库</option>
</select>
    <input type="text" id="cha"/><input type="button"  id ="select" value="查询">
    <button onclick="window.location.href='AddOrder'">新增</button>

<div class="main2" style="width: 80%">
    <button   class="btn btn-danger" onclick="window.location.href='AddOrder'">新增订单</button>
    <table id="tabless" class="table table-striped table-bordered dt-responsive <%--nowrap--%>" cellspacing="0" width="100%" >


    </table>
</div>


<%@include file="../jsp/common/foot.jsp" %>

<script src="../statics/datatables/css/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../statics/datatables/css/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script>

    $("#xianshi").click(function (event) {
        $(".none").toggle();
        var cur = $(this).text();
        if (cur) {
            $(this).text(cur === '显示' ? '隐藏' : '显示');
        }
    });
    $(document).ready(function() {

        $("#tabless").DataTable({
            "bAutoWidth":true,
            "serverSide":true,//服务器端获取数据
            "bStateSave": false,//不缓存数据
            "dom": '<"row"<"col-lg-1"<"toolbar">><"col-lg-4"B><"col-lg-7"f>>t<"row"<"col-lg-2"l><"col-lg-3"i><"col-lg-7"p>>',
            "ajax": {
                "url":"/OrangBank/OrderList",
                "type": "POST",
                "dataType" : "JSON"
            },
            lengthMenu: [ //自定义分页长度
                [ 10, 20, 50 ],
                [ '10 页', '20 页', '50页' ]
            ],
            "searching" : false,//关闭搜索框
            "columnDefs":[

                {"title":"订单号","targets":0},
                {"title":"商品名称","targets":1},
                {"title":"单位","targets":2},
                {"title":"值","targets":3},
                {"title":"销售单价","targets":4},
                {"title":"仓库","targets":5},
                {"title":"操作","targets":6}
            ],
            "columns": [
                { "data": "order_id"},
                { "data": "stocks","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            // zhi="<p>"+data[i].stock_name+"</p>"
                            zhi+="<option value='"+i+"'>"+data[i].stock_name+"</option>";
                        }

                        var zhi2="<select class=\"form-control1 odd\" id=\"one"+meta.row+"\" onchange=\"one("+meta.row+")\"  name=\"order_state\">"+zhi+"</select>";
                        return zhi2;
                    } },
                { "data": "stocks","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<option  value='"+i+"'>"+data[i].stock_unit+"</option>"
                        }
                        var zhi2="<select class=\"form-control1 odd\" id='two"+meta.row+"'   name=\"order_state\"  disabled=\"disabled\"> "+zhi+"</select>";
                        return zhi2;
                    } },
                { "data": "stocks","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<option  value='"+i+"'>"+data[i].stock_count+"</option>"
                        }
                        var zhi2="<select class=\"form-control1 odd\"  id='three"+meta.row+"' name=\"order_state\"  disabled=\"disabled\">"+zhi+"</select>";
                        return zhi2;
                    } },
                { "data": "stocks","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<option  value='"+i+"'>"+data[i].stock_ordermoney+"元</option>"
                        }
                        var zhi2="<select class=\"form-control1 odd\" id='four"+meta.row+"'  name=\"order_state\"  disabled=\"disabled\">"+zhi+"</select>";
                        return zhi2;
                    } },
                { "data": "stocks","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<option  value='"+i+"'>"+data[i].stock_warehouseid+"</option>"
                        }
                        var zhi2="<select class=\"form-control1 odd\"   id='five"+meta.row+"' name=\"order_state\"  disabled=\"disabled\">"+zhi+"</select>";
                        return zhi2;
                    } },
                { "data": "order_id","render": function ( data, type, full, meta ) {


                        return "  <td><a  href='OrderView/" +data + "'><i class=\"fa fa-desktop \"></i></a>&nbsp;&nbsp;<a href='OrderDel/"+data+"'><i\n" +
                            "                            class=\"fa fa-trash\"></i></a>&nbsp;&nbsp;<a  href='javascript:xg("+data+")'><i class=\"fa fa-edit\"></i><span\n" +
                            "                            class=\"text-muted\"></span></a></td>";
                    }}
            ],
            "oLanguage" : { // 国际化配置
                "sProcessing": "正在获取数据，请稍后...",
                "sLengthMenu": "显示 _MENU_ 条",
                "sZeroRecords": "没有找到数据",
                "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                "sInfoEmpty": "记录数为0",
                "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                "sInfoPostFix": "",
                "sSearch": "查询",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "最后一页"
                }
            }
        });
        $(".btn-success").on("click",function () {
            $('#datatable-responsive').DataTable().ajax.reload();
        });
        $("#queryAppInfo").on("click",function () {
            $('#datatable-responsive').DataTable().ajax.reload();
        });
        $('#datatable-fixed-header').DataTable({
            fixedHeader: true
        });
    });
    one=function(data){
        var objS = document.getElementById("one"+data);
        var  grade= objS.options[objS.selectedIndex].value;
        $("#two"+data).val(grade);
        $("#three"+data).val(grade);
        $("#four"+data).val(grade);
        $("#five"+data).val(grade);

    }

</script>

