package com.krt.gov.device.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.device.entity.GovDeviceType;
import com.krt.gov.device.service.IGovDeviceTypeService;
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
 * 设备类型控制层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Controller
public class GovDeviceTypeController extends BaseController {

    @Autowired
    private IGovDeviceTypeService govDeviceTypeService;

    /**
     * 设备类型管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovDeviceType:govDeviceType:list")
    @GetMapping("gov/device/govDeviceType/list")
    public String list() {
        return "gov/device/govDeviceType/list";
    }

    /**
     * 设备类型管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("GovDeviceType:govDeviceType:list")
    @PostMapping("gov/device/govDeviceType/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = govDeviceTypeService.selectPageList(para);
        return DataTable.ok(page);
    }

//    /**
//     * 新增设备类型页
//     *
//     * @return {@link String}
//     */
//    @RequiresPermissions("GovDeviceType:govDeviceType:insert")
//    @GetMapping("gov/device/govDeviceType/insert")
//    public String insert() {
//        return "gov/device/govDeviceType/insert";
//    }
//
//    /**
//     * 添加设备类型
//     *
//     * @param govDeviceType 设备类型
//     * @return {@link ReturnBean}
//     */
//    @KrtLog("添加设备类型")
//    @RequiresPermissions("GovDeviceType:govDeviceType:insert")
//    @PostMapping("gov/device/govDeviceType/insert")
//    @ResponseBody
//    public ReturnBean insert(GovDeviceType govDeviceType) {
//        govDeviceTypeService.insert(govDeviceType);
//        return ReturnBean.ok();
//    }
}
