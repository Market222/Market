package cn.OrangeBank.service;

import cn.OrangeBank.entity.Supplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SupplierService {

    //查询条数
    int count(Supplier supplier);

    //分页查询
    List<Supplier> queryList(Map map);

    boolean addSupp(Supplier supplier);

    List<Supplier> queryList2(Supplier supplier);

    boolean updateSupp(Supplier supplier);

    boolean deleteById(@Param("delId") Integer delId);
}
