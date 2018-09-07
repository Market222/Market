package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.service.SupplierService;
import cn.OrangeBank.util.Page;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class SupplierController {

    @Resource
    private SupplierService supplierService;

    ModelAndView mv = new ModelAndView();

    /*  供应商列表信息 */
    @RequestMapping("/sInfo")
    public ModelAndView queryUserList(Supplier supplier, HttpServletRequest request,
                                      @RequestParam(required = false,defaultValue = "1")int pageIndex,
                                      String select){
        Map<String,Object> map = new HashMap<String, Object>();
        int pageSize = 4;
        if(select!=null&&select!=""){
            try {
                select= new String(request.getParameter("select").getBytes("iso-8859-1"),"utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        Page<Supplier> pages = new Page<Supplier>();
        int count = supplierService.count(supplier);
        pages.setTotalRows(count);
        pages.setPageNo(pageIndex);
        pages.setPageSize(pageSize);
        pages.setTotalPages((count+pageSize-1)/pageSize);
        map.put("supplierId",select);
        map.put("s",supplier);
        map.put("begin",(pageIndex-1)*pageSize);
        map.put("end",pageSize);
        List<Supplier> SuppList = supplierService.queryList(map);
        pages.setDatas(SuppList);
        mv.setViewName("Supplier");
        mv.addObject("pages",pages);
        mv.addObject("SuppList",SuppList);
        mv.addObject("select",select);
        return mv;
    }


    /**
     * 添加
     * @param supplier
     * @return
     */
    @RequestMapping("/addS")
    public ModelAndView addUser(Supplier supplier){
        boolean count = false;
        count = supplierService.addSupp(supplier);
        if(count == true){
            mv.addObject("count",count);
            return new ModelAndView("redirect:/sInfo");
        }
        return mv;
    }


    @RequestMapping("/updateShow")
    public ModelAndView showUP(Supplier supplier, ModelAndView mv, @RequestParam("supplierId") Integer supplierId){
        supplier.setSupplierId(supplierId);
        List<Supplier> supplist = supplierService.queryList2(supplier);
        for (Supplier supp : supplist) {
            mv.addObject("supp",supp);
        }
        mv.setViewName("SupplierUpdate");
        return mv;
    }


    @RequestMapping("/updateSupp")
    public ModelAndView updateUser(Supplier supplier, ModelAndView mv, @RequestParam("supplierId") int supplierId){
        supplier.setSupplierId(supplierId);
        boolean b = false;
        b = supplierService.updateSupp(supplier);
        if(b == true){
            mv.addObject("b",b);
            return new ModelAndView("redirect:/sInfo");
        }
        return mv;
    }

    /**
     * 删除供应商信息
     * @param mv
     * @param map
     * @param proid
     * @return
     */
    @RequestMapping("/deleteSupp")
    @ResponseBody
    public Object deletePro(ModelAndView mv, Map<String,Object> map,Integer proid){
        map=new HashMap<String, Object>();
        int p = supplierService.deleteById(proid);
        if(p>0){
            map.put("delSupp","true");
        }else if(p==0){
            map.put("delSupp","notexiss");
        } else{
            map.put("delSupp","false");
        }
        return JSON.toJSONString(map);
    }











}
