package cn.OrangeBank.service;

import cn.OrangeBank.entity.Users;

import java.util.List;

public interface UsersService {
    //登陆
    List<Users> queryUsers(Users users);

    //注册
    int insertUsers(Users users);

    //判断有没有注册
    int countUsers(Users users);
}
