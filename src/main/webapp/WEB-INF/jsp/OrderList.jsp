<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../jsp/common/head.jsp" %>

    <link rel="stylesheet" href="../statics/build/css/pintuer.css">
    <link rel="stylesheet" href="../statics/build/css/admin.css">


<div class="">
    <%-- 订单列表 --%>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 订单列表</strong></div>
        <div class="padding border-bottom">
            <div class="body-content">
                <form method="post" class="form-x">
                    <div class="form-group">
                        <div class="label">
                            <label style="font-size: 15px;">商品名称：</label>
                        </div>
                        <div class="field">
                            <select class="form-control" name="departmentId">
                                <option value="0">请选择一级分类</option>
                            </select>
                        </div>
                        <div class="field">
                            <select class="form-control" name="departmentId">
                                <option value="0">请选择二级分类</option>
                            </select>
                        </div>
                        <div class="field">
                            <select class="form-control" name="departmentId">
                                <option value="0">请选择三级分类</option>
                            </select>
                        </div>
                        <div class="field">
                            <button class="btn btn-default btn-warning icon-check-square-o" type="submit">&nbsp;查询</button>
                        </div>
                        <a class="btn btn-default btn-warning icon-plus-square-o float-right" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" style="margin-right: 2.3rem" href=""> 添加订单</a>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-hover text-center">
            <tr class="active"  style="font-size: 15px">
                <th width="8%">进货日期</th>
                <th width="8%">进货单号</th>
                <th width="8%">供应商名字</th>
                <th width="8%">金额</th>
                <th width="8%">累计付款金额</th>
                <th width="8%">预付金额</th>
                <th width="8%">入库状态</th>
                <th width="15%">收票状态</th>
                <th width="15%">备注</th>
                <th width="40%">操作</th>
            </tr>
            <tr  style="font-size: 13px;" class="tab_td">
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td style="padding-top: 1.7rem">普通用户</td>
                <td>
                    <div class="button-group">
                        <a class="button border-main" href="">  <span class="icon-calendar-o"></span> 查看</a>
                        <a class="button border-yellow" href="">  <span class="icon-edit"></span> 修改</a>
                        <a class="button border-red" href="javascript:void(0)" onclick="return del(1,2)"> <span class="icon-trash-o"></span> 删除</a>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <a href="">上一页</a>
                        <span class="current">1</span>
                        <a href="">2</a>
                        <a href="">3</a>
                        <a href="">下一页</a>
                        <a href="">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <!-- 添加的模态框  -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="exampleModalLabel">添加订单</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="" method="post">
                        <div class="form-group">
                            <label for="name" class="col-sm-4 control-label">订单名称:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-4 control-label">订单单价:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="num" class="col-sm-4 control-label">订单数量:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="num">
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
        <a href="" onclick="deleteShop()"></a>
    </div>

    <script type="text/javascript">
        function del(id,mid){
            if(confirm("您确定要删除吗?")){
            }
        }
    </script>

</div>






<%@include file="../jsp/common/foot.jsp" %>

