package cn.OrangeBank.service;

import cn.OrangeBank.entity.Order;
import cn.OrangeBank.entity.Stock;

import java.util.List;
import java.util.Map;

public interface OrderService {
    List<Order> queryOrder(Order order);
    List<Order>  TotalRows(Order order);
    List<Order> orderList(Map map);
    int delOrder(String id);
    int addOrder(Order order);
    int updateOrder(Order order);
    List<Stock> shop(String stock_name);
}

