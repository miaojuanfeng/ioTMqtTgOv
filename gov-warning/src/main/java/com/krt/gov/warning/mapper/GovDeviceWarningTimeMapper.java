package com.krt.gov.warning.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.warning.entity.GovDeviceWarningTime;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 设备预警时间设置映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月15日
 */
@Mapper
public interface GovDeviceWarningTimeMapper extends BaseMapper<GovDeviceWarningTime>{

    /**
     * 删除一条预警时间段
     * @param warnId
     * @param sTime
     * @param fTime
     */
    void deleteTimeByWarnId(@Param("warnId") String warnId, @Param("sTime") String sTime, @Param("fTime") String fTime);

    /**
     * 删除该预警的所有预警时间
     */
    void deleteByWarnId(@Param("warnId") Integer warnId);

    /**
     * 根据预警id查预警时间
     * @param warnId
     * @return
     */
    List<GovDeviceWarningTime> selectTimeByWarnId(@Param("warnId") Integer warnId);
}
