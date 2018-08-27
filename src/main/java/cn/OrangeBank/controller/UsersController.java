package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Users;
import cn.OrangeBank.service.UsersService;
import cn.OrangeBank.util.MD5andKL;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class UsersController {

    @Resource
    private UsersService usersService;

    ModelAndView mv = new ModelAndView();

    //登陆
    @RequestMapping("/Login")
    public String Login(Users users, HttpSession session){
        List<Users> usersList = usersService.queryUsers(users);
        String pwd = MD5andKL.MD5(users.getUsers_password(),"md5").toLowerCase();
        for (Users us :usersList) {
            if(users.getUsers_name().equals(us.getUsers_name()) && pwd.equals(us.getUsers_password())){
                session.setAttribute("userEntity",us);
                return "redirect:/OrangBank/aa";
            }
        }
        return "redirect:/OrangBank/b";
    }

    //登陆成功
    @RequestMapping("/aa")
    public ModelAndView a(){
        mv.setViewName("index");
        return mv;
    }
    //登陆失败
    @RequestMapping("/b")
    public ModelAndView b(){
        mv.setViewName("../login");
        return mv;
    }

    //注册
    @RequestMapping("/insertUsers")
    public ModelAndView insertUsers(Users users){
        String pwd = MD5andKL.MD5(users.getUsers_password(),"md5").toLowerCase();
        users.setUsers_password(pwd);
        int i = usersService.insertUsers(users);
        if(i>0){
            System.out.println("添加成功！");
            return new ModelAndView("redirect:/OrangBank/b");
        }else{
            System.out.println("添加失败！");
        }
        return mv;
    }

    //跳入销售页面
    @RequestMapping("/xiaoshou")
    public ModelAndView xiaoshou(){
        mv.setViewName("xiaoshou");
        return mv;
    }


    //判断用户有没有注册
    @RequestMapping("/countUsers")
    @ResponseBody
    public Object countUsers(Users users,String users_name){
        users.setUsers_name(users_name);
        int i = usersService.countUsers(users);
        Map<String,Object> map = new HashMap<String, Object>();
        if(i>0){
            map.put("usersname","exist");
        }else{
            map.put("usersname","true");
        }
        return JSON.toJSONString(map);
    }


   /* //UUID
    @RequestMapping("/q")
    public ModelAndView sa(){
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        System.out.println(uuid);
        return mv;
    }*/
}
