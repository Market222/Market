package cn.OrangeBank.controller;

import cn.OrangeBank.entity.Role;
import cn.OrangeBank.entity.Users;
import cn.OrangeBank.service.UsersService;
import cn.OrangeBank.util.MD5andKL;
import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/OrangBank")
public class UsersController {
    @Resource
    private UsersService usersService;

    ModelAndView mv = new ModelAndView();

    //登陆//
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
    public Object countUsers(Users users, String users_name){
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

    //查询用户
    @RequestMapping("/SelectUsers")
    public ModelAndView SelectUsers(Users users) {
        List<Users> usersList = usersService.SelectUsers(users);
        mv.addObject("usersList", usersList);
        mv.setViewName("UsersSelect");
        return mv;
    }

    //删除用户
    @RequestMapping("/delete")
    public  ModelAndView Delete(@Param("users_id") Integer  users_id){
        int delete = usersService.Delete(users_id);
        if(delete>0){
            return new ModelAndView("redirect:/OrangBank/SelectUsers");
        }else {
            mv.setViewName("UsersSelect");
        }
        return mv;
    }

    //根据id查询用户
    @RequestMapping("/SelectUsersid")
    public ModelAndView SelectUsersid(Users users , @Param("users_id") Integer users_id ,Role role) {
        users.setUsers_id(users_id);
        List<Users> users1 = usersService.SelectUsers(users);
        List<Role> grroleList = usersService.SelectRole(role);
        mv.addObject("grroleList", grroleList);
        for (Users users2 : users1) {
            mv.addObject("users2", users2);
        }
        mv.setViewName("UsersUpdate");
        return mv;
    }

    /**
     * 修改
     */
    @RequestMapping(value = "/Update")
    @ResponseBody
    public Object Update(Users user){
        int i = usersService.updateUser(user);
        return JSON.toJSONString(i);
    }


    // *
    //     *  修改个人用户
    //     * @param users
    //     * @param mv
    //     * @return
    //
    @RequestMapping("/GRupdate")
    public ModelAndView GRupdate(Users users, ModelAndView mv, @RequestParam(required = false) Integer users_id){
        users.setUsers_id(users_id);
        int i = usersService.updateUser(users);
        if(i>0){
            return SelectUsersid(users,users_id,null);
            /* return new ModelAndView("redirect:/OrangBank/queryUseraa?id=users_id");*/
        }else{
            mv.setViewName("UsersUpdate");
        }
        return mv;
    }

    //退出
    @RequestMapping("/exitUser")
    public ModelAndView exitUser(HttpServletRequest request){
        Object obj = request.getSession().getAttribute("userEntity");
        if(obj != null){
            request.getSession().invalidate();//清除 session 中的所有信息
            return new ModelAndView("redirect:/OrangBank/b");
        }
        return mv;
    }

}
