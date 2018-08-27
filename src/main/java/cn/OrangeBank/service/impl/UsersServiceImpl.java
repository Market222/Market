package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.UsersMapper;
import cn.OrangeBank.entity.Users;
import cn.OrangeBank.service.UsersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Resource
    private UsersMapper usersMapper;

    public List<Users> queryUsers(Users users) {
        return usersMapper.queryUsers(users);
    }

    public int insertUsers(Users users) {
        return usersMapper.insertUsers(users);
    }

    public int countUsers(Users users) {
        return usersMapper.countUsers(users);
    }
}
