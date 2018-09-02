package cn.OrangeBank.dao;


import cn.OrangeBank.entity.Returns;

import java.util.List;
import java.util.Map;

public interface ReturnsMapper{
    List<Returns> TotalRows(Returns returns);
    List<Returns> returnsList(Map map);
    int addReturns(Returns returns);
}
