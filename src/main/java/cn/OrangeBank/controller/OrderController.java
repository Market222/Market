package cn.OrangeBank.controller;

import cn.OrangeBank.dao.SupplierMapper;
import cn.OrangeBank.entity.*;
import cn.OrangeBank.service.*;
import com.alibaba.fastjson.JSON;
import jdk.internal.org.objectweb.asm.tree.InnerClassNode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping("/OrangBank")
public class OrderController {

    @Resource
    private OrderService orderService;

    @Resource
    private PositionService positionService;

    @Resource
    private StockService stockService;

    @Resource
    private SuppliershoopService suppliershoopService;

    @Resource
    private SupplierMapper supplierMapper;
    @Resource
    private ShooppingService shooppingService;

    ModelAndView mv = new ModelAndView();

    public ModelAndView orderList(Order order){
        mv.setViewName("");
        return mv;
    }
    //跳转
    @RequestMapping("tiao2")
    public String tiao2(){
        return "index";
    }

    //跳转
    @RequestMapping("tiao3")
    public String tiao3(){
        return "Sales_charts";
    }
    //跳转
    @RequestMapping("tiao")
    public String tiao(){
        return "OrderList";
    }
    //详情
    @RequestMapping("/OrderView/{id}")
    public String orderView(@PathVariable String id, Model m , Order order ){

        order.setOrder_id(id);
        List<Order> orders = orderService.TotalRows(order);
        m.addAttribute("orders",orders.get(0));

        m.addAttribute("stocks",orders.get(0).getStocks().get(0));
        return "OrderView";
    }

