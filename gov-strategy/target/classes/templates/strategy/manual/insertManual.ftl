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
                                        <input type="text" name="strategyTypeName" class="form-control" required>
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
                                        <input type="hidden" name="strategyTypeCode" value="1">
                                        <input type="text" class="form-control" value="普通手动执行策略" readonly>
                                    </div>
                                </div>
                            </div>
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
                                                <th width="25%">ID</th>
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
                                    '   <td></td>' +
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
            var a = [];
            $(".deviceId").each(function (k, v) {
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
        }

        //提交
        function doSubmit() {
            getDeviceStrategyLinks();
            if ($("input[name='deviceStrategyLinks']").val() == '') {
                krt.layer.msg("请选择设备");
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
                        // console.log(top.krt.tab);
                        contentWindow.reloadTable();
                        // contentWindow.initTree();
                        krt.layer.close(index);
                    }
                }
            });
        }
    </script>
</@footer>

