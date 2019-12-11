package com.krt.gov.warning.service;

import com.krt.gov.warning.entity.GovDeviceWarningStaff;
import com.krt.common.base.IBaseService;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 预警规则_推送人员服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月11日
 */
public interface IGovDeviceWarningStaffService extends IBaseService<GovDeviceWarningStaff>{

    GovDeviceWarningStaff selectOneByWarnId(Integer warnId, Integer pushManId);

    void deleteByWarnId(Integer warnId, Integer pushManId);

    /**
     * 通过预警id查询所有推送人
     * @param warnId
     * @return
     */
    List<GovDeviceWarningStaff> selectByWarnId(Integer warnId);

    /**
     * 通过预警id删除所有推送人
     * @param warnId
     */
    void deleteByWarnId(Integer warnId);
}
