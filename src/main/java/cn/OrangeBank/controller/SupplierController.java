package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.service.SupplierService;
import cn.OrangeBank.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Supplier")
public class SupplierController {

    @Resource
    private SupplierService supplierService;

    ModelAndView mv = new ModelAndView();


    /*  供应商列表信息 */
    @RequestMapping("/SuppList")
    public ModelAndView queryUserList(Supplier supplier, HttpServletRequest request,
                                      @RequestParam(required = false,defaultValue = "1")int pageIndex,
                                      String select){
        Map<String,Object> map = new HashMap<String, Object>();
        int pageSize = 10;
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
        mv.setViewName("SupplierList");
        mv.addObject("pages",pages);
        mv.addObject("SuppList",SuppList);
        mv.addObject("select",select);
        return mv;
    }


    //跳转
    @RequestMapping("add")
    public String add(){
        return "SupplierAdd";
    }

    /**
     * 添加信息
     * @param supplier
     * @return
     */
    @RequestMapping("/addSupp")
    public ModelAndView addUser(Supplier supplier,HttpSession session){
        boolean count = false;
        count = supplierService.addSupp(supplier);
        if(count == true){
            session.setAttribute("shan","<script>alert(\"添加成功\");</script>");
            return new ModelAndView("redirect:/Supplier/SuppList");
        }else{
            mv.setViewName("SupplierAdd");
        }
        return mv;
    }

    /**
     * 显示修改信息
     * @param supplier
     * @param mv
     * @param supplierId
     * @return
     */
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

    /**
     * 修改信息
     * @param supplier
     * @param mv
     * @param supplierId
     * @return
     */
    @RequestMapping("/updateSupp")
    public ModelAndView updateUser(Supplier supplier, ModelAndView mv, HttpSession session, @RequestParam("supplierId") int supplierId){
        supplier.setSupplierId(supplierId);
        boolean b = false;
        b = supplierService.updateSupp(supplier);
        if(b == true){
            session.setAttribute("shan","<script>alert(\"修改成功\");</script>");
            return new ModelAndView("redirect:/Supplier/SuppList");
        }else{
            mv.setViewName("SupplierUpdate");
        }
        return mv;
    }


    /**
     * 删除信息
     * @param proid
     * @param session
     * @return
     */
    @RequestMapping("/SupplierDel/{proid}")
    public ModelAndView CreturnsDel(@PathVariable Integer proid, HttpSession session){
        boolean b = false;
        b = supplierService.deleteById(proid);
        if(b == true){
            session.setAttribute("shan","<script>alert(\"删除成功\");</script>");
            return new ModelAndView("redirect:/Supplier/SuppList");
        }else{
            mv.setViewName("SupplierList");
        }
        return  mv;
    }




}
