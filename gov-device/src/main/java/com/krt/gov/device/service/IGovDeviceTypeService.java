package com.krt.gov.device.service;

import com.alibaba.fastjson.JSONObject;
import com.krt.common.base.IBaseService;
import com.krt.gov.device.entity.GovDeviceType;

import java.util.List;


/**
 * 设备类型服务接口层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
public interface IGovDeviceTypeService extends IBaseService<GovDeviceType>{

    /**
     * 获取设备类型
     * @return
     */
    List<GovDeviceType> selectAllDeviceTypes();

    /**
     * 设备管理接口查询设备类别
     * @param area
     */
    List<JSONObject> selectDeviceTypes(String area);

    /**
     * 大厅查设备类型
     * @param area
     */
    List<JSONObject> selectDeviceTypesHallData(String area);
}
