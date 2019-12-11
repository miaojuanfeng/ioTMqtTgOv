package com.krt.gov.strategy.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.DataTable;
import com.krt.common.bean.ReturnBean;
import com.krt.common.session.SessionUser;
import com.krt.common.util.ShiroUtils;
import com.krt.common.util.SpringUtils;
import com.krt.gov.device.entity.GovDevice;
import com.krt.gov.device.service.IGovDeviceService;
import com.krt.gov.strategy.constant.StrategyConst;
import com.krt.gov.strategy.entity.DeviceStrategy;
import com.krt.gov.strategy.entity.DeviceStrategyLink;
import com.krt.gov.strategy.entity.DeviceStrategyRequire;
import com.krt.gov.strategy.entity.DeviceStrategyTime;
import com.krt.gov.strategy.service.IDeviceStrategyLinkService;
import com.krt.gov.strategy.service.IDeviceStrategyRequireService;
import com.krt.gov.strategy.service.IDeviceStrategyService;
import com.krt.gov.strategy.service.IDeviceStrategyTimeService;
import com.krt.quartz.entity.Quartz;
import com.krt.quartz.service.IQuartzService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringEscapeUtils;
import org.quartz.CronScheduleBuilder;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("gov/strategy")
public class DeviceStrategyController extends BaseController {

    @Autowired
    private IDeviceStrategyService deviceStrategyService;

    @Autowired
    private IDeviceStrategyLinkService deviceStrategyLinkService;

    @Autowired
    private IDeviceStrategyRequireService deviceStrategyRequireService;

    @Autowired
    private IGovDeviceService deviceService;

    @Autowired
    private IQuartzService quartzService;

    @Autowired
    private IDeviceStrategyTimeService deviceStrategyTimeService;

    /**
     * 策略管理页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:list")
    @GetMapping("list")
    public String list() {
        return "strategy/list";
    }

    /**
     * 策略管理页
     *
     * @return DataTable {@lin DataTable<DeviceStrategy>}
     */
//    @RequiresPermissions("sys:role:list")
    @PostMapping("list")
    @ResponseBody
    public DataTable list(@RequestParam Map para) {
        SessionUser sessionUser = ShiroUtils.getSessionUser();

        if (sessionUser.isAdmin()) {
            IPage page = deviceStrategyService.selectPageList(para);
            return DataTable.ok(page);
        } else {
            para.put("area", sessionUser.getArea());
            IPage page = deviceStrategyService.selectPageList(para);
            return DataTable.ok(page);
        }
    }

