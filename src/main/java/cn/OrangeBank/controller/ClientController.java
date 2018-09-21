package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Client;
import cn.OrangeBank.service.ClientService;
import cn.OrangeBank.entity.Page;
import com.alibaba.fastjson.JSON;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/OrangBank")
public class ClientController {

    @Resource
    public ClientService clientService;

    ModelAndView mv = new ModelAndView();

    @RequestMapping(value = "/ShowC" , produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String showClient(Client client,@RequestParam(required = false,defaultValue = "0") Integer start,
                            @RequestParam(required = false,defaultValue = "0")Integer length,
                            @RequestParam(required = false,defaultValue = "0")Integer draw){
        Page<Client> pages=new Page<Client>();
        Map<String ,Object> map=new HashMap<String, Object>();
        int count = clientService.countClient(client);

        //分页条件数据
        map.put("client",client);
        map.put("start",start);
        map.put("length",length);
        //查询分页结果
        List<Client> Client = clientService.showClient(map);
        //下面DataTables框架 必须的参数
        pages.setRecordsTotal(count);
        pages.setRecordsFiltered(count);
        pages.setData(Client);
        pages.setDraw(draw);
        return JSON.toJSONString(pages);
    }

    //中转站
    @RequestMapping("/C")
    public ModelAndView C(){
        mv.setViewName("ClientList");
        return mv;
    }
    //根据ID查看信息
    @RequestMapping("/ClientId")
    public ModelAndView ClientId(Client client,@RequestParam(required = false)Integer upid){
        Map<String,Object> map = new HashMap<String, Object>();
        int start = 0;
        int length = 1;
        if(upid!=null){
            client.setClient_id(upid);
        }
        map.put("client",client);
        map.put("start",start);
        map.put("length",length);
        List<Client> clientList = clientService.showClient(map);
        String result = "ClientShow";
        for (Client c :clientList) {
            mv.addObject("client",c);
            if(upid!=null){
                result = "ClientUpd";
            }
            mv.setViewName(result);
        }
        return mv;
    }

    //删除
    @RequestMapping("/deleteClient")
    @ResponseBody
    public String deleteClient(Client client){
        int i = clientService.deleteClient(client);
        return JSON.toJSONString(i);
    }

    //修改
    @RequestMapping("/ClientUpd")
    public ModelAndView ClientUpd(Client client){
        int i = clientService.updateClient(client);
        if(i>0){
            return new ModelAndView("redirect:/OrangBank/C");
        }
        return mv;
    }

    //新增中转站
    @RequestMapping("/addClient")
    public ModelAndView addClient(){
        mv.setViewName("ClientAdd");
        return mv;
    }

    //添加
    @RequestMapping("/ClientAdd")
    public ModelAndView ClientAdd(Client client){
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        client.setClient_invoice(uuid);
        int i = clientService.addClient(client);
        if(i>0){
            return new ModelAndView("redirect:/OrangBank/C");
        }
        return mv;
    }

    //判断客户存不存在
    @RequestMapping("/countClient")
    @ResponseBody
    public String countClient(Client client){
        int i = clientService.countClient(client);
        return JSON.toJSONString(i);
    }

}
