package cn.OrangeBank.service;


import cn.OrangeBank.entity.Returns;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ReturnsService {
    List<Returns> TotalRows(Returns returns);
    List<Returns> returnsList(Map map);
    int addReturns(Returns returns);
    int delReturns(@Param("id")String id);
}
