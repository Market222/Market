package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ReturnsMapper;
import cn.OrangeBank.dao.ReturnsshoopMapper;
import cn.OrangeBank.entity.Returnsshoop;
import cn.OrangeBank.service.ReturnsshoopService;
import org.hibernate.validator.constraints.pl.REGON;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ReturnsshoopServiceImpl implements ReturnsshoopService {

    @Resource
    ReturnsshoopMapper returnsshoopMapper;


    public int addReShop(Returnsshoop reShop) {
        return returnsshoopMapper.addReShop(reShop);
    }

    public int delReShop(String id) {
        return returnsshoopMapper.delReShop(id);
    }
}
