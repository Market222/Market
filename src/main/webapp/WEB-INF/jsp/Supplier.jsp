<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>

<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">
<style>
    /*点击删除按钮后弹出的层*/
    .zhezhao {
        display: none;          /* 修改这里可以让遮罩层消失*/
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        opacity: 0.7;
        filter: alpha(opacity=70);
        overflow: hidden;
    }
    .remove{
        display: none;       /* 修改这里可以让删除框消失*/
        width: 400px;
        height: 190px;
        position: absolute;
        top: 200px;
        left:500px;
        background: #fff;
        border-radius: 4px;
    }
    .removerChid{
        margin: 4px;
        border: 1px solid #ccc;
    }
    .removerChid h2{
        padding-left: 8px;
        font-size: 14px;
        line-height: 30px;
        margin: 4px 8px;
        border-bottom: 1px solid #99cc33;
    }
    .removeMain{
        margin-top: 38px;
        text-align: center;
        margin-bottom: 30px;
        border-radius: 4px;
    }
    .removeMain a{
        padding: 0 20px;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        border-radius: 4px;
        border: 1px solid #5e8809;
        margin-top: 30px;
        background: #99cc33;
        color: #fff;
    }
    .removeMain a:hover,.removeMain a:active{
        background: #679016;

    }
</style>
<script src="../statics/build/js/laydate/laydate.js"></script>
<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">我的供应商</font></font></a>
    </li>
</ul>
<div class="main">
    <div class="row">
        <form action="/sInfo" method="get">
            <div class="col-md-3">
                <input class="form-control icon" name="select" placeholder="可录入编号，名称，等模糊查询" value="${select}"/>
            </div>
            <div class="col-md-2">
                <input class="form-control icon" placeholder="选择供应商类别查询"/>
            </div>
            <div class="col-md-1" style="width: 60px;margin-top: 6px">
                <a style=" color: red" href="#">选择</a>
            </div>
            <div class="col-md-1" >
               <input class="btn btn-warning" type="submit" value="查询"/>
            </div>
            <div class="col-md-5" style="text-align: right">
                <button type="button" class="btn btn-warning"  data-toggle="modal" data-target="#exampleModal">新增</button>
                <select style="text-align: center;padding: 7px 10px;">
                    <option>更多</option>
                </select>
            </div>
        </form>
        <div class="x_content" style="overflow-x: auto; overflow-y: auto; height: 300px;margin-top: 20px">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th width="7%" colspan="2">操作</th>
                    <th>编号</th>
                    <th>供应商名称</th>
                    <th>首要联系人</th>
                    <th>手机</th>
                    <th>使用状态</th>
                </tr>
                </thead>
                <tbody class="box">
                    <c:forEach var="s" items="${SuppList }" varStatus="status">
                        <tr>
                            <td class="text-muted"></td>

                            <td><a class="fa fa-wrench" href="/updateShow?supplierId=${s.supplierId}"></a></td>
                            <td><a class="deleteProvider fa fa-trash" href="javascript:;" proid=${s.supplierId} proname=${s.supplierName }></a></td>
                            <td>${s.supplierId}</td>
                            <td>${s.supplierName}</td>
                            <td>${s.supplierContact}</td>
                            <td>${s.supplierPhone}</td>
                            <td >
                                 <c:if test="${s.supplierStatic==0}">未启用</c:if>
                                 <c:if test="${s.supplierStatic==1}">已启用</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <p align="center">
        <c:if test="${pages.pageNo > 1}">
            <a href="/sInfo?pageIndex=1&select=${select}">首页</a>
            <a href="/sInfo?pageIndex=${pages.pageNo-1}&select=${select}">上一页</a>
        </c:if>
        <c:if test="${pages.pageNo < pages.totalPages }">
            <a href="/sInfo?pageIndex=${pages.pageNo+1}&select=${select}">下一页</a>
            <a href="/sInfo?pageIndex=${pages.totalPages}&select=${select}">末页</a>
        </c:if>
        <strong>共${pages.totalRows}条记录&nbsp;&nbsp; ${pages.pageNo}/${pages.totalPages}页</strong> <strong>（${pages.totalRows}条记录）</strong>
    </p>


    <!-- 添加的模态框  -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">添加供应商</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="/addS" method="post">
                        <div class="form-group">
                            <label for="supplier_name" class="col-sm-4 control-label">供应商名称:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="supplier_name" name="supplierName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="supplier_contact" class="col-sm-4 control-label">首要联系人:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="supplier_contact" name="supplierContact">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="supplier_phone" class="col-sm-4 control-label">手机号:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="supplier_phone" name="supplierPhone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="supplier_static" class="col-sm-4 control-label">使用状态:</label>
                            <div class="col-sm-5">
                                <div class="field">
                                    <select class="form-control" id="supplier_static" name="supplierStatic">
                                        <option value="0">未启用</option>
                                        <option value="1">已启用</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-default btn-warning icon-check-square-o" type="submit">&nbsp;添加</button>
                            <button class="btn btn-default btn-warning icon-check-square-o" type="reset">&nbsp;重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--点击删除按钮后弹出的页面-->
    <div class="zhezhao"></div>
    <div class="remove" id="removeProv">
        <div class="removerChid">
            <h2>提示</h2>
            <div class="removeMain" >
                <p>你确定要删除该供应商吗？</p>
                <a href="#" id="yes">确定</a>
                <a href="#" id="no">取消</a>
            </div>
        </div>
    </div>

    <c:if test="${count==true}">
    <div class="ui-pnotify dark ui-pnotify-fade-normal ui-pnotify-in ui-pnotify-fade-in ui-pnotify-move"
         aria-live="assertive" aria-role="alertdialog" id="ui-pnotifydark2"
         style="width: 300px; margin: 0 auto">
        <div class="alert alert-success alert-dismissible fade in" role="alert"  style="background-color: green;color: #ffffff">
            <h4 class="ui-pnotify-title"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;温馨提示：</h4>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 添加成功！
        </div>
    </div>
    </c:if>
    <c:if test="${count==false}">
    <div class="ui-pnotify dark ui-pnotify-fade-normal ui-pnotify-in ui-pnotify-fade-in ui-pnotify-move"
         aria-live="assertive" aria-role="alertdialog" id="ui-pnotifydark3"
         style="width: 300px;margin: 0 auto">
        <div class="alert alert-success alert-dismissible fade in" role="alert"  style="background-color: green;color: #ffffff">
            <h4 class="ui-pnotify-title"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;温馨提示：</h4>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 添加失败！
        </div>
    </div>
    </c:if>


    <script type="text/javascript" src="../statics/build/js/xiaoshou.js"></script>
    <script type="text/javascript" src="statics/build/js/users.js"></script>

<%@include file="../jsp/common/foot.jsp" %>
    <script type="text/javascript" src="../statics/build/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../statics/build/js/supplier.js"></script>

    <script>
        $(window).read(function(){
            setTimeout(function () {
                $("#ui-pnotifydark2").fadeOut(600);
            }, 3000);
        })
        $(window).read(function(){
            setTimeout(function () {
                $("#ui-pnotifydark3").fadeOut(600);
            }, 3000);
        });

    </script>