    /**
     * 添加策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("insert")
    public String insert() {
        return "strategy/insert";
    }

    /**
     * 添加策略角色
     *
     * @return ReturnBean {@link ReturnBean}
     */
    @KrtLog("添加策略")
//    @RequiresPermissions("sys:role:insert")
    @PostMapping("insert")
    @ResponseBody
    public ReturnBean insert(DeviceStrategy deviceStrategy, String deviceStrategyRequires, String deviceStrategyLinks, String deviceStrategyTimes) throws SchedulerException {
        //解决转义字符问题
        deviceStrategy.setRunningTime(StringEscapeUtils.unescapeHtml4(deviceStrategy.getRunningTime()));

        SessionUser sessionUser = ShiroUtils.getSessionUser();

        if (sessionUser.isAdmin()) {
            deviceStrategyService.insert(deviceStrategy);
        } else {
            deviceStrategy.setArea(sessionUser.getArea());
            deviceStrategyService.insert(deviceStrategy);
        }
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME) {
            initQuartz(deviceStrategy);
//            deviceStrategy.setQuartz(StringUtils.join(quartzIds, ","));
        }
//        if( deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME ) {
//            DeviceStrategy updateStrategy = new DeviceStrategy();
//            updateStrategy.setId(deviceStrategy.getId());
//            updateStrategy.setQuartz(deviceStrategy.getQuartz());
//            deviceStrategyService.updateById(updateStrategy);
//        }
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_CONDITION && deviceStrategyRequires != null) {
            List<DeviceStrategyTime> timeList = new ArrayList<>();
            JSONArray timeArr = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyTimes));
            if (timeArr != null) {
                for (int j = 0; j < timeArr.size(); j++) {
                    JSONObject object = timeArr.getJSONObject(j);
                    DeviceStrategyTime deviceStrategyTime = new DeviceStrategyTime();
                    deviceStrategyTime.setStrategyId(deviceStrategy.getId());
                    deviceStrategyTime.setSTime(object.getString("startTime"));
                    deviceStrategyTime.setETime(object.getString("endTime"));
                    timeList.add(deviceStrategyTime);
                }
                deviceStrategyTimeService.insertBatch(timeList);
            }

            List<DeviceStrategyRequire> list = new ArrayList<>();
            JSONArray array = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyRequires));
            for (int i = 0; i < array.size(); i++) {
                JSONObject obj = array.getJSONObject(i);
                DeviceStrategyRequire deviceStrategyRequire = new DeviceStrategyRequire();
                deviceStrategyRequire.setStrategyId(deviceStrategy.getId());
                deviceStrategyRequire.setDeviceId(obj.getInteger("deviceId"));
                deviceStrategyRequire.setDeviceName(obj.getString("deviceName"));
                if (!"".equals(obj.getString("condition"))) {
                    String require = StringEscapeUtils.unescapeHtml4(obj.getJSONObject("condition").toString());
                    deviceStrategyRequire.setRequires(require);
                    JSONObject requireJson = JSONObject.parseObject(require);
                    deviceStrategyRequire.setHumiL(requireJson.getInteger("humiMin"));
                    deviceStrategyRequire.setHumiH(requireJson.getInteger("humiMax"));
                    deviceStrategyRequire.setTempL(requireJson.getInteger("tempMin"));
                    deviceStrategyRequire.setTempH(requireJson.getInteger("tempMax"));
                    deviceStrategyRequire.setOnOff(requireJson.getInteger("onOff"));
                }
                deviceStrategyRequire.setRequiresDetails(obj.getString("conditionDetails"));
                list.add(deviceStrategyRequire);
            }
            deviceStrategyRequireService.insertBatch(list);
        }
        if (deviceStrategyLinks != null) {
            List<DeviceStrategyLink> list = new ArrayList<>();
            JSONArray array = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyLinks));
            for (int i = 0; i < array.size(); i++) {
                JSONObject obj = array.getJSONObject(i);
                DeviceStrategyLink deviceStrategyLink = new DeviceStrategyLink();
                deviceStrategyLink.setStrategyId(deviceStrategy.getId());
                deviceStrategyLink.setDeviceId(obj.getInteger("deviceId"));
                deviceStrategyLink.setDeviceName(obj.getString("deviceName"));
                if (!"".equals(obj.getString("action"))) {
                    String action = StringEscapeUtils.unescapeHtml4(obj.getJSONObject("action").toString());
                    deviceStrategyLink.setAction(action);
                }
                deviceStrategyLink.setActionDetails(obj.getString("actionDetails"));
                list.add(deviceStrategyLink);
            }
            deviceStrategyLinkService.insertBatch(list);
        }
        return ReturnBean.ok();
    }

    private void initQuartz(DeviceStrategy deviceStrategy) {
        JSONArray runningTime = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategy.getRunningTime()));
        List<Quartz> quartzList = new ArrayList<>();
        for (int i = 0; i < runningTime.size(); i++) {
            String[] time = runningTime.getString(i).split(":");
            Integer h = Integer.valueOf(time[0]);
            Integer m = Integer.valueOf(time[1]);
            String w = deviceStrategy.getWeek();
            if (StrategyConst.FULL_WEEK.equals(w)) {
                w = "*";
            }
            String cron = "0 " + m + " " + h + " ? * " + w;
            try {
                CronScheduleBuilder.cronSchedule(cron);
            } catch (Exception e) {
                log.error("cron表达式有误，不能被解析！");
            }
            Quartz quartz = new Quartz();
            quartz.setGroupName("定时自动执行策略");
            quartz.setName(deviceStrategy.getStrategyTypeName() + " - " + runningTime.getString(i));
            quartz.setExpression(cron);
            quartz.setIsConcurrent("0");
            quartz.setSpringId("deviceStrategyQuartz");
            quartz.setMethod("process");
            quartz.setDescription(String.valueOf(deviceStrategy.getId()));
            quartz.setStatus("0");
            quartzList.add(quartz);
        }
        quartzService.insertBatch(quartzList);
    }

    /**
     * 添加手动策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("insertManual")
    public String insertManual() {
        return "strategy/manual/insertManual";
    }

    /**
     * 添加定时策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("insertTime")
    public String insertTime() {
//        request.setAttribute("weekList", getWeekList());
        return "strategy/time/insertTime";
    }

    /**
     * 添加条件策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("insertCondition")
    public String insertCondition() {
//        request.setAttribute("weekList", getWeekList());
        return "strategy/condition/insertCondition";
    }

//    private List getWeekList(){
//        List<String> weekList = new ArrayList<>();
//        weekList.add("周一");
//        weekList.add("周二");
//        weekList.add("周三");
//        weekList.add("周四");
//        weekList.add("周五");
//        weekList.add("周六");
//        weekList.add("周日");
//        return weekList;
//    }

    /**
     * 选择页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @PostMapping("device/select")
    @ResponseBody
    public DataTable selectDevice(@RequestParam Map para) {
//        List list = deviceService.selectList();
//        return ReturnBean.ok(list);
        SessionUser sessionUser = ShiroUtils.getSessionUser();

        if (sessionUser.isAdmin()) {
            IPage page = deviceService.selectPageList(para);
            return DataTable.ok(page);
        } else {
            para.put("area", sessionUser.getArea());
            IPage page = deviceService.selectPageList(para);
            return DataTable.ok(page);
        }
    }

    /**
     * 添加定时策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("device/insert")
    public String insertDevice(String onOff, String temp, String mode, String windSpeed, String time, Integer id) {
        GovDevice govDevice = deviceService.selectById(id);
        //如果是空调的话获得空调设备信息,并转发到空调信息设置页
        Integer type = govDevice.getType();
        request.setAttribute("type", type);
        switch (govDevice.getType()) {
            case 1:
                request.setAttribute("onOff", onOff);
                request.setAttribute("time", time);
                return "strategy/device/switchSetting";
            case 2:
                request.setAttribute("deviceInfo", govDevice.getInfo());
                request.setAttribute("onOff", onOff);
                request.setAttribute("temp", temp);
                request.setAttribute("mode", mode);
                request.setAttribute("windSpeed", windSpeed);
                return "strategy/device/airConditionerSetting";
            default:
                return "strategy/list";
        }
    }

//        /**
//         * 添加定时策略页
//         *
//         * @return String {@link String}
//         */
////    @RequiresPermissions("sys:role:insert")
//    @GetMapping("device/update/{id}")
//    public String updateDevice(@PathVariable("id") Integer id) {
//        DeviceStrategyLink deviceStrategyLink = deviceStrategyLinkService.selectById(id);
//        if( deviceStrategyLink != null ){
//            String action = deviceStrategyLink.getAction();
//            if( action != null && !"".equals(action) ){
//                JSONObject obj = JSONObject.parseObject(action);
//                request.setAttribute("onOff", obj.getString("onOff"));
//                request.setAttribute("temp", obj.getString("temp"));
//                request.setAttribute("mode", obj.getString("mode"));
//            }
//        }
//        return "strategy/deviceUpdate";
//    }

    /**
     * 添加条件策略页
     *
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:insert")
    @GetMapping("device/condition")
    public String conditionDevice(String tempMin, String tempMax, String humiMax, String humiMin, String
            onOff, Integer id) {
        GovDevice govDevice = deviceService.selectById(id);
        //如果是空调的话获得空调设备信息,并转发到空调信息设置页
        Integer type = govDevice.getType();
        request.setAttribute("type", type);
        switch (govDevice.getType()) {
            case 1:
                request.setAttribute("onOff", onOff);
                return "strategy/device/switchCondition";
            case 2:
                request.setAttribute("tempMin", tempMin);
                request.setAttribute("tempMax", tempMax);
                request.setAttribute("humiMax", humiMax);
                request.setAttribute("humiMin", humiMin);
                return "strategy/device/airConditionerCondition";
            default:
                return "strategy/list";
        }
    }
//

    /**
     * 查看策略信息
     *
     * @param id 角色id
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:see")
    @GetMapping("see")
    public String see(Integer id) {
//        request.setAttribute("weekList", getWeekList());
        DeviceStrategy deviceStrategy = deviceStrategyService.selectById(id);
        List<DeviceStrategyRequire> deviceStrategyRequireList = deviceStrategyRequireService.selectByStrategyId(id);
        List<DeviceStrategyLink> deviceStrategyLinkList = deviceStrategyLinkService.selectByStrategyId(id);
        request.setAttribute("deviceStrategy", deviceStrategy);
        request.setAttribute("deviceStrategyRequireList", deviceStrategyRequireList);
        request.setAttribute("deviceStrategyLinkList", deviceStrategyLinkList);
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME) {
            JSONArray timeArray = JSONArray.parseArray(deviceStrategy.getRunningTime());
            if (timeArray != null) {
                List<String> runningTime = new ArrayList<>();
                for (int i = 0; i < timeArray.size(); i++) {
                    runningTime.add(timeArray.getString(i));
                }
                request.setAttribute("runningTime", runningTime);
            }
        }
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_CONDITION) {
            List deviceStrategyTimes = deviceStrategyTimeService.selectByStrategyId(id);
            request.setAttribute("deviceStrategyTimes", deviceStrategyTimes);
        }
        switch (deviceStrategy.getStrategyTypeCode()) {
            case 1:
                return "strategy/manual/seeManual";
            case 2:
                return "strategy/time/seeTime";
            case 3:
                return "strategy/condition/seeCondition";
        }
        return "";
    }

//

    /**
     * 修改策略信息
     *
     * @param id 策略id
     * @return String {@link String}
     */
