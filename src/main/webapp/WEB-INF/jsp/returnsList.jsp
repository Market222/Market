<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>

<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">
<style>


</style>
<!-- Datatables -->
<link href="../statics/datatables/css/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="../statics/datatables/css/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">


<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">进货退货</font></font></a>
    </li>
</ul>
<div class="main">
    <button onclick="window.location.href='ReturnsAdd'">新增</button>
    <table id="tabless" class="table table-striped table-bordered dt-responsive <%--nowrap--%>" cellspacing="0" width="100%" >


    </table>
</div>


<%@include file="../jsp/common/foot.jsp" %>

<script src="../statics/datatables/css/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../statics/datatables/css/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script >

    $("#xianshi").click(function (event) {
        $(".none").toggle();
        var cur = $(this).text();
        if (cur) {
            $(this).text(cur === '显示' ? '隐藏' : '显示');
        }
    });

    $(document).ready(function() {

        $("#tabless").DataTable({

            "serverSide":true,//服务器端获取数据
            "bStateSave": false,//不缓存数据
            "ajax": {
                "url":"/Returns/ReturnsList",
                "type": "POST",
                "dataType" : "JSON"
                // "data": function (datas) {
                //     datas.appInfo=JSON.stringify({"softwareName":$("#softwareName").val(),
                //         "status":$("#status").val(),
                //         "flatformId":$("#flatformId").val(),
                //         "categoryLevel1":$("#class1").val(),"categoryLevel2":$("#class2").val(),
                //         "categoryLevel3":$("#class3").val()});
                // }
            },
            lengthMenu: [ //自定义分页长度
                [ 10, 20, 50 ],
                [ '10 页', '20 页', '50页' ]
            ],
            "searching" : false,//关闭搜索框
            "columnDefs":[
                {"title":"退货单号","targets":0},
                {"title":"商品名称","targets":1},
                {"title":"单位","targets":2},
                {"title":"值","targets":3},
                {"title":"进货单价","targets":4},
                {"title":"仓库","targets":5},
                {"title":"操作","targets":6}
            ],
            "columns": [
                { "data": "returns_id"},
                { "data": "ret","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<p>"+data[i].shop.shoopping_name+"</p>"
                        }
                        return zhi;
                    } },
                { "data": "ret","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<p>"+data[i].shop.shoopping_unit+"</p>"
                        }
                        return zhi;
                    } },
                { "data": "ret","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<p>"+data[i].returnsshoop_count+"</p>"
                        }
                        return zhi;
                    } },
                { "data": "ret","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<p>"+data[i].shop.shoopping_stockmoney+"</p>"
                        }
                        return zhi;
                    } },
                { "data": "ret","render": function ( data, type, full, meta ) {
                        var zhi='';
                        for(var i=0;i<data.length;i++){
                            zhi+="<p>"+data[i].shop.shoopping_warehouseid+"</p>"
                        }
                        return zhi;
                    } },
                     { "data": "returns_id","render": function ( data, type, full, meta ) {


                            return "  <td ><a href='OrderView/" +data + "'><i class=\"fa fa-desktop \"></i></a>&nbsp;&nbsp;<a   href='javascript:del(\""+data+"\")'><i\n" +
                                "class=\"fa fa-trash\"></i></a>&nbsp;&nbsp;<a  href='javascript:xg("+data+")'><i class=\"fa fa-edit\"></i><span\n" +
                                "class=\"text-muted\"></span></a></td>";
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



    /*
    var table = $('#example').DataTable();

    table.draw(true);  // 重新绘制维护表格，分页将会被重置为第一页。

    table.draw( false );  //  重新绘制维护当前分页位置的表格。

    table.page( 'next' ).draw( 'page' );  // 更改表格页面，然后重新绘制
     */
    var del=  function (data) {

            if(confirm("确认删除吗")){
                /*供应商*/
                $.ajax({
                    type: "POST",//请求类型
                    url: "/Returns/DelReturn",//请求的url
                    data:{"id": data},
                    dataType: "json",//ajax接口（请求url）返回的数据类型
                    success: function (data) {//data：返回数据（json对象）
                        if(data=="true"){
                            alert("删除成功");
                            var tab= $("#tabless").DataTable();
                            tab.draw( false );

                        }else{
                            alert("删除失败");
                        }
                    }

                });
            }
            else{
                return;
            }
    }
</script>
