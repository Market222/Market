package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.StockMapper;
import cn.OrangeBank.entity.Stock;
import cn.OrangeBank.service.StockService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Resource
    StockMapper stockMapper;

    public int addStock(Stock stock) {
        return stockMapper.addStock(stock);
    }

    public List<Stock> stoList(Integer id) {
        return stockMapper.stoList(id);
    }

    public int updateSto(Stock sto) {
        return stockMapper.updateSto(sto);
    }
}
