package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.entity.Suppliershoop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupplierShoopMapper {
        List<Suppliershoop> supList(@Param("id") Integer id, @Param("shopid") Integer shopid);
        List<Suppliershoop> supShopList(Suppliershoop sup);
}
