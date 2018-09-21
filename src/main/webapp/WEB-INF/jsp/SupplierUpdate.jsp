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
    <li><a href="/Supplier/SuppList"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">我的供应商</font></font></a>
    </li>
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">修改供应商</font></font></a>
    </li>
</ul>
<div class="main" style="height: auto;">
    <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">修改供应商</h3>
    </div>
    <div class="modal-body">
        <form class="form-horizontal" action="/Supplier/updateSupp" method="post">
            <input type="hidden" id="supplierId" name="supplierId" value="${supp.supplierId }"/>
            <div class="form-group">
                <label for="supplier_name2" class="col-sm-4 control-label">供应商名称:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="supplier_name2" name="supplierName" value="${supp.supplierName }">
                </div>
            </div>
            <div class="form-group">
                <label for="supplier_contact2" class="col-sm-4 control-label">首要联系人:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="supplier_contact2" name="supplierContact" value="${supp.supplierContact }">
                </div>
            </div>
            <div class="form-group">
                <label for="supplier_phone2" class="col-sm-4 control-label">手机号:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="supplier_phone2" name="supplierPhone" value="${supp.supplierPhone }">
                </div>
            </div>
            <div class="form-group">
                <label for="supplier_static2" class="col-sm-4 control-label">使用状态:</label>
                <div class="col-sm-5">
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
            <div class="modal-footer">
                <div class="col-sm-7">
                    <button class="btn btn-default btn-warning " type="submit">&nbsp;修改</button>
                    <button class="btn btn-default btn-warning " type="reset">&nbsp;重置</button>
                </div>
            </div>
        </form>
    </div>
    ${sessionScope.shan}
    <% session.setAttribute("shan","");%>
</div>

<%@include file="../jsp/common/foot.jsp" %>







