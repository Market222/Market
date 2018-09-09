package cn.OrangeBank.controller;

import cn.OrangeBank.dao.SupplierShoopMapper;
import cn.OrangeBank.entity.*;
import cn.OrangeBank.service.*;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/Returns")
public class ReturnsController {

    @Resource
    ReturnsService returnsService;

    @Resource
    ShooppingService shooppingService;

    @Resource
    SuppliershoopService suppliershoopService;

    @Resource
    SupplierService supplierService;
    @Resource
    ReturnsshoopService returnsshoopService;


    @RequestMapping(value = "SupShopList",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String supShopList(@RequestParam()String shop){
            Suppliershoop sup=new Suppliershoop();
        sup.setSuppliershoop_name(shop);
        List<Suppliershoop> suppliershoops = suppliershoopService.supShopList(sup);
        int suppId = (int)suppliershoops.get(0).getSuppliershoop_supplierid();
        Supplier su=new Supplier();
        su.setSupplierId(suppId);
        List<Supplier> suppliers = supplierService.queryList2(su);
        Supplier s = suppliers.get(0);
        Shoopping sh=new Shoopping();
        List<Shoopping> shooppings = shooppingService.shopList(sh);
        List<Suppliershoop> supplier= suppliershoopService.supList(Integer.valueOf(s.getSupplierId()), null);
        Map map =new HashMap();
        map.put("shop",shooppings);
        map.put("sup",supplier);
        map.put("supp",s);
        return JSON.toJSONString(map);
    }

    @RequestMapping("tiao")
    public String tiao(){
        return  "returnsList";
    }
    @RequestMapping("tiao2/{id}")
    public String tiao2(@PathVariable() String id ,Model m){
        Returns returns=new Returns();
        returns.setReturns_id(id);
        List<Returns> returnsList = returnsService.TotalRows(returns);
        m.addAttribute("returnsList",returnsList.get(0));
        return  "returnsUpdate";
    }

    @RequestMapping(value = "ShopList",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String shopList(@RequestParam() String supId){
        Shoopping sh=new Shoopping();
        List<Shoopping> shooppings = shooppingService.shopList(sh);

        return JSON.toJSONString(shooppings);
    }

    @RequestMapping(value = "/ReturnsList",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String returnList(@RequestParam(required = false,defaultValue = "0") Integer start,
                             @RequestParam(required = false,defaultValue = "0")Integer length,
                             @RequestParam(required = false,defaultValue = "0")Integer draw,
                             @RequestParam("pan") String pan,
                             @RequestParam("zhi") String zhi){

             Page<Returns> pages=new Page<Returns>();
            Map<String ,Object> map=new HashMap<String, Object>();
            Returns returns=new Returns();
            if(zhi!=null && !zhi.equals("")){
                if (pan.equals("1")){
                    returns.setReturns_id(zhi);
                }else   if (pan.equals("2")){
                    returns.setShop_name(zhi);
                }
            }

            int count =returnsService.TotalRows(returns).size();
            //分页条件数据
            map.put("returns",returns);
            map.put("start",start);
            map.put("length",length);
            //查询分页结果
            List<Returns> returnsList = returnsService.returnsList(map);
            //下面DataTables框架 必须的参数
            pages.setRecordsTotal(count);
            pages.setRecordsFiltered(count);
            pages.setData(returnsList);
            pages.setDraw(draw);
            return JSON.toJSONString(pages);
        }


        @RequestMapping("/ReturnsAdd")
        public String returnsAdd(String shopList, Returns returns, HttpSession session){
            if(shopList==null || shopList==""){
                return "retturnsAdd";
            }
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            Shoopping sh=new Shoopping();
            Returnsshoop reShop=new Returnsshoop();
            double countMoney=0;
            String[] shop = shopList.trim().split(",");
            for (int i=0; i<shop.length; i++){
                String[] shopcont = shop[i].split("-");
                sh.setShoopping_name(shopcont[0]);
                Shoopping shoopping = shooppingService.queryShoopping(sh).get(0);
                reShop.setShop(shoopping);
                reShop.setReturnsshoop_count(Integer.valueOf(shopcont[1]));
                   reShop.setReturnsshoop_orderid(uuid);
                countMoney+=shoopping.getShoopping_stockmoney()*Integer.valueOf(shopcont[1]);
                int zhi = returnsshoopService.addReShop(reShop);
            }
            Users userEntity =(Users) session.getAttribute("userEntity");
            returns.setReturns_id(uuid);
            returns.setReturns_countmoney(countMoney);
            returns.setReturns_userid(userEntity.getUsers_id());
            int i = returnsService.addReturns(returns);
            if(i>0){
            return  "redirect:/Returns/tiao";
            }else{
                return  "retturnsAdd.jsp";
            }
        }

    @RequestMapping("/DelReturn")
    @ResponseBody
    public String delReturn( @RequestParam() String id) {
        int i = returnsService.delReturns(id);
        String pan="";
        if(i>0){
            int shop = returnsshoopService.delReShop(id);
            pan="true";
        }
        return JSON.toJSONString(pan);
    }

    @RequestMapping("/ReturnsView/{id}")
    public String returnsView(@PathVariable() String id, Model m) {
        Returns returns=new Returns();
        returns.setReturns_id(id);
        List<Returns> returnsList = returnsService.TotalRows(returns);
        m.addAttribute("returnsList",returnsList.get(0));
        return "returnsView";
    }


    @RequestMapping(value = "/Shop",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String shop(@RequestParam("id") Integer id,@RequestParam("orderId") String orderId){
        Returnsshoop ret =new Returnsshoop();
        ret.setShop(new Shoopping());
        ret.getShop().setShoopping_id(id);
        ret.setReturnsshoop_orderid(orderId);
        List<Returnsshoop> returnsshoops = returnsshoopService.reList(ret);
        return JSON.toJSONString(returnsshoops);
    }

    @RequestMapping(value = "/UpdateReturns",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String updateReturns(@RequestParam("id") Integer id,@RequestParam("count")Integer count){
        Returnsshoop re=new Returnsshoop();
        re.setReturnsshoop_id(id);
        re.setReturnsshoop_count(count);
        int shop = returnsshoopService.updateShop(re);
        return JSON.toJSONString(shop);
    }

    @RequestMapping(value = "/ding",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String ding(@RequestParam("zhi") String zhi, @RequestParam("pan")String pan){
        Returns returns=new Returns();
        if(zhi!=null && !zhi.equals("")){
            if (pan.equals("1")){
                returns.setReturns_id(zhi);
            }else   if (pan.equals("2")){
                returns.setShop_name(zhi);
            }
        }

        List<Returns> returnsList = returnsService.TotalRows(returns);
        return JSON.toJSONString(returnsList);
    }


}
