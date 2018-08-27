package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Users;

import java.util.List;

public interface UsersMapper {
    //登陆
    List<Users> queryUsers(Users users);

    //注册
    int insertUsers(Users users);

    //判断有没有注册
    int countUsers(Users users);
}
