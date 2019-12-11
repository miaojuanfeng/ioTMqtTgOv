package com.krt.gov.strategy.service.impl;

import com.krt.gov.strategy.entity.DeviceStrategyLink;
import com.krt.gov.strategy.mapper.DeviceStrategyLinkMapper;
import com.krt.gov.strategy.service.IDeviceStrategyLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 设备动作策略_关联设备服务接口实现层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Service
public class DeviceStrategyLinkServiceImpl extends BaseServiceImpl<DeviceStrategyLinkMapper, DeviceStrategyLink> implements IDeviceStrategyLinkService {

    @Resource
    private DeviceStrategyLinkMapper deviceStrategyLinkMapper;

    @Override
    public List<DeviceStrategyLink> selectByStrategyId(Integer strategyId) {
        return deviceStrategyLinkMapper.selectByStrategyId(strategyId);
    }

    @Override
    public void deleteByStrategyId(Integer strategyId) {
        deviceStrategyLinkMapper.deleteByStrategyId(strategyId);
    }

    /**
     * 根据策略id 查询设备id
     * @param id
     * @return
     */
    @Override
    public List<Map> selectDeviceById(Integer id) {
        return deviceStrategyLinkMapper.selectDeviceById(id);
    }
}
