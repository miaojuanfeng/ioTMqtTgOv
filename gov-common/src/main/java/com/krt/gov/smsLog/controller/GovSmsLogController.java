package com.krt.gov.smsLog.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.gov.smsLog.service.IGovSmsLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * 短信发送日志控制层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Controller
public class GovSmsLogController extends BaseController {

    @Autowired
    private IGovSmsLogService govSmsLogService;

    /**
     * 短信发送日志管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovSmsLog:govSmsLog:list")
    @GetMapping("gov/smsLog/govSmsLog/list")
    public String list() {
        return "smsLog/list";
    }

    /**
     * 短信发送日志管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("GovSmsLog:govSmsLog:list")
    @PostMapping("gov/smsLog/govSmsLog/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = govSmsLogService.selectPageList(para);
        return DataTable.ok(page);
    }

}
