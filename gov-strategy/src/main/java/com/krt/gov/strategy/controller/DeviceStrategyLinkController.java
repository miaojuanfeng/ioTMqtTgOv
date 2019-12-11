package com.krt.gov.strategy.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.strategy.entity.DeviceStrategyLink;
import com.krt.gov.strategy.service.IDeviceStrategyLinkService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Arrays;
import java.util.Map;

/**
 * 设备动作策略_关联设备控制层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Controller
public class DeviceStrategyLinkController extends BaseController {

    @Autowired
    private IDeviceStrategyLinkService deviceStrategyLinkService;

    /**
     * 设备动作策略_关联设备管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("strategy:deviceStrategyLink:list")
    @GetMapping("strategy/deviceStrategyLink/list")
    public String list() {
        return "strategy/deviceStrategyLink/list";
    }

    /**
     * 设备动作策略_关联设备管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("strategy:deviceStrategyLink:list")
    @PostMapping("strategy/deviceStrategyLink/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = deviceStrategyLinkService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增设备动作策略_关联设备页
     *
     * @return {@link String}
     */
    @RequiresPermissions("strategy:deviceStrategyLink:insert")
    @GetMapping("strategy/deviceStrategyLink/insert")
    public String insert() {
        return "strategy/deviceStrategyLink/insert";
    }

    /**
     * 添加设备动作策略_关联设备
     *
     * @param deviceStrategyLink 设备动作策略_关联设备
     * @return {@link ReturnBean}
     */
    @KrtLog("添加设备动作策略_关联设备")
    @RequiresPermissions("strategy:deviceStrategyLink:insert")
    @PostMapping("strategy/deviceStrategyLink/insert")
    @ResponseBody
    public ReturnBean insert(DeviceStrategyLink deviceStrategyLink) {
        deviceStrategyLinkService.insert(deviceStrategyLink);
        return ReturnBean.ok();
    }

    /**
     * 修改设备动作策略_关联设备页
     *
     * @param id 设备动作策略_关联设备id
     * @return {@link String}
     */
    @RequiresPermissions("strategy:deviceStrategyLink:update")
    @GetMapping("strategy/deviceStrategyLink/update")
    public String update(Integer id) {
        DeviceStrategyLink deviceStrategyLink = deviceStrategyLinkService.selectById(id);
        request.setAttribute("deviceStrategyLink", deviceStrategyLink);
        return "strategy/deviceStrategyLink/update";
    }

    /**
     * 修改设备动作策略_关联设备
     *
     * @param deviceStrategyLink 设备动作策略_关联设备
     * @return {@link ReturnBean}
     */
    @KrtLog("修改设备动作策略_关联设备")
    @RequiresPermissions("strategy:deviceStrategyLink:update")
    @PostMapping("strategy/deviceStrategyLink/update")
    @ResponseBody
    public ReturnBean update(DeviceStrategyLink deviceStrategyLink) {
        deviceStrategyLinkService.updateById(deviceStrategyLink);
        return ReturnBean.ok();
    }

    /**
     * 删除设备动作策略_关联设备
     *
     * @param id 设备动作策略_关联设备id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除设备动作策略_关联设备")
    @RequiresPermissions("strategy:deviceStrategyLink:delete")
    @PostMapping("strategy/deviceStrategyLink/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        deviceStrategyLinkService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除设备动作策略_关联设备
     *
     * @param ids 设备动作策略_关联设备ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除设备动作策略_关联设备")
    @RequiresPermissions("strategy:deviceStrategyLink:delete")
    @PostMapping("strategy/deviceStrategyLink/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        deviceStrategyLinkService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }


}
