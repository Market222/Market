package cn.OrangeBank.dao;


import cn.OrangeBank.entity.Returns;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ReturnsMapper{
    List<Returns> TotalRows(Returns returns);
    List<Returns> returnsList(Map map);

    int addReturns(Returns returns);
    int delReturns(@Param("id") String id);
}
