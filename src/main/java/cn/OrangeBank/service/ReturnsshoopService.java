package cn.OrangeBank.service;

import cn.OrangeBank.entity.Returnsshoop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReturnsshoopService {
    List<Returnsshoop> reList(Returnsshoop re);
    int addReShop(Returnsshoop reShop);
    int delReShop(@Param("id")String id);
    int updateShop(Returnsshoop reShop);
}
