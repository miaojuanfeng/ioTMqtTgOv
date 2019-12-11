package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.gov.strategy.entity.DeviceStrategyLink;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 设备动作策略_关联设备映射层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Mapper
public interface DeviceStrategyLinkMapper extends BaseMapper<DeviceStrategyLink>{

    List<DeviceStrategyLink> selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);

    List<Map> selectDeviceById(@Param("id") Integer id);

}
