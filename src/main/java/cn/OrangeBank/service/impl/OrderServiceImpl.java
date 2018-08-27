package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.OrderMapper;
import cn.OrangeBank.entity.Order;
import cn.OrangeBank.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMapper orderMapper;
    public List<Order> queryOrder(Order order) {
        return orderMapper.queryOrder(order);
    }

    public int insertOrder(Order order) {
        return orderMapper.insertOrder(order);
    }

    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    public int deleteOrder(Integer id) {
        return orderMapper.deleteOrder(id);
    }
}
