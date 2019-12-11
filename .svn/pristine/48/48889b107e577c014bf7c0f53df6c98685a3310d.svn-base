package com.krt.gov.device.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.device.entity.GovDeviceType;

import java.util.List;
import java.util.Map;

/**
 * 设备类型映射层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Mapper
public interface GovDeviceTypeMapper extends BaseMapper<GovDeviceType> {

    List<GovDeviceType> selectAllDeviceTypes();

    /**
     * 设备管理接口查询设备类别
     * @param area
     * @return
     */
    List<Map> selectDeviceTypes(String area);

}
