<#include "/common/layoutForm.ftl">
<@header></@header>
<style type="text/css">
    .form-horizontal .row {
        margin-right: 0 !important;
    }
</style>
<@body>
    <div class="wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                        <div class="box-body">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="pname" class="control-label">
                                            <span class="form-required">*</span>策略名称：
                                        </label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="text" name="strategyTypeName" id="name" class="form-control"
                                               required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>策略类型：
                                        </label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="strategyTypeCode" value="3">
                                        <input type="text" class="form-control" value="条件触发执行策略" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>设定时间
                                        </label>
                                    </div>
                                    <div class="col-sm-3 runningTimeCol">
                                        <p>
                                            <button title="添加" type="button" id="insertTimeBtn"
                                                    class="btn btn-success btn-sm">
                                                <i class="fa fa-plus"></i> 添加
                                            </button>
                                        </p>
                                    </div>
                                    <input type="hidden" name="deviceStrategyTimes">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>重复
                                        </label>
                                    </div>
                                    <div class="col-sm-10">
                                        <#--<#list weekList as week>-->
                                        <#--<input name="roleIds" value="" type="checkbox" class="icheck" required> ${week}-->
                                        <#--</#list>-->
                                        <input name="week" value="2" type="checkbox" class="icheck" checked required> 周一
                                        <input name="week" value="3" type="checkbox" class="icheck" checked required> 周二
                                        <input name="week" value="4" type="checkbox" class="icheck" checked required> 周三
                                        <input name="week" value="5" type="checkbox" class="icheck" checked required> 周四
                                        <input name="week" value="6" type="checkbox" class="icheck" checked required> 周五
                                        <input name="week" value="7" type="checkbox" class="icheck" checked required> 周六
                                        <input name="week" value="1" type="checkbox" class="icheck" checked required> 周日
                                    </div>
                                </div>
                            </div>
                            <#--<div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>节假日
                                        </label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="radio" name="isHoliday" value="1" class="icheck" checked required>
                                        节假日+工作日
                                        <input type="radio" name="isHoliday" value="2" class="icheck" required> 仅工作日
                                        <input type="radio" name="isHoliday" value="3" class="icheck" required> 仅节假日
                                    </div>
                                </div>
                            </div>-->
                            <#--<div class="row">-->
                            <#--<div class="form-group">-->
                            <#--<div class="col-sm-2">-->
                            <#--<label for="name" class="control-label">-->
                            <#--<span class="form-required">*</span>状态-->
                            <#--</label>-->
                            <#--</div>-->
                            <#--<div class="col-sm-10">-->
                            <#--<input type="radio" name="status" value="1" class="icheck" checked required> 启用-->
                            <#--<input type="radio" name="status" value="0" class="icheck" required> 禁用-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--</div>-->
                            <input type="hidden" name="status" value="0">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>前置条件
                                        </label>
                                    </div>
                                    <div class="col-sm-2">
                                        <button title="添加" type="button" id="insertConditionBtn"
                                                class="btn btn-success btn-sm">
                                            <i class="fa fa-plus"></i> 添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <table id="conditiontable" class="table table-bordered table-hover">
                                            <tr>
                                                <th width="25%">ID</th>
                                                <th width="25%">设备名称</th>
                                                <th width="25%">设定条件</th>
                                                <th width="25%">操作</th>
                                            </tr>
                                        </table>
                                        <input type="hidden" name="deviceStrategyRequires">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>管理设备
                                        </label>
                                    </div>
                                    <div class="col-sm-2">
                                        <button title="添加" type="button" id="insertBtn" class="btn btn-success btn-sm">
                                            <i class="fa fa-plus"></i> 添加
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <table id="datatable" class="table table-bordered table-hover">
                                            <tr>
                                                <th width="25">ID</th>
                                                <th width="25%">设备名称</th>
                                                <th width="25%">执行操作</th>
                                                <th width="25%">操作</th>
                                            </tr>
                                        </table>
                                        <input type="hidden" name="deviceStrategyLinks">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script src="<%=basePath%>static/plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        var validateForm;
        $(function () {
            validateForm = $("#krtForm").validate({
                rules: {
                    code: {
                        remote: {
                            url: "${basePath}/sys/organ/checkCode",
                            type: "post",
                            dataType: "json",
                            async: false,
                            data: {
                                code: function () {
                                    return $("#code").val();
                                }
                            }
                        }
                    }
                },
                messages: {
                    code: {remote: "机构代码已存在"}
                }
            });

            //新增条件
            $(document).on("click", "#insertConditionBtn", function () {
                var url = "strategy/device/deviceSelect";
                var tag = $(this);
                var id = $(this).attr("rid");
                <#--top.krt.layer.openDialog("执行操作", "${basePath}/gov/strategy/device/update/" + id, "480px", "400px");-->
                krt.layer.open({
                    type: 2,
                    area: ['600px', '500px'],
                    title: "添加设备",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/common/listSelect?url=" + encodeURI(url),
                    btn: ['确定', '关闭'],
                    yes: function (index, layero) {
                        var sId = layero.find("iframe")[0].contentWindow.$("#sId").val();
                        var sName = layero.find("iframe")[0].contentWindow.$("#sName").val();
                        if (sId == null || sId == '') {
                            top.layer.msg("请选择设备");
                        } else {
                            var ids = sId.split(',');
                            var names = sName.split(',');
                            var html = '';
                            for (var i = 0; i < ids.length; i++) {
                                html += '<tr>\n' +
                                    '   <td>' + ids[i] + '</td>\n' +
                                    '   <td>' + names[i] + '</td>\n' +
                                    '   <td></td>\n' +
                                    '   <td>\n' +
                                    '       <a class="btn btn-xs btn-warning updateConditionBtn" rid="' + ids[i] + '">\n' +
                                    '           <i class="fa fa-edit fa-btn"></i>操作\n' +
                                    '       </a>\n' +
                                    '       <button class="btn btn-xs btn-danger deleteBtn" rid="\' + row.id + \'">\n' +
                                    '           <i class="fa fa-trash fa-btn"></i>删除\n' +
                                    '       </button>\n' +
                                    '   </td>\n' +
                                    '   <input type="hidden" class="cdeviceId" value="' + ids[i] + '" />\n' +
                                    '   <input type="hidden" class="cdeviceName" value="' + names[i] + '" />\n' +
                                    '   <input type="hidden" class="condition" />\n' +
                                    '   <input type="hidden" class="conditionDetails" />\n' +
                                    '</tr>';
                            }
                            $("#conditiontable").append(html);
                            top.layer.close(index);
                        }
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //新增
            $(document).on("click", "#insertBtn", function () {
                var url = "strategy/device/deviceSelect";
                var tag = $(this);
                var id = $(this).attr("rid");
                <#--top.krt.layer.openDialog("执行操作", "${basePath}/gov/strategy/device/update/" + id, "480px", "400px");-->
                krt.layer.open({
                    type: 2,
                    area: ['600px', '500px'],
                    title: "添加设备",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/common/listSelect?url=" + encodeURI(url),
                    btn: ['确定', '关闭'],
                    yes: function (index, layero) {
                        var sId = layero.find("iframe")[0].contentWindow.$("#sId").val();
                        var sName = layero.find("iframe")[0].contentWindow.$("#sName").val();
                        if (sId == null || sId == '') {
                            top.layer.msg("请选择设备");
                        } else {
                            var ids = sId.split(',');
                            var names = sName.split(',');
                            var html = '';
                            for (var i = 0; i < ids.length; i++) {
                                html += '<tr>\n' +
                                    '   <td>' + ids[i] + '</td>\n' +
                                    '   <td>' + names[i] + '</td>\n' +
                                    '   <td></td>\n' +
                                    '   <td>\n' +
                                    '       <a class="btn btn-xs btn-warning updateBtn" rid="' + ids[i] + '">\n' +
                                    '           <i class="fa fa-edit fa-btn"></i>操作\n' +
                                    '       </a>\n' +
                                    '       <button class="btn btn-xs btn-danger deleteBtn" rid="\' + row.id + \'">\n' +
                                    '           <i class="fa fa-trash fa-btn"></i>删除\n' +
                                    '       </button>\n' +
                                    '   </td>\n' +
                                    '   <input type="hidden" class="deviceId" value="' + ids[i] + '" />\n' +
                                    '   <input type="hidden" class="deviceName" value="' + names[i] + '" />\n' +
                                    '   <input type="hidden" class="action" />\n' +
                                    '   <input type="hidden" class="actionDetails" />\n' +
                                    '</tr>';
                            }
                            $("#datatable").append(html);
                            top.layer.close(index);
                        }
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //修改条件
            $(document).on("click", ".updateConditionBtn", function () {
                var tag = $(this);
                var id = $(this).attr("rid");
                <#--top.krt.layer.openDialog("执行操作", "${basePath}/gov/strategy/device/update/" + id, "480px", "400px");-->
                var condition = tag.parent().parent().find("input[class='condition']").val();
                var p_onOff = "";

                var p_tempMin = "";
                var p_tempMax = "";
                var p_humiMin = "";
                var p_humiMax = "";
                if (condition != "") {
                    var p_o = JSON.parse(condition);
                    p_onOff = p_o.onOff;

                    p_tempMin = p_o.tempMin;
                    p_tempMax = p_o.tempMax;
                    p_humiMin = p_o.humiMin;
                    p_humiMax = p_o.humiMax;
                }
                krt.layer.open({
                    type: 2,
                    area: ['300px', '500px'],
                    title: "执行操作",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/gov/strategy/device/condition?tempMin=" + p_tempMin + "&tempMax=" + p_tempMax + "&humiMax=" + p_humiMax + "&humiMin=" + p_humiMin + "&onOff=" + p_onOff + "&id=" + id,
                    btn: ['确定', '关闭'],
                    yes: function (index, layero) {
                        var text = [];
                        var json = {};
                        var window = layero.find("iframe")[0].contentWindow;
                        var type = window.$("input[name='type']").val();
                        switch (type) {
                            case "1":
                                var onOff = window.$("input[name='onOff']:checked").val();
                                switch (onOff) {
                                    case '0':
                                        text.push("关机");
                                        break;
                                    case '1':
                                        text.push("开机");
                                        break;
                                }
                                json["onOff"] = onOff;
                                break;
                            case "2":
                                var tempMin = window.$("input[name='tempMin']").val();
                                if (tempMin != '') {
                                    text.push("温度低于" + tempMin + "℃");
                                }
                                var tempMax = window.$("input[name='tempMax']").val();
                                if (tempMax != '') {
                                    text.push("高于" + tempMax + "℃");
                                }
                                var humiMin = window.$("input[name='humiMin']").val();
                                if (humiMin != '') {
                                    text.push("湿度低于" + humiMin + "%RH");
                                }
                                var humiMax = window.$("input[name='humiMax']").val();
                                if (humiMax != '') {
                                    text.push("高于" + humiMax + "%RH");
                                }
                                json["tempMin"] = tempMin;
                                json["tempMax"] = tempMax;
                                json["humiMin"] = humiMin;
                                json["humiMax"] = humiMax;
                                break;
                        }
                        tag.parent().parent().find("input[class='condition']").val(JSON.stringify(json));
                        tag.parent().parent().find("input[class='conditionDetails']").val(text.join(", "));
                        tag.parent().prev().html(text.join(", "));
                        krt.layer.close(index);
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //执行操作
            $(document).on("click", ".updateBtn", function () {
                var tag = $(this);
                var id = $(this).attr("rid");
                //解析执行操作json字符串
                var action = tag.parent().parent().find("input[class='action']").val();
                var p_onOff = "";
                var p_time = "";
                var p_temp = "";
                var p_mode = "";
                var p_windSpeed = "";
                if (action != "") {
                    var p_o = JSON.parse(action);
                    p_time = p_o.time;
                    p_onOff = p_o.onOff;
                    p_temp = p_o.temp;
                    p_mode = p_o.mode;
                    p_windSpeed = p_o.windSpeed;
                }
                krt.layer.open({
                    type: 2,
                    area: ['300px', '500px'],
                    title: "执行操作",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/gov/strategy/device/insert?onOff=" + p_onOff + "&temp=" + p_temp + "&mode=" + p_mode + "&windSpeed=" + p_windSpeed + "&time=" + p_time + "&id=" + id,
                    btn: ['确定', '关闭'],
                    yes: function (index, layero) {
                        var text = [];
                        var json = {};
                        var window = layero.find("iframe")[0].contentWindow;
                        var type = window.$("input[name='type']").val();
                        switch (type) {
                            case "1":
                                var onOff = window.$("input[name='onOff']:checked").val();
                                switch (onOff) {
                                    case '0':
                                        text.push("关机");
                                        break;
                                    case '1':
                                        text.push("开机");
                                        break;
                                }
                                var time = window.$("input[name='time']").val();
                                if (time == 0) {
                                    text.push("保持");
                                } else {
                                    text.push(time + "秒");
                                }
                                json['onOff'] = onOff;
                                json['time'] = time;
                                break;
                            case "2":
                                var onOff = window.$("input[name='onOff']:checked").val();
                                switch (onOff) {
                                    case '0':
                                        text.push("开机");
                                        break;
                                    case '1':
                                        text.push("关机");
                                        break;
                                }
                                var temp = window.$("select[name='temp']").val();
                                if (temp != '') {
                                    text.push("设定温度" + temp + "℃");
                                }
                                var mode = window.$("select[name='mode']").val();
                                switch (Number(mode)) {
                                    case 0:
                                        text.push("制冷");
                                        break;
                                    case 1:
                                        text.push("制热");
                                        break;
                                    case 2:
                                        text.push("自动");
                                        break;
                                    case 3:
                                        text.push("自然风");
                                        break;
                                    case 4:
                                        text.push("除湿");
                                        break;
                                }
                                var windSpeed = window.$("select[name='windSpeed']").val();
                                switch (Number(windSpeed)) {
                                    case 0:
                                        text.push("自动");
                                        break;
                                    case 1:
                                        text.push("低速");
                                        break;
                                    case 2:
                                        text.push("中速");
                                        break;
                                    case 3:
                                        text.push("高速");
                                        break;
                                }
                                json["onOff"] = onOff;
                                json["temp"] = temp;
                                json["mode"] = mode;
                                json["windSpeed"] = windSpeed;
                                break;
                        }
                        tag.parent().parent().find("input[class='action']").val(JSON.stringify(json));
                        tag.parent().parent().find("input[class='actionDetails']").val(text.join(", "));
                        tag.parent().prev().html(text.join(", "));
                        krt.layer.close(index);
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //删除
            $(document).on("click", ".deleteBtn", function () {
                $(this).parent().parent().remove();
            });
        });

        function getDeviceStrategyLinks() {
            var t = [];
            $(".startTime").each(function (k, v) {
                var o = {};
                if ($(".startTime").eq(k).val() != '' && $(".endTime").eq(k).val() != '') {
                    o.startTime = $(".startTime").eq(k).val();
                    o.endTime = $(".endTime").eq(k).val();
                    t.push(o);
                }
            })
            if (t.length > 0) {
                $("input[name='deviceStrategyTimes']").val(JSON.stringify(t));
            } else {
                $("input[name='deviceStrategyTimes']").val("");
            }
            var a = [];
            $(".action").each(function (k, v) {
                var o = {};
                o.deviceId = $(".deviceId").eq(k).val();
                o.deviceName = $(".deviceName").eq(k).val();
                o.action = $(".action").eq(k).val();
                o.actionDetails = $(".actionDetails").eq(k).val();
                a.push(o);
            })
            if (a.length > 0) {
                $("input[name='deviceStrategyLinks']").val(JSON.stringify(a));
            } else {
                $("input[name='deviceStrategyLinks']").val("");
            }
            var b = [];
            $(".condition").each(function (k, v) {
                var o = {};
                o.deviceId = $(".cdeviceId").eq(k).val();
                o.deviceName = $(".cdeviceName").eq(k).val();
                o.condition = $(".condition").eq(k).val();
                o.conditionDetails = $(".conditionDetails").eq(k).val();
                b.push(o);
            })
            if (b.length > 0) {
                $("input[name='deviceStrategyRequires']").val(JSON.stringify(b));
            } else {
                $("input[name='deviceStrategyRequires']").val("");
            }
        }

        //添加时间
        $(document).on("click", "#insertTimeBtn", function () {
            var html =
                "<p>\n" +
                "   开始时间<input type=\"text\" class=\"form-control input-150 Wdate startTime\" onfocus=\"WdatePicker({dateFmt:'HH:mm'})\" required/>\n" +
                "   结束时间<input type=\"text\" class=\"form-control input-150 Wdate endTime\" onfocus=\"WdatePicker({dateFmt:'HH:mm'})\" required/>\n" +
                "   <a class=\"runningTimeDelete\" href=\"javascript:;\">删除</a>\n" +
                "</p>";
            $(".runningTimeCol").append(html);
        });

        //删除时间
        $(document).on("click", ".runningTimeDelete", function () {
            $(this).parent().remove();
        });

        //提交
        function doSubmit() {
            getDeviceStrategyLinks();
            if ($("input[name='deviceStrategyRequires']").val() == '') {
                krt.layer.msg("请选择条件");
                return;
            }
            if ($("input[name='deviceStrategyLinks']").val() == '') {
                krt.layer.msg("请选择设备");
                return;
            }
            if ($("input[name='deviceStrategyTimes']").val() == '') {
                krt.layer.msg("请设置时间");
                return;
            }
            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/strategy/insert",
                data: $('#krtForm').serialize(),
                validateForm: validateForm,
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        var contentWindow = top.krt.tab.getContentWindow();
                        // console.log(contentWindow);
                        contentWindow.reloadTable();
                        // contentWindow.initTree();
                        krt.layer.close(index);
                    }
                }
            });
        }
    </script>
</@footer>

