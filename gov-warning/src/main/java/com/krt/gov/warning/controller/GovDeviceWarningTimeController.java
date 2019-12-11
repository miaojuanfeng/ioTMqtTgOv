package com.krt.gov.warning.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.warning.entity.GovDeviceWarningTime;
import com.krt.gov.warning.service.IGovDeviceWarningTimeService;
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
 * 设备预警时间设置控制层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月15日
 */
@Controller
public class GovDeviceWarningTimeController extends BaseController {

    @Autowired
    private IGovDeviceWarningTimeService govDeviceWarningTimeService;

    /**
     * 新增设备预警时间设置页
     * @return {@link String}
     */
    @GetMapping("gov/warning/govDeviceWarningTime/insert")
    public String insert() {
        return "gov/warning/govDeviceWarningTime/insert";
    }


}
