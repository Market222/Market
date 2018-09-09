package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ShooppingMapper;
import cn.OrangeBank.entity.Shoopping;
import cn.OrangeBank.service.ShooppingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ShooppingServiceImpl implements ShooppingService {

    @Resource
    private ShooppingMapper shooppingMapper;

    public List<Shoopping> queryShoopping(Shoopping shoopping) {
        return shooppingMapper.queryShoopping(shoopping);
    }

    public List<Shoopping> shopList(Shoopping shop) {
        return shooppingMapper.shopList(shop);
    }

    public int addShop(Shoopping shoopping) {
        return shooppingMapper.addShop(shoopping);
    }

    public int updateShop(Shoopping shoopping) {
        return shooppingMapper.updateShop(shoopping);
    }

    public List<Shoopping> TotalRows(Shoopping shop) {
        return shooppingMapper.TotalRows(shop);
    }

    public List<Shoopping> shooppingList(Map map) {
        return shooppingMapper.shooppingList(map);
    }

    public int deleteShopping(Integer id) {
        return shooppingMapper.deleteShopping(id);
    }
}
