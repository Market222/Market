package cn.OrangeBank.controller;

import cn.OrangeBank.dao.SupplierMapper;
import cn.OrangeBank.entity.*;
import cn.OrangeBank.service.OrderService;
import cn.OrangeBank.service.PositionService;
import cn.OrangeBank.service.StockService;
import cn.OrangeBank.service.SuppliershoopService;
import com.alibaba.fastjson.JSON;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

    @RequestMapping("/UpdateOrder")
    @ResponseBody
    public String updateOrder(@RequestParam() Integer id){
        Stock st=new Stock();
        st.setStock_id(id);
        int i = stockService.updateSto(st);
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
        Users userEntity =(Users) session.getAttribute("userEntity");
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        double countMoney=0;
        if(name!=null){
            for (int i=0;i<name.length;i++) {
                List<Suppliershoop> suppliershoops = suppliershoopService.supList(null, name[i]);
                countMoney += suppliershoops.get(0).getSuppliershoop_stockmoney()*count[0];
            }
        }

        order.setOrder_id(uuid);
        order.setOrder_countmoney(countMoney);
        order.setOrder_usersid(userEntity.getUsers_id());

        if(name!=null) {
            Stock st=new Stock();
            for (int i = 0; i < name.length; i++) {
                List<Suppliershoop> suppliershoops = suppliershoopService.supList(null, name[i]);
                st.setStock_name(suppliershoops.get(0).getSuppliershoop_name());
                st.setStock_describe(suppliershoops.get(0).getSuppliershoop_describe());
                st.setStock_unit(suppliershoops.get(0).getSuppliershoop_unit());
                st.setStock_ordermoney(suppliershoops.get(0).getSuppliershoop_stockmoney());
                st.setStock_count(count[i]);
                st.setStock_orderid(uuid);
                st.setStock_warehouseid(cang);
                int i1 = stockService.addStock(st);
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
        List<Supplier> suplist = supplierMapper.suplist();
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
                            @RequestParam(required = false,defaultValue = "") String  appInfo){
         Page<Order> pages=new Page<Order>();
        Map<String ,Object> map=new HashMap<String, Object>();
        Order order=new Order();
        if(!"".equals(appInfo)){
            //String 转换为对象
            order =(Order) JSON.parseObject(appInfo,Order.class);
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
}