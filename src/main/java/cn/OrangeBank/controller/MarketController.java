package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Client;
import cn.OrangeBank.entity.Market;
import cn.OrangeBank.entity.MarketBack;
import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.MarketService;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/OrangBank")
public class MarketController {

    @Resource
    private MarketService marketService;

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/queryShoopping",produces="text/html;charset=UTF-8;")
    @ResponseBody
    public Object queryShoopping(Market market){
        List<Market> marketList = marketService.queryMarket(market);
        return JSON.toJSONString(marketList);
    }

    //删除
    @RequestMapping(value = "/deleteShopping",produces="text/html;charset=UTF-8;")
    public ModelAndView deleteShopping(@RequestParam(required = false)Integer sid, Market market){
        market.setMarket_id(sid);
        int i = marketService.deleteMarket(market);
        if(i>0){
            System.out.println("删除成功！");
            return new ModelAndView("redirect:/OrangBank/deleteShop");
        }else{
            System.out.println("删除失败！");
        }
        return mv;
    }

    //删除中转站
    @RequestMapping("/deleteShop")
    public ModelAndView deleteShop(){
        mv.setViewName("xiaoshou");
        return mv;
    }

    //新增中转站
    @RequestMapping(value = "/insertMarket")
    public ModelAndView Market(Market market, MarketBack marketBack,Client client) {
        List<Market> queryMarket = marketService.queryMarket(market);
        List<Client> clientList = marketService.queryClient(client);
        mv.addObject("Market",queryMarket);
        mv.addObject("clientList",clientList);
        mv.setViewName("ShopInsert");
        return mv;
    }

    //查看销售订单
    @RequestMapping("/ShoppingView")
    public ModelAndView ShopView(Market market, @RequestParam(required = false)Integer did, Shoopping shoopping){
        market.setMarket_id(did);
        List<Market> queryMarket = marketService.queryMarket(market);
        for (Market Mar:queryMarket) {
            mv.addObject("mar",Mar);
        }
        mv.setViewName("ShopView");
        return mv;
    }

    //添加
    @RequestMapping("/insertMarketBack")
    public ModelAndView insertMarketBack(MarketBack marketBack,Market market){
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        marketBack.setMarketBack_id(uuid);
        marketBack.setMarketBack_prepareddate(new Date());
        int i = marketService.insertMarketBack(marketBack);
        if(i>0){
            market.setMarket_marketBackid(uuid);
            int count = marketService.insertMarket(market);
            if(count>0){
                return new ModelAndView("redirect:/OrangBank/deleteShop");
            }
        }
        return mv;
    }

    //修改之前查询
    @RequestMapping("/ShopUpd")
    public ModelAndView ShopUpd(@RequestParam(required = false)String sid,MarketBack marketBack,Client client,Market market){
        marketBack.setMarketBack_id(sid);
        List<MarketBack> marketBackList = marketService.queryMarketBack(marketBack);
        List<Client> clientList = marketService.queryClient(client);
        market.setMarketBack(marketBack);
        List<Market> queryMarket = marketService.queryMarket(market);
        mv.addObject("clientList",clientList);
        for (MarketBack M:marketBackList) {
            mv.addObject("marketBackList",M);
        }

        for (Market Ms:queryMarket) {
            mv.addObject("Ms",Ms);
        }
        mv.setViewName("ShopUpdate");
        return mv;
    }

    //修改
    @RequestMapping("/ShopUpdate")
    public ModelAndView ShopUpdate(MarketBack marketBack){
        int i = marketService.updateMarketBack(marketBack);
        if(i>0){
            return new ModelAndView("redirect:/OrangBank/deleteShop");
        }
        return mv;
    }
}
