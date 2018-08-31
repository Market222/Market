package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Stock;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StockMapper {
    int addStock(Stock stock);
    List<Stock> stoList(@Param("id")Integer id);
    int updateSto(Stock sto);
}
