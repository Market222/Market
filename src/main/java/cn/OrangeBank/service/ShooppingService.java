package cn.OrangeBank.service;

import cn.OrangeBank.entity.Shoopping;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ShooppingService {
    //查询
    List<Shoopping> queryShoopping(Shoopping shoopping);

    List<Shoopping> shopList(Shoopping shop);
    int addShop(Shoopping shoopping);
    int updateShop(Shoopping shoopping);
    List<Shoopping> TotalRows(Shoopping shop);
    List<Shoopping> shooppingList(Map map);
    //删除
    int deleteShopping(@Param("id") Integer id);

}
