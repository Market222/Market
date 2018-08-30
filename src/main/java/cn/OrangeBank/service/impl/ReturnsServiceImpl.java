package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ReturnsMapper;
import cn.OrangeBank.entity.Returns;
import cn.OrangeBank.service.ReturnsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ReturnsServiceImpl implements ReturnsService {

    @Resource
    ReturnsMapper returnsMapper;

    public List<Returns> TotalRows(Returns returns) {
        return returnsMapper.TotalRows(returns);
    }

    public List<Returns> returnsList(Map map) {
        return returnsMapper.returnsList(map);
    }
}
