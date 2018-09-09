package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Order;
import cn.OrangeBank.entity.Page;
import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.ShooppingService;
import com.alibaba.fastjson.JSON;
import com.sun.xml.internal.xsom.impl.scd.Iterators;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    //跳转
    @RequestMapping("tiaoShop")
    public String tiao3(){
        return "ShooppingList";
    }

    @RequestMapping("/Sales_charts2")
    public ModelAndView queryShoopping2(){
        shooppingList=shooppingService.shopList(shoopping);
        ModelAndView mv=new ModelAndView();
                mv.addObject("list",shooppingList);
                mv.setViewName("Sales_charts");
        return mv;
    }

    @RequestMapping("/AddShop")
    public String addShop(Shoopping shop ,Model m){
        if(shop.getShoopping_name()==null || shop.getShoopping_name()==""){
            return "ShooppingAdd";
        }
        shop.setShoopping_sales(0);
        shop.setShoopping_stockmoney(0);
        shop.setShoopping_marketmoney(0);
        List<Shoopping> shooppings = shooppingService.queryShoopping(shop);
        int shop1=0;
        if(shooppings.size()>0){
            Shoopping sh=new Shoopping();
            sh.setShoopping_id(shooppings.get(0).getShoopping_id());
            sh.setShoopping_count(shooppings.get(0).getShoopping_count()+shop.getShoopping_count());
             shop1 = shooppingService.updateShop(sh);
        }else{
             shop1 = shooppingService.addShop(shop);
        }
        if(shop1<1){
            m.addAttribute("zui","<script>alert('新增失败')</script>");
            return "ShooppingAdd";

        }
        return "ShooppingList";
    }

    //详情
    @RequestMapping("/ShooppingView/{id}")
    public String orderView(@PathVariable String id, Model m  ){
        Shoopping sh=new Shoopping();
        sh.setShoopping_id(Integer.valueOf(id));
        List<Shoopping> shooppings = shooppingService.TotalRows(sh);
        m.addAttribute("shop",shooppings.get(0));

        return "ShooppingView";
    }

    //删除
    @RequestMapping("/DelShop")
    @ResponseBody
    public String delShop(@RequestParam String id ){

        int i = shooppingService.deleteShopping(Integer.valueOf(id));
        if(i>0){
            id="true";
        }
        return JSON.toJSONString(id);
    }


    @RequestMapping(value = "/ShooppingList" , produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String orderList(@RequestParam(required = false,defaultValue = "0") Integer start,
                            @RequestParam(required = false,defaultValue = "0")Integer length,
                            @RequestParam(required = false,defaultValue = "0")Integer draw,
                            @RequestParam("pan") String pan,
                            @RequestParam("zhi") String zhi){
        Page<Shoopping> pages=new Page<Shoopping>();
        Map<String ,Object> map=new HashMap<String, Object>();
        Shoopping shop=new Shoopping();
        if(zhi!=null && !zhi.equals("")){
            if(pan.equals("1")){
              shop.setShoopping_name(zhi);
            }else if(pan.equals("2")){
                shop.setPosition_name(zhi);
            }
        }
        int count =shooppingService.TotalRows(shop).size();
        //分页条件数据
        map.put("shop",shop);
        map.put("start",start);
        map.put("length",length);
        //查询分页结果
        List<Shoopping> shoopings = shooppingService.shooppingList(map);
        //下面DataTables框架 必须的参数
        pages.setRecordsTotal(count);
        pages.setRecordsFiltered(count);
        pages.setData(shoopings);
        pages.setDraw(draw);
        return JSON.toJSONString(pages);
    }
}
