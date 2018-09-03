package cn.OrangeBank.service;

import cn.OrangeBank.entity.Supplier;
import cn.OrangeBank.entity.Suppliershoop;

import java.util.List;

public interface SuppliershoopService {
        List<Suppliershoop> supList(Integer id, Integer shopid);
        List<Suppliershoop> supShopList(Suppliershoop sup);
}
