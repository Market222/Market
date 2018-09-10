package cn.OrangeBank.dao;

import cn.OrangeBank.entity.Client;

import java.util.List;
import java.util.Map;

public interface ClientMapper {
    List<Client> showClient(Map map);


    int countClient(Client client);

    int deleteClient(Client client);

    int updateClient(Client client);

    int addClient(Client client);
}
