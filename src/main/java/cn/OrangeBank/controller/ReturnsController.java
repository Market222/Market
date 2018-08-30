package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Page;
import cn.OrangeBank.entity.Returns;
import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.ReturnsService;
import cn.OrangeBank.service.ShooppingService;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Returns")
public class ReturnsController {

    @Resource
    ReturnsService returnsService;

    @Resource
    ShooppingService shooppingService;


    @RequestMapping("tiao")
    public String tiao(){
        return  "returnsList";
    }

    @RequestMapping("ShopList")
    @ResponseBody
    public String shopList(){
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
        public String returnsAdd(){

            return "retturnsAdd";
        }

    }
