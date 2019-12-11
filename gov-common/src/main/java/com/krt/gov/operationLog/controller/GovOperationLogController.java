package com.krt.gov.operationLog.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.operationLog.entity.GovOperationLog;
import com.krt.gov.operationLog.service.IGovOperationLogService;
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
 * 用户操作日志控制层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月29日
 */
@Controller
public class GovOperationLogController extends BaseController {

    @Autowired
    private IGovOperationLogService govOperationLogService;

    /**
     * 用户操作日志管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovOperationLog:govOperationLog:list")
    @GetMapping("gov/operationLog/govOperationLog/list")
    public String list() {
        return "operationLog/list";
    }

    /**
     * 用户操作日志管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("GovOperationLog:govOperationLog:list")
    @PostMapping("gov/operationLog/govOperationLog/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = govOperationLogService.selectPageList(para);
        return DataTable.ok(page);
    }


}
