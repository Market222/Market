package cn.OrangeBank.service;

import cn.OrangeBank.entity.Stock;

import java.util.List;

public interface StockService {
    int addStock(Stock stock);
    List<Stock> stoList(Integer id);
    int updateSto(Stock sto);
}
