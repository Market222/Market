package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Shoopping;

import java.util.List;

public interface ShooppingMapper {
    //查询
    List<Shoopping> queryShoopping(Shoopping shoopping);

    //删除
    int deleteShopping(Shoopping shoopping);
}