    @RequestMapping(value = "/Shop",produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String shop(@RequestParam("id") Integer id){

        List<Stock> stocks = stockService.stoList(id);
        return JSON.toJSONString(stocks);
    }

    @RequestMapping(value = "/UpdateOrder")
    @ResponseBody
    public String updateOrder( @RequestParam() String id ,
                               @RequestParam() String describe,
                               @RequestParam() String count ,
                               @RequestParam() String ordermoney ,
                               Stock sto){

        try {
                     describe = new String(describe.getBytes(
                    "ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        sto.setStock_id(Integer.valueOf(id));
      sto.setStock_describe(describe);
      sto.setStock_count(Integer.valueOf(ordermoney));
      sto.setStock_ordermoney(Double.valueOf(count));
        int i = stockService.updateSto(sto);
        String pan="";
        if(i>0){
             pan="true";
        }
        return JSON.toJSONString(pan);
    }

    //添加
    @RequestMapping("/AddOrder")
    public String OrderAdd(HttpSession session, Model m , Order order , Integer[] name, Integer[] count , Integer cang){

        if(order.getOrder_state()==null){
            return "OrderAdd";
        }
        Integer[] count2=new Integer[count.length];
        int n=0;
        for(int i=0 ;i<count.length; i++){
            if(count[i]!=null){
                count2[n]=count[i];
                n+=1;
            }

        }
        Users userEntity =(Users) session.getAttribute("userEntity");
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        double countMoney=0;
        if(name!=null){
            for (int i=0;i<name.length;i++) {
                List<Suppliershoop> suppliershoops = suppliershoopService.supList(null, name[i]);
                countMoney += suppliershoops.get(0).getSuppliershoop_stockmoney()*count2[i];
            }
        }

        order.setOrder_id(uuid);
        order.setOrder_countmoney(countMoney);
        order.setOrder_usersid(userEntity.getUsers_id());

        if(name!=null) {
            Stock st=new Stock();
            Shoopping sh=new Shoopping();
            for (int i = 0; i < name.length; i++) {
                List<Suppliershoop> suppliershoops = suppliershoopService.supList(null, name[i]);
                st.setStock_name(suppliershoops.get(0).getSuppliershoop_name());
                st.setStock_describe(suppliershoops.get(0).getSuppliershoop_describe());
                st.setStock_unit(suppliershoops.get(0).getSuppliershoop_unit());
                st.setStock_ordermoney(suppliershoops.get(0).getSuppliershoop_stockmoney());
                st.setStock_count(count2[i]);
                st.setStock_orderid(uuid);
                st.setStock_warehouseid(cang);
                int i1 = stockService.addStock(st);
                if("已入库".equals(order.getOrder_warehousestatus())){
                    sh.setShoopping_name(st.getStock_name());
                    sh.setShoopping_stockmoney(st.getStock_ordermoney());
                    sh.setShoopping_warehouseid(cang);
                    List<Shoopping> shooppings = shooppingService.queryShoopping(sh);
                    int size = shooppings.size();

                    if(size==1){
                        sh.setShoopping_id(shooppings.get(0).getShoopping_id());
                        sh.setShoopping_count(count2[i]+shooppings.get(0).getShoopping_count());
                        int shop = shooppingService.updateShop(sh);
                        System.out.println(shop);
                    }else{
                        sh.setShoopping_name(st.getStock_name());
                        sh.setShoopping_warehouseid(st.getStock_warehouseid());
                        sh.setShoopping_count(count2[i]);
                        sh.setShoopping_stockmoney(st.getStock_ordermoney());
                        sh.setShoopping_describe(st.getStock_describe());
                        sh.setShoopping_sales(0);
                        sh.setShoopping_unit(st.getStock_unit());
                        int shop = shooppingService.addShop(sh);
                        System.out.println(shop);
                    }
                }
            }
        }

        int i = orderService.addOrder(order);
        return  "redirect:/OrangBank/tiao";
    }

    //删除
    @RequestMapping("/OrderDel/{id}")
    public String orderDel(@PathVariable String id){

        int i = orderService.delOrder(id);
        if(i>0)
        {
            return  "redirect:/OrangBank/tiao";
        }
        return  "OrderList";
    }

    //供应商
    @RequestMapping(value = "/Suplist", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String suplist(){
        List<Supplier> suplist = supplierMapper.queryList(null);
        return JSON.toJSONString(suplist);
    }
    //供应商
    @RequestMapping(value = "/Suppliershoop", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String Suppliershoop(@RequestParam Integer id){
        List<Suppliershoop> suppliershoops = suppliershoopService.supList(id,null);

        return JSON.toJSONString(suppliershoops);
    }

    //仓库
    @RequestMapping(value = "/PosList", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String posList(){
        List<Position> positions = positionService.posList();
        return JSON.toJSONString(positions);
    }

    //订单
    @RequestMapping(value = "/OrderList" , produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String orderList(@RequestParam(required = false,defaultValue = "0") Integer start,
                            @RequestParam(required = false,defaultValue = "0")Integer length,
                            @RequestParam(required = false,defaultValue = "0")Integer draw,
                            @RequestParam("pan") String pan,
                            @RequestParam("zhi") String zhi){
         Page<Order> pages=new Page<Order>();
        Map<String ,Object> map=new HashMap<String, Object>();
        Order order=new Order();
        if(zhi!=null && !zhi.equals("")){
            if(pan.equals("1")){
                order.setOrder_id(zhi);
            }else if(pan.equals("2")){
               order.setStock_name(zhi);
            }else if(pan.equals("3")){
                order.setPosition_name(zhi);
            }
        }
        int count =orderService.TotalRows(order).size();
        //分页条件数据
        map.put("appInfo",order);
        map.put("start",start);
        map.put("length",length);
        //查询分页结果
        List<Order> orders = orderService.orderList(map);
        //下面DataTables框架 必须的参数
        pages.setRecordsTotal(count);
        pages.setRecordsFiltered(count);
        pages.setData(orders);
        pages.setDraw(draw);
        return JSON.toJSONString(pages);
    }
    //供应商
    @RequestMapping(value = "/ding", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String ding(@RequestParam("zhi") String zhi, @RequestParam("pan")Integer pan){
         Order or=new Order();
        if(pan==1){
            or.setOrder_id(zhi);
        }else  if(pan==2){
            List<Stock> shop = orderService.shop(zhi);
            return JSON.toJSONString(shop);
        }else  if(pan==3){
            or.setPosition_name(zhi);
        }
        List<Order> orders = orderService.TotalRows(or);
          return JSON.toJSONString(orders);
    }

}