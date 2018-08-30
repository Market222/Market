package cn.OrangeBank.service.impl;

import cn.OrangeBank.dao.PositionMapper;
import cn.OrangeBank.entity.Position;
import cn.OrangeBank.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {

    @Resource
    PositionMapper positionMapper;

    public List<Position> posList() {
        return positionMapper.posList();
    }
}
