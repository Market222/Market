package cn.OrangeBank.service;


import cn.OrangeBank.entity.Returns;

import java.util.List;
import java.util.Map;

public interface ReturnsService {
    List<Returns> TotalRows(Returns returns);
    List<Returns> returnsList(Map map);
}
