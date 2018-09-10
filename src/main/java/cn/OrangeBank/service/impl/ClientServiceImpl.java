package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.ClientMapper;
import cn.OrangeBank.entity.Client;
import cn.OrangeBank.service.ClientService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ClientServiceImpl implements ClientService {

    @Resource
    public ClientMapper clientMapper;

    public List<Client> showClient(Map map) {
        return clientMapper.showClient(map);
    }

    public int countClient(Client client) {
        return clientMapper.countClient(client);
    }

    public int deleteClient(Client client) {
        return clientMapper.deleteClient(client);
    }

    public int updateClient(Client client) {
        return clientMapper.updateClient(client);
    }

    public int addClient(Client client) {
        return clientMapper.addClient(client);
    }

}
