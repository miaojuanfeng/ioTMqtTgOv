package com.krt.gov.device.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.common.session.SessionUser;
import com.krt.common.util.ShiroUtils;
import com.krt.gov.device.entity.GovDevice;
import com.krt.gov.device.entity.GovDeviceType;
import com.krt.gov.device.service.IGovDeviceService;
import com.krt.gov.device.service.IGovDeviceTypeService;
import com.krt.gov.group.entity.GovGroup;
import com.krt.gov.group.service.IGovGroupService;
import com.krt.gov.hall.entity.GovHall;
import com.krt.gov.hall.service.IGovHallService;
import com.krt.gov.ir.service.IBrandService;
import com.krt.sys.entity.Region;
import com.krt.sys.service.IRegionService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.krt.gov.device.constant.DeviceConstant.TYPE_AIRCONDITIONING;
import static com.krt.gov.device.constant.DeviceConstant.TYPE_SWITCH;

/**
 * 设备控制层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Controller
public class GovDeviceController extends BaseController {

    @Autowired
    private IGovDeviceService govDeviceService;

    @Autowired
    private IGovDeviceTypeService govDeviceTypeService;

    @Autowired
    private IRegionService regionService;

    @Autowired
    private IBrandService brandService;

    @Autowired
    private IGovHallService govHallService;

    @Autowired
    private IGovGroupService govGroupService;

    /**
     * 设备管理页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovDevice:govDevice:list")
    @GetMapping("gov/device/govDevice/list")
    public String list() {
        List<GovDeviceType> govDeviceTypes = govDeviceTypeService.selectAllDeviceTypes();
        String jsonStr = JSON.toJSONString(govDeviceTypes);
        request.setAttribute("govDeviceTypes", jsonStr);
        return "gov/device/govDevice/list";
    }

    /**
     * 设备管理
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @RequiresPermissions("GovDevice:govDevice:list")
    @PostMapping("gov/device/govDevice/list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        SessionUser sessionUser = getSessionUser();

        if (sessionUser.isAdmin()) {
            IPage page = govDeviceService.selectPageList(para);
            return DataTable.ok(page);
        } else {
            para.put("area", sessionUser.getArea());
            IPage page = govDeviceService.selectPageList(para);
            return DataTable.ok(page);
        }
    }

    /**
     * 设备类型选择页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovDevice:govDevice:insert")
    @GetMapping("gov/device/govDevice/chooseType")
    public String chooseType() {
        List<GovDeviceType> govDeviceTypes = govDeviceTypeService.selectAllDeviceTypes();
        request.setAttribute("govDeviceTypes", govDeviceTypes);
        return "gov/device/govDevice/chooseType";
    }

    /**
     * 新增设备页
     *
     * @return {@link String}
     */
    @RequiresPermissions("GovDevice:govDevice:insert")
    @GetMapping("gov/device/govDevice/insert")
    public String insert(GovDeviceType govDeviceType) {
        SessionUser sessionUser = getSessionUser();
        if (sessionUser.isAdmin()) {
            //获取地区大厅
            List<Region> provinces = regionService.selectByPid(0);
            request.setAttribute("provinces", provinces);
            List<Region> cities = regionService.selectByPid(10014);
            request.setAttribute("cities", cities);
            List<Region> regions = regionService.selectByPid(1425);
            request.setAttribute("regions", regions);
            List<GovHall> govHallList = govHallService.selectByArea("360702");
            request.setAttribute("govHallList", govHallList);
        } else {
            request.setAttribute("area", sessionUser.getArea());
            List<GovHall> govHallList = govHallService.selectByArea(sessionUser.getArea());
            request.setAttribute("govHallList", govHallList);
        }

        //获取设备分组
        List<GovGroup> groupList = govGroupService.selectList();
        request.setAttribute("groupList", groupList);

        request.setAttribute("govDeviceType", govDeviceType);
        switch (govDeviceType.getId()) {
            case 1:
                return "gov/device/govDevice/switch/insert";
            case 2:
                return "gov/device/govDevice/airConditioner/insert";
            default:
                return "gov/device/govDevice/switch/insert";
        }
    }

    private SessionUser getSessionUser() {
        return ShiroUtils.getSessionUser();
    }

    /**
     * 添加设备
     *
     * @param govDevice 设备
     * @return {@link ReturnBean}
     */
    @KrtLog("添加设备")
    @RequiresPermissions("GovDevice:govDevice:insert")
    @PostMapping("gov/device/govDevice/insert")
    @ResponseBody
    public ReturnBean insert(GovDevice govDevice) {
        if (govDeviceService.deviceCheck(govDevice)) {
            if (TYPE_SWITCH.equals(govDevice.getType())) {
                if ("1".equals(govDevice.getPort()) || "2".equals(govDevice.getPort()) || "3".equals(govDevice.getPort()) || "4".equals(govDevice.getPort()) ||
                        "5".equals(govDevice.getPort())) {
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("onOff", 0);
                    jsonObject.put("time", govDevice.getTime());
                    govDevice.setAction(jsonObject.toJSONString());
                }
            } else if (TYPE_AIRCONDITIONING.equals(govDevice.getType())) {
                govDevice.setAction("{\"mode\":\"0\",\"temp\":\"24\",\"windSpeed\":\"0\",\"onOff\":\"1\"}");
            }
            govDevice.setInfo(StringEscapeUtils.unescapeHtml4(govDevice.getInfo()));
            govDevice.setActionTime(new Date());
            govDeviceService.insert(govDevice);
            return ReturnBean.ok();
        } else {
            return ReturnBean.error("设备已存在");
        }
    }

    /**
     * 修改设备页
     *
     * @param id 设备id
     * @return {@link String}
     */
    @RequiresPermissions("GovDevice:govDevice:update")
    @GetMapping("gov/device/govDevice/update")
    public String update(Integer id) {
        GovDevice govDevice = govDeviceService.selectById(id);
        //获取time
        String action = govDevice.getAction();
        if (action != null && !"".equals(action)) {
            JSONObject jsonObject = JSONObject.parseObject(action);
            govDevice.setTime(jsonObject.getString("time"));
        }
        request.setAttribute("govDevice", govDevice);

        //获取设备分组
        List<GovGroup> groupList = govGroupService.selectList();
        request.setAttribute("groupList", groupList);

        SessionUser sessionUser = getSessionUser();
        if (sessionUser.isAdmin()) {
            //获取区域
            List<Region> provinces = regionService.selectByPid(0);
            request.setAttribute("provinces", provinces);
            List<Region> cities = regionService.getCity(govDevice.getArea());
            request.setAttribute("cities", cities);
            List<Region> regions = regionService.getRegion(govDevice.getArea());
            request.setAttribute("regions", regions);
            //获取大厅
            List<GovHall> govHallList = govHallService.selectByArea(govDevice.getArea());
            request.setAttribute("govHallList", govHallList);
        } else {
            request.setAttribute("area", sessionUser.getArea());
            List<GovHall> govHallList = govHallService.selectByArea(sessionUser.getArea());
            request.setAttribute("govHallList", govHallList);
        }

        Integer type = govDevice.getType();
        switch (type) {
            case 1:
                return "gov/device/govDevice/switch/update";
            case 2:
                return "gov/device/govDevice/airConditioner/update";
            default:
                return "gov/device/govDevice/switch/update";
        }
    }

    /**
     * 修改设备
     *
     * @param govDevice 设备
     * @return {@link ReturnBean}
     */
    @KrtLog("修改设备")
    @RequiresPermissions("GovDevice:govDevice:update")
    @PostMapping("gov/device/govDevice/update")
    @ResponseBody
    public ReturnBean update(GovDevice govDevice) {
        if (govDeviceService.deviceCheck(govDevice)) {
            govDevice.setInfo(StringEscapeUtils.unescapeHtml4(govDevice.getInfo()));

            //修改action时间
            if ("1".equals(govDevice.getPort()) || "2".equals(govDevice.getPort()) || "3".equals(govDevice.getPort()) || "4".equals(govDevice.getPort()) ||
                    "5".equals(govDevice.getPort())) {
                String action = StringEscapeUtils.unescapeHtml4(govDevice.getAction());
                JSONObject jsonObject = JSONObject.parseObject(action);
                jsonObject.put("time", govDevice.getTime());
                govDevice.setAction(jsonObject.toJSONString());
            }

            govDeviceService.updateById(govDevice);
            return ReturnBean.ok();
        } else {
            return ReturnBean.error("设备已存在");
        }
    }

    /**
     * 设备设置页
     *
     * @param id 设备id
     * @return {@link String}
     */
    @RequiresPermissions("GovDevice:govDevice:setting")
    @GetMapping("gov/device/govDevice/setting")
    public String setting(Integer id) {
        GovDevice govDevice = govDeviceService.selectById(id);
        request.setAttribute("govDevice", govDevice);
        return "gov/device/govDevice/switch/printerSetting";
    }

    /**
     * 设备的区域位置信息
     *
     * @param id 设备id
     */
    @RequiresPermissions("GovDevice:govDevice:update")
    @GetMapping("gov/device/govDevice/position")
    public String position(Integer id) {
        Map position = govDeviceService.selectDevPosition(id);
        request.setAttribute("position", position);
        request.setAttribute("id", id);

        return "gov/device/govDevice/position";
    }

    /**
     * 设备的区域位置信息
     *
     * @param x x
     * @param y y
     */
    @RequiresPermissions("GovDevice:govDevice:update")
    @PostMapping("gov/device/govDevice/position")
    @ResponseBody
    public ReturnBean position(Integer x, Integer y, Integer id) {
        govDeviceService.updateDevPosition(x, y, id);
        return ReturnBean.ok();
    }

    /**
     * 删除设备
     *
     * @param id 设备id
     * @return {@link ReturnBean}
     */
    @KrtLog("删除设备")
    @RequiresPermissions("GovDevice:govDevice:delete")
    @PostMapping("gov/device/govDevice/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        govDeviceService.deleteById(id);
        return ReturnBean.ok();
    }

    /**
     * 批量删除设备
     *
     * @param ids 设备ids
     * @return {@link ReturnBean}
     */
    @KrtLog("批量删除设备")
    @RequiresPermissions("GovDevice:govDevice:delete")
    @PostMapping("gov/device/govDevice/deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        govDeviceService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }

    /**
     * 获取区域信息
     *
     * @param pid
     * @return
     */
    @PostMapping("gov/device/govDevice/getRegions")
    @ResponseBody
    public ReturnBean getRegions(Integer pid) {
        if (pid != null) {
            List<Region> regions = regionService.selectByPid(pid);
            return ReturnBean.ok(regions);
        }
        return ReturnBean.ok();
    }

    /**
     * 添加设备类型对应品牌
     *
     * @return
     */
    @KrtLog("添加设备类型对应品牌")
    @GetMapping("device/device/insertBrand")
    public String insertBrand() {
        return "gov/device/govDevice/airConditioner/brand";
    }

    /**
     * 品牌表
     */
    @PostMapping("device/device/insertBrand")
    @ResponseBody
    public DataTable insertBrand(@RequestParam Map para) {
        para.put("categoryid", 1);
        IPage page = brandService.selectPageList(para);
        return DataTable.ok(page);
    }

    /**
     * 添加设备码库
     *
     * @return
     */
    @KrtLog("添加设备码库")
    @GetMapping("device/device/insertCodeBank")
    public String insertCodeBand(String brandName) {
        request.setAttribute("brandName", brandName);
        return "gov/device/govDevice/airConditioner/codeBank";
    }

    /**
     * 码库表
     */
    @PostMapping("device/device/insertCodeBank")
    @ResponseBody
    public DataTable insertCodeBand(@RequestParam Map para) {
        IPage page = govDeviceService.selectCodeBank(para);
        return DataTable.ok(page);
    }

    /**
     * 设备列表页
     *
     * @return
     */
    @GetMapping("gov/device/govDevice/deviceSelect")
    public String deviceList() {
        List<GovDeviceType> govDeviceTypes = govDeviceTypeService.selectAllDeviceTypes();
        String jsonStr = JSON.toJSONString(govDeviceTypes);
        request.setAttribute("govDeviceTypes", jsonStr);
        return "gov/group/govGroup/deviceSelect";
    }

    /**
     * 分组获取设备列表(不需要权限)
     *
     * @param para 搜索参数
     * @return {@link DataTable}
     */
    @PostMapping("gov/device/govDevice/deviceSelect")
    @ResponseBody
    public DataTable deviceList(@RequestParam Map para) {
        SessionUser sessionUser = getSessionUser();

        if (sessionUser.isAdmin()) {
            IPage page = govDeviceService.selectPageList(para);
            return DataTable.ok(page);
        } else {
            para.put("area", sessionUser.getArea());
            IPage page = govDeviceService.selectPageList(para);
            return DataTable.ok(page);
        }
    }

    /**
     * 打印机初始化
     *
     * @param id   设备主键
     * @param flat 0代表空纸初始化 1代表满纸初始化 2代表重新初始化
     * @return
     */
    @GetMapping("gov/device/govDevice/paperInitialization")
    @ResponseBody
    public ReturnBean paperInitialization(Integer id, Integer flat) {
        if (flat == 0) {
            govDeviceService.emptyPaperInitialization(id);
        } else if (flat == 1) {
            govDeviceService.fullPaperInitialization(id);
        } else if (flat == 2) {
            govDeviceService.resetPaperInitialization(id);
        }
        GovDevice printerInfo = govDeviceService.getPrinterInfo(id);
        return ReturnBean.ok(printerInfo);
    }

    /**
     * 设备校验
     *
     * @param govDevice
     * @return
     */
    @GetMapping("gov/device/govDevice/deviceCheck")
    @ResponseBody
    public ReturnBean deviceCheck(GovDevice govDevice) {
        if (govDeviceService.deviceCheck(govDevice)) {
            return ReturnBean.ok();
        } else {
            return ReturnBean.error();
        }
    }

}
