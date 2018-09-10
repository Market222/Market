package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SupplierMapper {
        //查询条数
        int count(Supplier supplier);

    //分页查询
    List<Supplier> queryList(Map map);

    int addSupp(Supplier supplier);

    List<Supplier> queryList2(Supplier supplier);

    int updateSupp(Supplier supplier);

    int deleteById(@Param("delId") Integer delId);

}
