package com.krt.gov.strategy.service;

import com.krt.common.base.IBaseService;
import com.krt.gov.strategy.entity.DeviceStrategyTime;

import java.util.List;

/**
 * 设备动作策略服务_策略时间接口层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年09月03日
 */
public interface IDeviceStrategyTimeService extends IBaseService<DeviceStrategyTime> {

    List selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);
}

