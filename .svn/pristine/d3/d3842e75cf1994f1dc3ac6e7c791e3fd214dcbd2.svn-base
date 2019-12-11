package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.gov.strategy.entity.DeviceStrategyLink;
import com.krt.gov.strategy.entity.DeviceStrategyRequire;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 设备动作策略_触发条件映射层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月12日
 */
@Mapper
public interface DeviceStrategyRequireMapper extends BaseMapper<DeviceStrategyRequire>{

    List<DeviceStrategyRequire> selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);

    List<Map> getSwitchStrategyActionByTH(@Param("deviceId") Long deviceId, @Param("temp") Integer temp, @Param("humi") Integer humi);

    List<Map> getAirConditionerStrategyActionByTH(@Param("deviceId") Long deviceId, @Param("temp") Integer temp, @Param("humi") Integer humi);

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
    List<Map> getSwitchStrategyActionBySwitch(@Param("deviceId") String deviceId,@Param("port1") Integer port1,@Param("port2") Integer port2,@Param("port3") Integer port3,@Param("port4") Integer port4,@Param("port5") Integer port5);

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
    List<Map> getAirConditionerStrategyActionBySwitch(@Param("deviceId") String deviceId,@Param("port1") Integer port1,@Param("port2") Integer port2,@Param("port3") Integer port3,@Param("port4") Integer port4,@Param("port5") Integer port5);


}
