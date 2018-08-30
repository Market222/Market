package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ShooppingMapper;
import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.ShooppingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShooppingServiceImpl implements ShooppingService {

    @Resource
    private ShooppingMapper shooppingMapper;

    public List<Shoopping> shopList(Shoopping shop) {
        return shooppingMapper.shopList(shop);
    }
}