//    @RequiresPermissions("sys:role:update")
    @GetMapping("update")
    public String update(Integer id) {
//        request.setAttribute("weekList", getWeekList());
        DeviceStrategy deviceStrategy = deviceStrategyService.selectById(id);
        List<DeviceStrategyRequire> deviceStrategyRequireList = deviceStrategyRequireService.selectByStrategyId(id);
        List<DeviceStrategyLink> deviceStrategyLinkList = deviceStrategyLinkService.selectByStrategyId(id);
        request.setAttribute("deviceStrategy", deviceStrategy);
        request.setAttribute("deviceStrategyRequireList", deviceStrategyRequireList);
        request.setAttribute("deviceStrategyLinkList", deviceStrategyLinkList);
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME) {
            JSONArray timeArray = JSONArray.parseArray(deviceStrategy.getRunningTime());
            if (timeArray != null) {
                List<String> runningTime = new ArrayList<>();
                for (int i = 0; i < timeArray.size(); i++) {
                    runningTime.add(timeArray.getString(i));
                }
                request.setAttribute("runningTime", runningTime);
            }
        }
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_CONDITION) {
            List<DeviceStrategyTime> deviceStrategyTimes = deviceStrategyTimeService.selectByStrategyId(id);
            request.setAttribute("deviceStrategyTimes", deviceStrategyTimes);
        }
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_CONDITION) {
            List deviceStrategyTimes = deviceStrategyTimeService.selectByStrategyId(id);
            request.setAttribute("deviceStrategyTimes", deviceStrategyTimes);
        }
        switch (deviceStrategy.getStrategyTypeCode()) {
            case 1:
                return "strategy/manual/updateManual";
            case 2:
                return "strategy/time/updateTime";
            case 3:
                return "strategy/condition/updateCondition";
        }
        return "";
    }

    /**
     * 修改策略
     *
     * @return ReturnBean {@link ReturnBean}
     */
    @KrtLog("修改策略")
