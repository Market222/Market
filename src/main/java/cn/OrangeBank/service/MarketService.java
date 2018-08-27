package cn.OrangeBank.service;

import cn.OrangeBank.entity.Client;
import cn.OrangeBank.entity.Market;
import cn.OrangeBank.entity.MarketBack;

import java.util.List;

public interface MarketService {
    //查询
    List<Market> queryMarket(Market market);

    //删除
    int deleteMarket(Market market);

    //查询下拉列表
    List<MarketBack> queryMarketBack(MarketBack marketBack);

    //查询下拉列表
    List<Client> queryClient(Client client);

    //添加销售订单
    int insertMarketBack(MarketBack marketBack);

    //添加销售商品
    int insertMarket(Market market);

    //修改销售订单
    int updateMarketBack(MarketBack marketBack);
}
