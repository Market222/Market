var usersname = null;
var error = null;
var pan = null;

$(function () {

    $("#recipient-name").bind("blur",function(){

        usersname = $("#recipient-name").val();
        pan = $("#pan");
        error = document.getElementById("register_error");
        if(usersname == ''){
            error.innerHTML = "请输入账号";
            return;
        }
        $.ajax({
            type:"GET",//请求类型
            url:"/OrangBank/countUsers",//请求的url
            data:{"users_name":usersname},//请求参数
            dataType:"json",//ajax接口（请求url）返回的数据类型
            success:function(data){//data：返回数据（json对象）
                if(data.usersname == "exist"){//账号已存在，错误提示
                    error.innerHTML = "该用户账号已存在";
                    pan.val("qqq")
                }else{//账号可用，正确提示
                    error.innerHTML = "该账号可以使用";
                    pan.val("true")
                }
            }
        });
    })
})
