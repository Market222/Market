package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.MarketBackMapper;
import cn.OrangeBank.service.MarketBackService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MarketBackServiceImpl implements MarketBackService {

    @Resource
    private MarketBackMapper marketBackMapper;

}
