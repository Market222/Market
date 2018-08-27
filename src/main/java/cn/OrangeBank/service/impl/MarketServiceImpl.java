package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.MarketMapper;
import cn.OrangeBank.entity.Client;
import cn.OrangeBank.entity.Market;
import cn.OrangeBank.entity.MarketBack;
import cn.OrangeBank.service.MarketService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MarketServiceImpl implements MarketService {

    @Resource
    private MarketMapper marketMapper;

    public List<Market> queryMarket(Market market) {
        return marketMapper.queryMarket(market);
    }

    public int deleteMarket(Market market) {
        return marketMapper.deleteMarket(market);
    }

    public List<MarketBack> queryMarketBack(MarketBack marketBack) {
        return marketMapper.queryMarketBack(marketBack);
    }

    public List<Client> queryClient(Client client) {
        return marketMapper.queryClient(client);
    }

    public int insertMarketBack(MarketBack marketBack) {
        return marketMapper.insertMarketBack(marketBack);
    }

    public int insertMarket(Market market) {
        return marketMapper.insertMarket(market);
    }

    public int updateMarketBack(MarketBack marketBack) {
        return marketMapper.updateMarketBack(marketBack);
    }
}
