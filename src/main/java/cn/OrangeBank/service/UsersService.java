package cn.OrangeBank.service;

import cn.OrangeBank.entity.Role;
import cn.OrangeBank.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersService {
    //登陆
    List<Users> queryUsers(Users users);

    //注册
    int insertUsers(Users users);

    //判断有没有注册
    int countUsers(Users users);
    //查询用户
    List<Users> SelectUsers(Users users);

    //删除用户
    int Delete(@Param("id") int id);
    //
    //查询角色
    List<Role> SelectRole(Role role);
    //修改用户
    int updateUser(Users user);
}
