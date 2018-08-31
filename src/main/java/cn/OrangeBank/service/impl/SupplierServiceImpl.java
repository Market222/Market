package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.SupplierMapper;
import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.service.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    private SupplierMapper supplierMapper;

    public int count(Supplier supplier) {
        return supplierMapper.count(supplier);
    }

    public List<Supplier> queryList(Map map) {
        return supplierMapper.queryList(map);
    }

    public boolean addSupp(Supplier supplier) {
        return supplierMapper.addSupp(supplier)>0;
    }

    public List<Supplier> queryList2(Supplier supplier) {
        return supplierMapper.queryList2(supplier);
    }

    public boolean updateSupp(Supplier supplier) {
        return supplierMapper.updateSupp(supplier)>0;
    }

    public int deleteById(Integer delId) {
        return supplierMapper.deleteById(delId);
    }
}
