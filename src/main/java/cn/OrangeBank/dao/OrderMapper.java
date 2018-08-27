package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    //查询
    List<Order> queryOrder(Order order);

    //添加
    int insertOrder(Order order);

    //修改
    int updateOrder(Order order);

    //删除
    int deleteOrder(@Param("id")Integer id);
}
