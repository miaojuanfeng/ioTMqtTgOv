package com.krt.gov.warning.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.warning.entity.GovDeviceWarningTime;
import com.krt.gov.warning.mapper.GovDeviceWarningTimeMapper;
import com.krt.gov.warning.service.IGovDeviceWarningTimeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 设备预警时间设置服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月15日
 */
@Service
public class GovDeviceWarningTimeServiceImpl extends BaseServiceImpl<GovDeviceWarningTimeMapper, GovDeviceWarningTime> implements IGovDeviceWarningTimeService {

    @Resource
    private GovDeviceWarningTimeMapper warningTimeMapper;

    /**
     * 删除一条预警时间段
     * @param warnId
     * @param sTime
     * @param fTime
     */
    @Override
    public void deleteTimeByWarnId(String warnId, String sTime, String fTime){
        warningTimeMapper.deleteTimeByWarnId(warnId, sTime, fTime);
    }

    /**
     * 删除该预警的所有预警时间
     * @param warnId
     */
    @Override
    public void deleteByWarnId(Integer warnId) {
        warningTimeMapper.deleteByWarnId(warnId);
    }

    /**
     * 根据预警id查预警时间
     * @param warnId
     * @return
     */
    @Override
    public List<GovDeviceWarningTime> selectTimeByWarnId(Integer warnId) {
        return warningTimeMapper.selectTimeByWarnId(warnId);
    }

}
