package com.krt.gov.warning.service;

import com.krt.gov.warning.entity.GovDeviceWarningTime;
import com.krt.common.base.IBaseService;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 设备预警时间设置服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月15日
 */
public interface IGovDeviceWarningTimeService extends IBaseService<GovDeviceWarningTime>{

    /**
     * 删除一条预警时间段
     * @param warnId
     * @param sTime
     * @param fTime
     */
    void deleteTimeByWarnId(String warnId, String sTime, String fTime);

    /**
     * 删除该预警的所有预警时间
     * @param warnId
     */
    void deleteByWarnId(Integer warnId);

    /**
     * 根据预警id查预警花时间
     * @param warnId
     * @return
     */
    List<GovDeviceWarningTime> selectTimeByWarnId(Integer warnId);

}
