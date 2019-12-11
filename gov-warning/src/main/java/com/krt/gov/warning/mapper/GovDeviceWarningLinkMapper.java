package com.krt.gov.warning.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.warning.entity.GovDeviceWarningLink;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 设备预警规则关联的设备映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Mapper
public interface GovDeviceWarningLinkMapper extends BaseMapper<GovDeviceWarningLink>{

    /**
     * 根据 warnId 和 deviceId 删除 关联的设备
     * @param warnId
     * @param deviceId
     */
    void deleteByWarnId(@Param("warnId") Integer warnId, @Param("deviceId") Integer deviceId);

    /**
     * 根据预警id查预警关联的所有设备
     * @param warnId
     * @return
     */
    List<GovDeviceWarningLink> selectByWarnId(@Param("warnId")Integer warnId);

    /**
     * 根据预警id删除所有关联的设备
     * @param warnId
     */
    void deleteByWarningId(@Param("warnId")Integer warnId);
}