//    @RequiresPermissions("sys:role:update")
    @PostMapping("update")
    @ResponseBody
    public ReturnBean update(DeviceStrategy deviceStrategy, String deviceStrategyRequires, String
            deviceStrategyLinks, String deviceStrategyTimes) {
        //解决转义字符问题
        deviceStrategy.setRunningTime(StringEscapeUtils.unescapeHtml4(deviceStrategy.getRunningTime()));

        deviceStrategyService.updateById(deviceStrategy);
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME) {
            quartzService.deleteByStrategyId(deviceStrategy.getId());
            initQuartz(deviceStrategy);
        }
        deviceStrategyLinkService.deleteByStrategyId(deviceStrategy.getId());
        deviceStrategyRequireService.deleteByStrategyId(deviceStrategy.getId());
        if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_CONDITION && deviceStrategyRequires != null) {
            deviceStrategyTimeService.deleteByStrategyId(deviceStrategy.getId());
            List<DeviceStrategyTime> timeList = new ArrayList<>();
            JSONArray timeArr = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyTimes));
            if (timeArr != null) {
                for (int j = 0; j < timeArr.size(); j++) {
                    JSONObject object = timeArr.getJSONObject(j);
                    DeviceStrategyTime deviceStrategyTime = new DeviceStrategyTime();
                    deviceStrategyTime.setStrategyId(deviceStrategy.getId());
                    deviceStrategyTime.setSTime(object.getString("startTime"));
                    deviceStrategyTime.setETime(object.getString("endTime"));
                    timeList.add(deviceStrategyTime);
                }
                deviceStrategyTimeService.insertBatch(timeList);
            }

            List<DeviceStrategyRequire> list = new ArrayList<>();
            JSONArray array = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyRequires));
            for (int i = 0; i < array.size(); i++) {
                JSONObject obj = array.getJSONObject(i);
                DeviceStrategyRequire deviceStrategyRequire = new DeviceStrategyRequire();
                deviceStrategyRequire.setStrategyId(deviceStrategy.getId());
                deviceStrategyRequire.setDeviceId(obj.getInteger("deviceId"));
                deviceStrategyRequire.setDeviceName(obj.getString("deviceName"));
                if (!"".equals(obj.getString("condition"))) {
                    String require = StringEscapeUtils.unescapeHtml4(obj.getJSONObject("condition").toString());
                    deviceStrategyRequire.setRequires(require);
                    JSONObject requireJson = JSONObject.parseObject(require);
                    deviceStrategyRequire.setHumiL(requireJson.getInteger("humiMin"));
                    deviceStrategyRequire.setHumiH(requireJson.getInteger("humiMax"));
                    deviceStrategyRequire.setTempL(requireJson.getInteger("tempMin"));
                    deviceStrategyRequire.setTempH(requireJson.getInteger("tempMax"));
                    deviceStrategyRequire.setOnOff(requireJson.getInteger("onOff"));
                }
                deviceStrategyRequire.setRequiresDetails(obj.getString("conditionDetails"));
                list.add(deviceStrategyRequire);
            }
            deviceStrategyRequireService.insertBatch(list);
        }
        if (deviceStrategyLinks != null) {
            List<DeviceStrategyLink> list = new ArrayList<>();
            JSONArray array = JSONArray.parseArray(StringEscapeUtils.unescapeHtml4(deviceStrategyLinks));
            for (int i = 0; i < array.size(); i++) {
                JSONObject obj = array.getJSONObject(i);
                DeviceStrategyLink deviceStrategyLink = new DeviceStrategyLink();
                deviceStrategyLink.setStrategyId(deviceStrategy.getId());
                deviceStrategyLink.setDeviceId(obj.getInteger("deviceId"));
                deviceStrategyLink.setDeviceName(obj.getString("deviceName"));
                if (!"".equals(obj.getString("action"))) {
                    String action = StringEscapeUtils.unescapeHtml4(obj.getJSONObject("action").toString());
                    deviceStrategyLink.setAction(action);
                }
                deviceStrategyLink.setActionDetails(obj.getString("actionDetails"));
                list.add(deviceStrategyLink);
            }
            deviceStrategyLinkService.insertBatch(list);
        }
        return ReturnBean.ok();
    }

    /**
     * 修改策略状态
     *
     * @param id 角色id
     * @return ReturnBean {@link ReturnBean}
     */
    @KrtLog("修改策略状态")
