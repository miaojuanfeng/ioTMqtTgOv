package com.krt.gov.group.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.group.entity.GovGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 设备分组映射层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
@Mapper
public interface GovGroupMapper extends BaseMapper<GovGroup>{

    /**
     * 分组设备信息
     * @param area
     * @return
     */
    List<Map> selectDeviceGroups(@Param("area") String area,@Param("hallId")Integer hallId);
}
