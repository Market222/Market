package cn.OrangeBank.controller;

import cn.OrangeBank.dao.SupplierShoopMapper;
import cn.OrangeBank.entity.*;
import cn.OrangeBank.service.*;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
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
                             @RequestParam(required = false,defaultValue = "") String  appInfo){
             Page<Returns> pages=new Page<Returns>();
            Map<String ,Object> map=new HashMap<String, Object>();
            Returns returns=new Returns();
            if(!"".equals(appInfo)){
                //String 转换为对象
                returns =(Returns) JSON.parseObject(appInfo,Returns.class);
            }
            int count =returnsService.TotalRows(returns).size();
            //分页条件数据
            map.put("appInfo",returns);
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
    public String delReturn( @RequestParam() Integer id) {
        int i = returnsService.delReturns(id);
        String pan="";
        if(i>0){
            pan="true";
        }
        return JSON.toJSONString(pan);
    }
}
