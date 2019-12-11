package com.krt.gov.strategy.service;

import com.krt.common.base.IBaseService;
import com.krt.gov.strategy.entity.DeviceStrategyRequire;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 设备动作策略_触发条件服务接口层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月12日
 */
public interface IDeviceStrategyRequireService extends IBaseService<DeviceStrategyRequire>{

    List<DeviceStrategyRequire> selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);

    List<Map> getAirConditionerStrategyActionByTH(Long deviceId, Integer temp, Integer humi);

    List<Map> getSwitchStrategyActionByTH(Long deviceId, Integer temp, Integer humi);

    /**
     * 开关查开关执行操作
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     * @return
     */
    List<Map> getSwitchStrategyActionBySwitch(String deviceId,Integer port1,Integer port2,Integer port3,Integer port4,Integer port5);

    /**
     * 开关查空调执行操作
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     * @return
     */
    List<Map> getAirConditionerStrategyActionBySwitch(String deviceId,Integer port1,Integer port2,Integer port3,Integer port4,Integer port5);
}
