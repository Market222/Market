package cn.OrangeBank.service;

import cn.OrangeBank.entity.Client;

import java.util.List;
import java.util.Map;

public interface ClientService {
    List<Client> showClient(Map map);
    int countClient(Client client);
    int deleteClient(Client client);
    int updateClient(Client client);
    int addClient(Client client);
}
