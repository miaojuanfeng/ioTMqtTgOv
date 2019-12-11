package com.krt.gov.warning.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.warning.entity.GovDeviceWarningStaff;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 预警规则_推送人员映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月11日
 */
@Mapper
public interface GovDeviceWarningStaffMapper extends BaseMapper<GovDeviceWarningStaff>{

    /**
     * 根据warnId 和 pushManId 查询预警推送人员
     * @param pushManId
     * @param warnId
     * @return
     */
    GovDeviceWarningStaff selectOneByWarnId(@Param("warnId") Integer warnId, @Param("pushManId") Integer pushManId);

    /**
     * 根据warnId 和 pushManId 删除预警推送人员
     * @param warnId
     * @param pushManId
     */
    void deleteByWarnId(@Param("warnId") Integer warnId, @Param("pushManId") Integer pushManId);

    /**
     * 根据预警id查设备关联推送人
     * @param warnId
     * @return
     */
    List<GovDeviceWarningStaff> selectByWarnId(@Param("warnId") Integer warnId);

    /**
     * 根据预警id删除所有的推送人
     * @param warnId
     */
    void deleteByWarningId(@Param("warnId")Integer warnId);

}
