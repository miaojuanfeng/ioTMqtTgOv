package com.krt.gov.warning.service;

import com.krt.gov.warning.entity.GovDeviceWarningLink;
import com.krt.common.base.IBaseService;

import java.util.List;

/**
 * 设备预警规则关联的设备服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
public interface IGovDeviceWarningLinkService extends IBaseService<GovDeviceWarningLink>{

    /**
     * 根据 warnId 和 deviceId 删除 关联的设备
     * @param warnId
     * @param deviceId
     */
    void deleteByWarnId(Integer warnId, Integer deviceId);

    /**
     * 根据warnId查询预警所有的设备
     * @param warnId
     * @return
     */
    List<GovDeviceWarningLink> selectByWarnId(Integer warnId);

    /**
     * 根据warnId删除预警所有的设备
     * @param warnId
     */
    void deleteByWarnId(Integer warnId);
}
