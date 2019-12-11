package com.krt.gov.strategy.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.strategy.entity.DeviceStrategyTime;
import com.krt.gov.strategy.mapper.DeviceStrategyTimeMapper;
import com.krt.gov.strategy.service.IDeviceStrategyTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 设备动作策略_时间服务接口实现层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年09月03日
 */
@Service
public class DeviceStrategyTimeServiceImpl extends BaseServiceImpl<DeviceStrategyTimeMapper, DeviceStrategyTime> implements IDeviceStrategyTimeService {

    @Resource
    private DeviceStrategyTimeMapper deviceStrategyTimeMapper;

    @Override
    public List selectByStrategyId(Integer strategyId) {
        return deviceStrategyTimeMapper.selectByStrategyId(strategyId);
    }

    @Override
    public void deleteByStrategyId(Integer strategyId) {
        deviceStrategyTimeMapper.deleteByStrategyId(strategyId);
    }
}
