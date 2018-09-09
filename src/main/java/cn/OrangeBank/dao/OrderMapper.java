package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Order;
import cn.OrangeBank.entity.Stock;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Order> queryOrder(Order order);
    List<Order> TotalRows(Order order);
    List<Order> orderList(Map map);
    int delOrder(String id);
    int addOrder(Order order);
    int updateOrder(Order order);
    List<Stock> shop(@Param("stock_name") String stock_name);
}
