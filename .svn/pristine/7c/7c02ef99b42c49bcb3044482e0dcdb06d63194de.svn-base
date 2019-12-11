package com.krt.gov.strategy.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.strategy.entity.DeviceStrategyRequire;
import com.krt.gov.strategy.mapper.DeviceStrategyRequireMapper;
import com.krt.gov.strategy.service.IDeviceStrategyRequireService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 设备动作策略_触发条件服务接口实现层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月12日
 */
@Service
public class DeviceStrategyRequireServiceImpl extends BaseServiceImpl<DeviceStrategyRequireMapper, DeviceStrategyRequire> implements IDeviceStrategyRequireService {

    @Resource
    private DeviceStrategyRequireMapper deviceStrategyRequireMapper;

    @Override
    public List<DeviceStrategyRequire> selectByStrategyId(Integer strategyId) {
        return deviceStrategyRequireMapper.selectByStrategyId(strategyId);
    }

    @Override
    public void deleteByStrategyId(Integer strategyId) {
        deviceStrategyRequireMapper.deleteByStrategyId(strategyId);
    }

    /**
     * 根据温湿度查空调执行操作
     *
     * @param temp 温度
     * @param humi 湿度
     * @return
     */
    @Override
    public List<Map> getAirConditionerStrategyActionByTH(Long deviceId, Integer temp, Integer humi) {
        return deviceStrategyRequireMapper.getAirConditionerStrategyActionByTH(deviceId, temp, humi);
    }

    /**
     * 根据温湿度查开关执行操作
     *
     * @param temp 温度
     * @param humi 湿度
     * @return
     */
    @Override
    public List<Map> getSwitchStrategyActionByTH(Long deviceId, Integer temp, Integer humi) {
        return deviceStrategyRequireMapper.getSwitchStrategyActionByTH(deviceId, temp, humi);
    }

    /**
     * 开关查开关执行操作
     *
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     * @return
     */
    @Override
    public List<Map> getSwitchStrategyActionBySwitch(String deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5) {
        return deviceStrategyRequireMapper.getSwitchStrategyActionBySwitch(deviceId, port1, port2, port3, port4, port5);
    }

    /**
     * 开关查空调执行操作
     *
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     * @return
     */
    @Override
    public List<Map> getAirConditionerStrategyActionBySwitch(String deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5) {
        return deviceStrategyRequireMapper.getAirConditionerStrategyActionBySwitch(deviceId, port1, port2, port3, port4, port5);
    }
}
