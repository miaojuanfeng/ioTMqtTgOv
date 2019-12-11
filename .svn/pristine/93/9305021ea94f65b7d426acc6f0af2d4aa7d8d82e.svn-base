package com.krt.gov.strategy.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.krt.common.base.BaseServiceImpl;
import com.krt.common.bean.PageHelper;
import com.krt.common.bean.Query;
import com.krt.gov.strategy.entity.DeviceStrategy;
import com.krt.gov.strategy.mapper.DeviceStrategyMapper;
import com.krt.gov.strategy.service.IDeviceStrategyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * 设备动作策略服务接口实现层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Service
public class DeviceStrategyServiceImpl extends BaseServiceImpl<DeviceStrategyMapper, DeviceStrategy> implements IDeviceStrategyService {

    @Autowired
    private DeviceStrategyMapper deviceStrategyMapper;

    @Override
    public List<Map> selectManualStrategy(String area) {
        return deviceStrategyMapper.selectManualStrategy(area);
    }

    @Override
    public List<Map> selectManualDevice(Integer strategyId) {
        return deviceStrategyMapper.selectManualDevice(strategyId);
    }

    @Override
    public IPage selectStrategyPage(Map para) {
        Query query = new Query(para);
        Page page = query.getPage();
        PageHelper.startPage(page);
        List list = deviceStrategyMapper.selectStrategyPage(para);
        page.setRecords(list);
        return page;
    }
}