//    @RequiresPermissions("sys:role:delete")
    @PostMapping("status")
    @ResponseBody
    public ReturnBean status(Integer id, Integer status) throws SchedulerException {
        DeviceStrategy deviceStrategy = deviceStrategyService.selectById(id);
        if (deviceStrategy != null) {
            deviceStrategy.setStatus(status);
            deviceStrategyService.updateById(deviceStrategy);
            if (deviceStrategy.getStrategyTypeCode() == StrategyConst.STRATEGY_TIME) {
                List<Quartz> quartzs = quartzService.selectByStrategyId(deviceStrategy.getId());
                for (Quartz quartz : quartzs) {
                    ReturnBean rb = checkBean(quartz);
                    if (rb == null) {
                        quartzService.updateStatus(quartz.getId(), String.valueOf(status ^ 1));
                    }
                }
            }
            return ReturnBean.ok();
        } else {
            return ReturnBean.error("策略不存在");
        }
    }
//

    /**
     * 删除策略
     *
     * @param id 角色id
     * @return ReturnBean {@link ReturnBean}
     */
    @KrtLog("删除策略")
//    @RequiresPermissions("sys:role:delete")
    @PostMapping("delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        deviceStrategyService.deleteById(id);
        quartzService.deleteByStrategyId(id);
        return ReturnBean.ok();
    }
