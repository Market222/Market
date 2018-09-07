<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../jsp/common/head.jsp" %>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script src="../statics/JSPwindow/lib/layui/layui.js"></script>
<script type="text/javascript" src="../statics/JSPwindow/js/xadmin.js"></script>
<link type="text/css" rel="styleSheet" href="../statics/CSS/xiaoshou.css"/>
<link rel="stylesheet" type="text/css" href="../statics/CSS/hzw-city-picker.css">
<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
                                              aria-expanded="true"><font style="vertical-align: inherit;"><font
            style="vertical-align: inherit;">用户与权限</font></font></a>
    </li>
</ul>

<div class="main">
    <div class="row">
        <div class="col-md-3">
            </select>
        </div>
    </div>
    <div class="col-md-3 xian">
        <a href="javascript:location.reload()" rel="external nofollow" id="xianshi"  >同步用户</a>
    </div>
    <div class="x_content" style="overflow-x: auto; overflow-y: auto; height: 300px">
        <table class="table table-bordered" style="color:#000">
            <thead>
            <tr>
                <th>用户</th>
                <th>真实姓名</th>
                <th>手机</th>
                <th>邮箱</th>
                <th>角色</th>
                <th>操作</th>
            </tr>
            </thead>
            <c:forEach var="users" items="${usersList}" varStatus="status">
                <tr>
                    <td>${users.users_name}</td>
                    <td>${users.users_truename}</td>
                    <td>${users.users_phone}</td>
                    <td>${users.users_email}</td>
                    <td>${users.role.role_name}</td>
                    <c:if test="${users.role_id==1}">
                        <td></td>
                    </c:if>
                    <c:if test="${users.role_id!=1}">
                        <td>
                            <i class="fa fa-wrench"  onclick="update('用户修改','/OrangBank/SelectUsersid?users_id=${users.users_id}','800','700')"  href="javascript:;" title="修改"></i>
                            &nbsp; &nbsp;
                            <i class="fa fa-trash" data-toggle="modal" data-target="#delete" onclick="delete1('${users.users_id}')"href="javascript:;" title="删除"></i>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%-- 删除模态框 --%>
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="date">设置权限</h4>
            </div>
            <form>
                <h3 style="text-align: center">是否删除该用户</h3>
                <div class="modal-footer">
                    <input type="hidden"  id="users_id"/>
                    <button type="button" class="btn btn-default deletess" value="0" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary deletes" value="1"  >确定</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    //刷新页面
    $(function(){
        $(".xian").click(function(){
            window.location.reload();
        });
    });
    // 编辑
    function update (title,url,w,h) {
        x_admin_show(title,url,w,h);
    }
    //删除
    function delete1(id){
            $(".deletes").click(function () {
                window.location.href="/OrangBank/delete?users_id="+id+"";
                $('#delete').modal('hide')
                alert("删除成功")
            });
        }
</script>
<%@include file="../jsp/common/foot.jsp" %>
