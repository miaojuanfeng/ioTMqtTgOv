package com.krt.gov.strategy.service;

import com.krt.gov.strategy.entity.DeviceStrategyLink;
import com.krt.common.base.IBaseService;

import java.util.List;
import java.util.Map;


/**
 * 设备动作策略_关联设备服务接口层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
public interface IDeviceStrategyLinkService extends IBaseService<DeviceStrategyLink>{

    List<DeviceStrategyLink> selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);

    List<Map> selectDeviceById(Integer id);
}
