package cn.OrangeBank.service;

import cn.OrangeBank.entity.Returnsshoop;
import org.apache.ibatis.annotations.Param;

public interface ReturnsshoopService {
    int addReShop(Returnsshoop reShop);
    int delReShop(@Param("id")String id);
}
