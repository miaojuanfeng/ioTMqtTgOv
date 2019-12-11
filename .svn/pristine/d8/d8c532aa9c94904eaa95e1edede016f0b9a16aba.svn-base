package com.krt.gov.warning.service.impl;

import com.krt.gov.warning.mapper.GovDeviceWarningMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.gov.warning.entity.GovDeviceWarningStaff;
import com.krt.gov.warning.mapper.GovDeviceWarningStaffMapper;
import com.krt.gov.warning.service.IGovDeviceWarningStaffService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.List;


/**
 * 预警规则_推送人员服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月11日
 */
@Service
public class GovDeviceWarningStaffServiceImpl extends BaseServiceImpl<GovDeviceWarningStaffMapper, GovDeviceWarningStaff> implements IGovDeviceWarningStaffService {

    @Resource
    private GovDeviceWarningStaffMapper govDevWarnMapper;

    /**
     * 根据warnId 和 pushManId 查询预警推送人员
     * @param warnId
     * @param pushManId
     * @return
     */
    @Override
    public GovDeviceWarningStaff selectOneByWarnId(Integer warnId, Integer pushManId) {
        return govDevWarnMapper.selectOneByWarnId(warnId, pushManId);
    }

    /**
     * 根据warnId 和 pushManId 删除预警推送人员
     * @param warnId
     * @param pushManId
     */
    @Override
    public void deleteByWarnId(Integer warnId, Integer pushManId){
        govDevWarnMapper.deleteByWarnId(warnId, pushManId);
    }

    /**
     * 通过预警id查所有推送人
     * @param warnId
     * @return
     */
    @Override
    public List<GovDeviceWarningStaff> selectByWarnId(Integer warnId) {
        return govDevWarnMapper.selectByWarnId(warnId);
    }

    /**
     * 根据预警id删除所有关联推送人
     * @param warnId
     */
    @Override
    public void deleteByWarnId(Integer warnId) {
        govDevWarnMapper.deleteByWarningId(warnId);
    }

}
