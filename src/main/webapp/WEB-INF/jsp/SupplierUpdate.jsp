<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>

<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>

<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">添加供应商</font></font></a>
    </li>
</ul>
<div class="main">
        <div class="div_box">
            <form class="form-horizontal" action="/updateSupp" method="post">
                <input type="hidden" id="supplierId" name="supplierId" value="${supp.supplierId }"/>
                <div class="form-group">
                    <label for="supplier_name2" class="col-sm-4 control-label">供应商名称:</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplier_name2" name="supplierName" value="${supp.supplierName }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="supplier_contact2" class="col-sm-4 control-label">首要联系人:</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplier_contact2" name="supplierContact" value="${supp.supplierContact }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="supplier_phone2" class="col-sm-4 control-label">手机号:</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplier_phone2" name="supplierPhone" value="${supp.supplierPhone }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="supplier_static2" class="col-sm-4 control-label">使用状态:</label>
                    <div class="col-sm-3">
                        <div class="field">
                            <select class="form-control" id="supplier_static2" name="supplierStatic">
                                <c:choose>
                                    <c:when test="${supp.supplierStatic == 0 }">
                                        <option value="0" selected="selected">未启用</option>
                                        <option value="1">已启用</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">未启用</option>
                                        <option value="1" selected="selected">已启用</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group" style="margin-top: 3rem">
                    <div class=" col-sm-10">
                        <button class="btn btn-default btn-warning icon-check-square-o" type="submit">&nbsp;添加</button>
                        <button class="btn btn-default btn-warning icon-check-square-o" type="reset">&nbsp;重置</button>
                    </div>
                </div>
            </form>
        </div>

    <c:if test="${b==true}">
        <div class="ui-pnotify dark ui-pnotify-fade-normal ui-pnotify-in ui-pnotify-fade-in ui-pnotify-move"
             aria-live="assertive" aria-role="alertdialog" id="ui-pnotifydark2"
             style="width: 300px; margin: 0 auto">
            <div class="alert alert-success alert-dismissible fade in" role="alert"  style="background-color: green;color: #ffffff">
                <h4 class="ui-pnotify-title"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;温馨提示：</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 修改成功！
            </div>
        </div>
    </c:if>
    <c:if test="${b==false}">
        <div class="ui-pnotify dark ui-pnotify-fade-normal ui-pnotify-in ui-pnotify-fade-in ui-pnotify-move"
             aria-live="assertive" aria-role="alertdialog" id="ui-pnotifydark3"
             style="width: 300px;margin: 0 auto">
            <div class="alert alert-success alert-dismissible fade in" role="alert"  style="background-color: green;color: #ffffff">
                <h4 class="ui-pnotify-title"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;温馨提示：</h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 修改失败！
            </div>
        </div>
    </c:if>


</div>

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