package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Returnsshoop;
import org.apache.ibatis.annotations.Param;

public interface ReturnsshoopMapper {
    int addReShop(Returnsshoop reShop);
    int delReShop(@Param("id") String id);
}
