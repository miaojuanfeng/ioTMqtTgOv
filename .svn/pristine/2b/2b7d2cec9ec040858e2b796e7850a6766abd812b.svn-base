package com.krt.gov.warning.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.warning.entity.GovDeviceWarningLink;
import com.krt.gov.warning.mapper.GovDeviceWarningLinkMapper;
import com.krt.gov.warning.service.IGovDeviceWarningLinkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * 设备预警规则关联的设备服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Service
public class GovDeviceWarningLinkServiceImpl extends BaseServiceImpl<GovDeviceWarningLinkMapper, GovDeviceWarningLink> implements IGovDeviceWarningLinkService {

    @Resource
    GovDeviceWarningLinkMapper warningLinkMapper;
    /**
     * 根据 warnId 和 deviceId 删除 关联的设备
     * @param warnId
     * @param deviceId
     */
    @Override
    public void deleteByWarnId(Integer warnId, Integer deviceId){
        warningLinkMapper.deleteByWarnId(warnId, deviceId);
    }

    /**
     * 根据warnId查询预警关联的所有设备
     * @param warnId
     * @return
     */
    @Override
    public List<GovDeviceWarningLink> selectByWarnId(Integer warnId) {
        return warningLinkMapper.selectByWarnId(warnId);
    }

    /**
     * 根据预警id删除所有关联设备
     * @param warnId
     */
    @Override
    public void deleteByWarnId(Integer warnId) {
        warningLinkMapper.deleteByWarningId(warnId);
    }

}