//

    /**
     * 批量删除策略
     *
     * @param ids 策略ids
     * @return ReturnBean {@link ReturnBean}
     */
    @KrtLog("批量删除策略")
//    @RequiresPermissions("sys:role:delete")
    @PostMapping("deleteByIds")
    @ResponseBody
    public ReturnBean deleteByIds(Integer[] ids) {
        for (int i = 0; i < ids.length; i++) {
            Integer id = ids[i];
            quartzService.deleteByStrategyId(id);
        }
        deviceStrategyService.deleteByIds(Arrays.asList(ids));
        return ReturnBean.ok();
    }
//

//
//    /**
//     * 检测角色名
//     *
//     * @param name 角色名
//     * @param id   角色id
//     * @return {@link Boolean}
//     */
//    @PostMapping("sys/role/checkName")
//    @ResponseBody
//    public Boolean checkName(String name, Integer id) {
//        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper<>();
//        queryWrapper.eq(Role::getName, name);
//        queryWrapper.ne(!Assert.isNull(id), Role::getId, id);
//        Integer count = roleService.selectCount(queryWrapper);
//        return count == 0;
//    }
//
//    /**
//     * 检测角色编码
//     *
//     * @param code 角色编码
//     * @param id   角色id
//     * @return {@link Boolean}
//     */
//    @PostMapping("sys/role/checkCode")
//    @ResponseBody
//    public Boolean checkCode(String code, Integer id) {
//        LambdaQueryWrapper<Role> queryWrapper = new LambdaQueryWrapper<>();
//        queryWrapper.eq(Role::getCode, code);
//        queryWrapper.ne(!Assert.isNull(id), Role::getId, id);
//        Integer count = roleService.selectCount(queryWrapper);
//        return count == 0;
//    }
//
//    /**
//     * 获取角色资源权限
//     *
//     * @param roleId 角色id
//     * @return {@link ReturnBean}
//     */
//    @RequiresPermissions("sys:role:res")
//    @PostMapping("sys/role/roleResTree")
//    @ResponseBody
//    public ReturnBean roleResTree(Integer roleId) {
//        List list = roleService.selectRoleResTree(roleId);
//        return ReturnBean.ok(list);
//    }
//
//    /**
//     * 资源权限设置
//     *
//     * @param roleId 角色id
//     * @param resIds 资源ids
//     * @return {@link ReturnBean}
//     */
//    @KrtLog("资源权限设置")
//    @RequiresPermissions("sys:role:res")
//    @PostMapping("sys/role/roleRes")
//    @ResponseBody
//    public ReturnBean roleRes(Integer roleId, Integer[] resIds) {
//        roleService.updateRoleRes(roleId, resIds);
//        return ReturnBean.ok();
//    }
//
//
//    /**
//     * 获取角色数据权限
//     *
//     * @param roleId 角色id
//     * @return {@link ReturnBean}
//     */
//    @RequiresPermissions("sys:role:scope")
//    @PostMapping("sys/role/roleScopeTree")
//    @ResponseBody
//    public ReturnBean roleScopeTree(Integer roleId) {
//        List list = roleService.selectScopeTree(roleId);
//        return ReturnBean.ok(list);
//    }
//
//    /**
//     * 设置数据权限
//     *
//     * @param roleId   角色id
//     * @param organIds 机构id
//     * @return {@link ReturnBean}
//     */
//    @KrtLog("设置数据权限")
//    @RequiresPermissions("sys:role:scope")
//    @PostMapping("sys/role/roleScope")
//    @ResponseBody
//    public ReturnBean roleScope(Integer roleId, Integer[] organIds) {
//        roleService.updateRoleScope(roleId, organIds);
//        return ReturnBean.ok();
//    }

    /**
     * 检测bean
     *
     * @param quartz 定时器
     * @return {@link ReturnBean}
     */
    private ReturnBean checkBean(Quartz quartz) {
        Object obj;
        try {
            if (quartz.getSpringId() != null && !"".equals(quartz.getSpringId())) {
                obj = SpringUtils.getBean(quartz.getSpringId());
            } else {
                Class clazz = Class.forName(quartz.getBeanClass());
                obj = clazz.newInstance();
            }
        } catch (Exception e) {
            return ReturnBean.error("执行任务类不存在");
        }
        if (obj == null) {
            return ReturnBean.error("执行任务类不存在");
        } else {
            Class clazz = obj.getClass();
            Method method;
            try {
                if ("DeviceStrategyQuartz".equals(obj.getClass().getSimpleName())) {
                    method = clazz.getDeclaredMethod(quartz.getMethod(), String.class);
                } else {
                    method = clazz.getMethod(quartz.getMethod());
                }
            } catch (Exception e) {
                return ReturnBean.error("未找到目标方法");
            }
            if (method == null) {
                return ReturnBean.error("未找到目标方法");
            }
        }
        return null;
    }


    public static void main(String[] args) {
        String h = "12";
        String m = "11";
        String w = "1,2,3,4";
        String cron = "0 " + m + " " + h + " ? * " + w;
        try {
            CronScheduleBuilder.cronSchedule(cron);
        } catch (Exception e) {
            System.out.println("cron表达式有误，不能被解析！");
        }
    }
}
