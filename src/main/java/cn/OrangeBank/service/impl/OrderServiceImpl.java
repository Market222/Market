package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.OrderMapper;
import cn.OrangeBank.entity.Order;
import cn.OrangeBank.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMapper orderMapper;


    public List<Order> queryOrder(Order order) {
        return orderMapper.queryOrder(order);
    }

    public   List<Order> TotalRows(Order order) {
        return orderMapper.TotalRows(order);
    }

    public List<Order> orderList(Map map) {
        return orderMapper.orderList(map);
    }

    public int delOrder(String id) {
        return orderMapper.delOrder(id);
    }

    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

}
