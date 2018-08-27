package cn.OrangeBank.controller;

import cn.OrangeBank.service.ShooppingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/OrangBank")
public class ShooppingController {

    @Resource
    private ShooppingService shooppingService;

    ModelAndView mv = new ModelAndView();


}
