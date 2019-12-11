package com.krt.gov.thread.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.gov.thread.service.ITCallbackLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 回调列表日志控制层
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Controller
public class TCallbackLogController extends BaseController {

    @Resource
    private ITCallbackLogService tCallbackLogService;

    /**
     * 回调列表日志管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("TCallbackLog:tCallbackLog:list")
    @GetMapping("access/tCallbackLog/list")
    public String list() {
        return "callback/list";
    }

    /**
     * 回调列表日志管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("TCallbackLog:tCallbackLog:list")
    @PostMapping("access/tCallbackLog/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = tCallbackLogService.selectPageList(para);
        return DataTable.ok(page);
    }

}
