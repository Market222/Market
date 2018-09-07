package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.ShooppingService;
import com.alibaba.fastjson.JSON;
import com.sun.xml.internal.xsom.impl.scd.Iterators;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/OrangBank")
public class ShooppingController {
    @Resource
    private ShooppingService shooppingService;
    List<Shoopping> shooppingList=new ArrayList<Shoopping>();
    Shoopping shoopping=new Shoopping();

    @RequestMapping("/Sales_charts")
    public ModelAndView queryShoopping(){
        shooppingList=shooppingService.queryShoopping(shoopping);
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",shooppingList);
        mv.addObject("list2",shooppingList);
        mv.setViewName("Sales_charts");
        return mv;
    }

    @RequestMapping("/Sales_charts2")
    public ModelAndView queryShoopping2(){
        shooppingList=shooppingService.shopList(shoopping);
        ModelAndView mv=new ModelAndView();
                mv.addObject("list",shooppingList);
                mv.setViewName("Sales_charts");
        return mv;
    }
}
