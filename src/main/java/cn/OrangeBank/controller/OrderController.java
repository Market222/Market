package cn.OrangeBank.controller;

import cn.OrangeBank.dao.OrderMapper;
import cn.OrangeBank.entity.Order;
import cn.OrangeBank.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/OrangBank")
public class OrderController {

    @Resource
    private OrderService orderService;

    ModelAndView mv = new ModelAndView();

    //进货订单跳转
    @RequestMapping("/Order")
    public ModelAndView orderList(Order order){

        mv.setViewName("OrderList");
        return mv;
    }
}
