package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.SupplierShoopMapper;
import cn.OrangeBank.entity.Suppliershoop;
import cn.OrangeBank.service.SuppliershoopService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SuppliershoopServiceImpl implements SuppliershoopService {

    @Resource
    SupplierShoopMapper supplierShoopMapper;



    public List<Suppliershoop> supList(Integer id, Integer shopid) {
        return supplierShoopMapper.supList(id,shopid);
    }
}
