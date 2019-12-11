package com.krt.gov.staff.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.staff.entity.GovStaff;
import com.krt.gov.staff.service.IGovStaffService;
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
 * 人员信息表控制层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年09月12日
 */
@Controller
public class GovStaffController extends BaseController {

    @Autowired
    private IGovStaffService govStaffService;

    /**
     * 人员信息表管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovStaff:govStaff:list")
    @GetMapping("gov/staff/govStaff/list")
    public String list() {
        return "gov/staff/govStaff/list";
    }

    /**
     * 人员信息表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("GovStaff:govStaff:list")
    @PostMapping("gov/staff/govStaff/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        IPage page = govStaffService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 新增人员信息表页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovStaff:govStaff:insert")
    @GetMapping("gov/staff/govStaff/insert")
    public String insert() {
        return "gov/staff/govStaff/insert";
    }

    /**
     * 添加人员信息表
     *
     * @param govStaff 人员信息表
     * @return {@link ReturnBean}
     */
    @KrtLog("添加人员信息表")
    @RequiresPermissions("GovStaff:govStaff:insert")
    @PostMapping("gov/staff/govStaff/insert")
    @ResponseBody
    public ReturnBean insert(GovStaff govStaff) {
        govStaffService.insert(govStaff);
        return ReturnBean.ok();
    }

    /**
     * 修改人员信息表页
     *
     * @param id 人员信息表id
     * @return {@link String}
     */
    @RequiresPermissions("GovStaff:govStaff:update")
    @GetMapping("gov/staff/govStaff/update")
    public String update(Integer id) {
        GovStaff govStaff = govStaffService.selectById(id);
        request.setAttribute("govStaff", govStaff);
        return "gov/staff/govStaff/update";
    }

    /**
     * 修改人员信息表
     *
     * @param govStaff 人员信息表
     * @return {@link ReturnBean}
     */
    @KrtLog("修改人员信息表")
    @RequiresPermissions("GovStaff:govStaff:update")
    @PostMapping("gov/staff/govStaff/update")
    @ResponseBody
    public ReturnBean update(GovStaff govStaff) {
        govStaffService.updateById(govStaff);
        return ReturnBean.ok();
    }

    /**
     * 删除人员信息表
     *
     * @param id 人员信息表id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除人员信息表")
    @RequiresPermissions("GovStaff:govStaff:delete")
    @PostMapping("gov/staff/govStaff/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        govStaffService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除人员信息表
     *
     * @param ids 人员信息表ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除人员信息表")
    @RequiresPermissions("GovStaff:govStaff:delete")
    @PostMapping("gov/staff/govStaff/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        govStaffService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }

    /**
     * 推送人表管理页
     *
     * @return {@link String}
     */
    @GetMapping("gov/staff/pushStaff/list")
    public String pushStaff() {
        return "gov/staff/govStaff/pushList";
    }

    /**
     * 人员信息表管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @PostMapping("gov/staff/pushStaff/list")
    @ResponseBody
    public DataTable pushStaff(@RequestParam Map para) {
        IPage page = govStaffService.selectPageList(para);
        return DataTable.ok(page);
    }
}
