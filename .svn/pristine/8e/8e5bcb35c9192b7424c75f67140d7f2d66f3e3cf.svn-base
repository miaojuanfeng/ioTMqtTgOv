package com.krt.gov.hall.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import com.krt.gov.hall.entity.GovHall;
import com.krt.gov.hall.mapper.GovHallMapper;
import com.krt.gov.hall.service.IGovHallService;
import com.krt.common.base.BaseServiceImpl;

import java.util.*;


/**
 * 大厅服务接口实现层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月11日
 */
@Service
public class GovHallServiceImpl extends BaseServiceImpl<GovHallMapper, GovHall> implements IGovHallService {

    @Override
    public List<Map> getFloorInfo(String type) {
        return baseMapper.getFloorInfo(type);
    }

    @Override
    public List<GovHall> selectByArea(String area) {
        return baseMapper.selectByArea(area);
    }

    @Override
    public Map getHall(String area) {
        List<Map> floorList = baseMapper.getFloorInfo("gov_device_floor_num");
        LinkedHashMap linkedHashMap = new LinkedHashMap(12);
        for (Map map :
                floorList) {
            List<Map> hallList = baseMapper.getHall(area, map.get("code") + "");
            if (hallList.size()>0) {
                JSONArray hallArray = JSONArray.parseArray(JSON.toJSONString(hallList));
                linkedHashMap.put(map.get("name")+"",hallArray);
            }
        }

        return linkedHashMap;
    }
}
