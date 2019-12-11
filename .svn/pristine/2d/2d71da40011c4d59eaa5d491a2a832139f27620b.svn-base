package com.krt.sys.service;

import com.krt.common.base.IBaseService;
import com.krt.sys.entity.Region;

import java.util.List;

/**
 * 区域服务接口层
 *
 * @version 1.0
 * @author：殷帅
 * @date：2016-07-26
 */
public interface IRegionService extends IBaseService<Region> {

    /**
     * 根据pid查询区域信息
     *
     * @param pid 区域pid
     * @return {@link List<Region>}
     */
    List<Region> selectByPid(Integer pid);

    /**
     * 根据区域code获取城市列表
     * @param code
     * @return
     */
    List<Region> getCity(String code);

    /**
     * 根据区域code获取区域列表
     * @param code
     * @return
     */
    List<Region> getRegion(String code);
}
