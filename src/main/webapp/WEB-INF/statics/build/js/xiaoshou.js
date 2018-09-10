$(function () {
    a();
    function a(){
        $.ajax({
            type:"POST",//请求类型
            url:"/OrangBank/queryShoopping",//请求的url
            async: false,//设置成同步
            data:{"shoopping.shoopping_name":$("#shangpinmingcheng").val(),
                "client.client_name":$("#marketBack_linkman").val(),
                "client.client_phone":$("#marketBack_phone").val(),
                "client.client_specialplane":$("#marketBack_plane").val(),
                "client.client_salesman":$("#marketBack_salesman").val(),
                "client.client_invoice":$("#marketBack_bill").val()
                },
            dataType:"json",//ajax接口（请求url）返回的数据类型
            success:function(data){//data：返回数据（json对象）
                if(data != null){
                    var count = 1;
                    var tt="";
                    var td2 = "<td scope='row'></td>";
                    var sum = 0;
                    var count2 = 0;
                    var tr="";
                    for(var i = 0; i < data.length; i++){
                        var td = "<td scope='row'>"+count+"</td>";
                        count++;
                        var summ= data[i].marketBack.marketBack_count * data[i].shoopping.shoopping_marketmoney;
                        td += "<td style='width: 11%'><a href=\"/OrangBank/ShoppingView?did="+data[i].market_id+"\"><i class=\"fa fa-desktop\"></i></a>&nbsp;<a href=\"/OrangBank/deleteShopping?sid="+data[i].market_id+"\"><i\n" +
                            "                            class=\"fa fa-trash\"></i></a>&nbsp;<a href=\"/OrangBank/ShopUpd?sid="+data[i].marketBack.marketBack_id+"\"><i class=\"fa fa-edit\"></i><span\n" +
                            "                            class=\"text-muted\"></span></a></td>";
                        td += "<td style='width: 10%'>"+data[i].shoopping.shoopping_name+"</td>"
                        td += "<td>"+data[i].shoopping.shoopping_unit+"</td>";
                        td += "<td>"+data[i].marketBack.marketBack_count+"</td>";
                        td += "<td>"+data[i].shoopping.shoopping_marketmoney+"</td>";
                        td += "<td>"+summ+"</td>";
                        td += "<td>"+data[i].position.position_name+"</td>";
                        sum += summ;
                        count2 += data[i].marketBack.marketBack_count;
                        tr="<tr>"+td+"</tr>";
                        tt+=tr;
                    }
                    td2 += "<td></td>";
                    td2 += "<td>"+"</td>";
                    td2 += "<td></td>";
                    td2 += "<td>"+"总数量："+count2+"</td>";
                    td2 += "<td></td>";
                    td2 += "<td>"+"总金额："+sum+"</td>";
                    td2 += "<td></td>";
                    $(".box").html(tt+"<tr>"+td2+"</tr>");
                }
            }
        });
    }
    /*模糊查询鼠标离开事件*/
    $(".row div input").blur(function () {
        a();
    })

})