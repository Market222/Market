package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.SupplierMapper;
import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.service.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    private SupplierMapper supplierMapper;

    public List<Supplier> suplist() {
        return supplierMapper.suplist();
    }
}
