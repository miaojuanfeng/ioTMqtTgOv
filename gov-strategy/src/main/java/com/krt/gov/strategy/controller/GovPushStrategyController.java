package com.krt.gov.strategy.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.session.SessionUser;
import com.krt.common.util.ShiroUtils;
import com.krt.gov.strategy.service.IDeviceStrategyService;
import com.krt.gov.strategy.service.IGovPushStrategyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 推送规则_相关策略控制层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Controller
public class GovPushStrategyController extends BaseController {

    @Autowired
    private IGovPushStrategyService govPushStrategyService;

    @Autowired
    private IDeviceStrategyService deviceStrategyService;

    /**
     * 策略管理页
     *
     * @return String {@link String}
     */
    @GetMapping("gov/strategy/govPushStrategy/list")
    public String list() {
        return "strategy/govPushStrategy/list";
    }

    /**
     * 关联策略页
     *
     * @return DataTable {@lin DataTable<DeviceStrategy>}
     */
    @PostMapping("gov/strategy/govPushStrategy/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        SessionUser sessionUser = ShiroUtils.getSessionUser();

        if (sessionUser.isAdmin()) {
            IPage page = deviceStrategyService.selectStrategyPage(para);
            return DataTable.ok(page);
        } else {
            para.put("area", sessionUser.getArea());
            IPage page = deviceStrategyService.selectStrategyPage(para);
            return DataTable.ok(page);
        }
    }

}
