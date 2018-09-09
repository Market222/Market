<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>销售排行榜</title>
    <!-- Bootstrap -->
    <link href="../statics/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../statics/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">


    <script src="../statics/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../statics/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    table {

        margin: 0 auto;
    }
    /*关键设置 tbody出现滚动条*/
    table tbody {
        display: block;
        height: auto;


    }

    table thead,
    tbody tr {
        display: table;
        width: 100%;
        table-layout: fixed;
        height: 50px;
    }



    table thead th {
        background: #ccc;
    }
        tr td,th{
            text-align: center;
            line-height: 15px;
            height: 15px;
        }

    .btn-danger{
        width: 20%;
        margin-top: 30px;
        margin-bottom: 30px;
        margin-left: 42%;
    }
</style>
<body style="width: 100%">
<button   class="btn btn-danger" onclick="window.location.href='/OrangBank/Sales_charts2'">刷新排行榜</button>
<c:if test="${list2==null}">
    <h3  id="top10" style="color: red;text-align: right;margin-right: 10%;margin-top: -5%">TOP10</h3>
</c:if>

    <table width="80%" border="1">
        <thead>
        <tr>
            <th>商品名称</th>
            <th>销量</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list">
        <tr>
             <td>${list.shoopping_name}</td>
             <td>${list.shoopping_sales}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
<c:if test="${list2==null}">
    <a id="pai" href="#" onclick="pai()" style="float: right;margin-right: 10%;height: 40px;line-height: 40px">查看所有商品销售排行</a>
</c:if>
<script>
    function pai() {

        window.location.href='/OrangBank/Sales_charts';

    }
</script>
</body>

</html>
