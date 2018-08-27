package cn.OrangeBank.service;

import cn.OrangeBank.entity.Shoopping;

import java.util.List;

public interface ShooppingService {
    List<Shoopping> queryShoopping(Shoopping shoopping);

    //删除
    int deleteShopping(Shoopping shoopping);
}
