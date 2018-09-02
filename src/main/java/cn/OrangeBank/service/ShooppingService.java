package cn.OrangeBank.service;

import cn.OrangeBank.entity.Shoopping;

import java.util.List;

public interface ShooppingService {
    //查询
    List<Shoopping> queryShoopping(Shoopping shoopping);

    List<Shoopping> shopList(Shoopping shop);
}
