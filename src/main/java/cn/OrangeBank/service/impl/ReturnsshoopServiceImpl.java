package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ReturnsMapper;
import cn.OrangeBank.dao.ReturnsshoopMapper;
import cn.OrangeBank.entity.Returnsshoop;
import cn.OrangeBank.service.ReturnsshoopService;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReturnsshoopServiceImpl implements ReturnsshoopService {

    @Resource
    ReturnsshoopMapper returnsshoopMapper;


    public List<Returnsshoop> reList(Returnsshoop re) {
        return returnsshoopMapper.reList(re);
    }

    public int addReShop(Returnsshoop reShop) {
        return returnsshoopMapper.addReShop(reShop);
    }

    public int delReShop(String id) {
        return returnsshoopMapper.delReShop(id);
    }

    public int updateShop(Returnsshoop reShop) {
        return returnsshoopMapper.updateShop(reShop);
    }
}
