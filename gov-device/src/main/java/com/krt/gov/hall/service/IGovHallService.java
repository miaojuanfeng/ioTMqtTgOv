package com.krt.gov.hall.service;

import com.alibaba.fastjson.JSONArray;
import com.krt.gov.hall.entity.GovHall;
import com.krt.common.base.IBaseService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 大厅服务接口层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月11日
 */
public interface IGovHallService extends IBaseService<GovHall>{

    /**
     * 查询数据字典中的楼层信息
     * @param type
     * @return
     */
    List<Map> getFloorInfo(String type);

    /**
     * 根据地域查大厅
     * @param area
     * @return
     */
    List<GovHall> selectByArea(String area);

    /**
     * 首页接口获取楼层大厅
     * @param area
     */
    Map getHall(String area);
}
