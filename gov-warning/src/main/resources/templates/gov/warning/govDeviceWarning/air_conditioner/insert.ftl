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
                    <div class="box-body">
                        <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">设备最低温度：</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="warningDetails" name="tempL"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">设备最高温度：</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="warningDetails" name="tempH"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">设备最小湿度：</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="warningDetails" name="humiL"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">设备最大湿度：</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="warningDetails" name="humiH"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">
                                        短信模板：
                                    </label>
                                    <div class="col-sm-8">
                                        <textarea rows="4" name="smsMode" class="form-control"></textarea>
                                        <span style="color: red">短信模板规则：${r'${name}'}:表示设备名,${r'${temp}'}:表示当前温度, ${r'${humi}'}:表示当前湿度</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">预警时间：</label>
                                    <div class="col-sm-8">
                                        <input type="checkbox" name="week" class="icheck" value="2">周一&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="3">周二&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="4">周三&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="5">周四&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="6">周五&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="7">周六&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="1">周日&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">节假日预警：</label>
                                    <div class="col-sm-8">
                                        <input type="radio" name="isHoliday" class="icheck" value="1" checked>是
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isHoliday" class="icheck" value="0">否
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isHoliday" class="icheck" value="2">仅节假日执行
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">状态：</label>
                                    <div class="col-sm-8">
                                        <input type="radio" name="status" class="icheck" value="1">启用
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="status" class="icheck" value="0" checked>禁用
                                    </div>
                                </div>
                            </div>
                            <#--隐藏域-->
                            <input type="hidden" name="attrTypeCode" value="air_conditioner">
                            <input type="hidden" name="attrTypeName" value="空调">
                            <input type="hidden" name="linkDeviceJsonStr" id="linkDeviceJsonStr">
                            <input type="hidden" name="pushManJsonStr" id="pushManJsonStr">
                            <input type="hidden" name="timeJsonStr" id="timeJsonStr">
                        </form>
                        <div class="row">
                            <div class="form-group">
                                <label for="linkDevice" class="control-label col-sm-3"
                                       style="text-align: right;">关联设备：</label>
                                <button title="添加" type="button" id="linkDeviceBtn" data-placement="left"
                                        data-toggle="tooltip"
                                        class="btn btn-success btn-sm">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <table id="deviceTable" class="table table-bordered"
                                       style="margin: 0 auto;width: 80%" hidden>
                                    <tr>
                                        <th width="33%">ID</th>
                                        <th width="33%">设备名称</th>
                                        <th width="33%">操作</th>
                                    </tr>

                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="pushMan" class="control-label col-sm-3"
                                       style="text-align: right;">推送人：</label>
                                <button title="添加" type="button" id="pushManBtn" data-placement="left"
                                        data-toggle="tooltip"
                                        class="btn btn-success btn-sm">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <table id="pushManTable" class="table table-bordered" hidden
                                       style="margin: 0 auto;width: 80%">
                                    <tr>
                                        <th width="20%">ID</th>
                                        <th width="30%">姓名</th>
                                        <th width="30%">手机号码</th>
                                        <th width="20%">操作</th>
                                    </tr>

                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="time" class="control-label col-sm-3"
                                       style="text-align: right;">预警时间：</label>
                                <button title="添加" type="button" id="timeBtn" data-placement="left"
                                        data-toggle="tooltip"
                                        class="btn btn-success btn-sm">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <table id="timeTable" class="table table-bordered" hidden
                                       style="margin: 0 auto;width: 80%">
                                    <tr>
                                        <th width="20%">开始时间</th>
                                        <th width="30%">结束时间</th>
                                        <th width="20%">操作</th>
                                    </tr>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        //全局变量
        var pushManIdArr = [];//存储当前保存的推送人员id
        var deviceIdArr = [];//存储当前保存的关联设备id

        var validateForm;
        $(function () {
            //验证表单
            validateForm = $("#krtForm").validate({});

        });

        function getJsonStr() {
            var d = [];
            $(".deviceId").each(function (k, v) {
                var o = {};
                o.deviceId = $(".deviceId").eq(k).val();
                o.deviceName = $(".deviceName").eq(k).val();
                d.push(o);
            })
            if (d.length > 0) {
                $("input[name='linkDeviceJsonStr']").val(JSON.stringify(d));
            } else {
                $("input[name='linkDeviceJsonStr']").val("");
            }
            var p = [];
            $(".staffUuid").each(function (k, v) {
                var o = {};
                o.staffUuid = $(".staffUuid").eq(k).val();
                o.staffName = $(".staffName").eq(k).val();
                o.staffPhone = $(".staffPhone").eq(k).val();
                p.push(o);
            })
            if (p.length > 0) {
                $("input[name='pushManJsonStr']").val(JSON.stringify(p));
            } else {
                $("input[name='pushManJsonStr']").val("");
            }
            var t = [];
            $(".sTime").each(function (k, v) {
                var o = {};
                if ($(".sTime").eq(k).val() != '' && $(".fTime").eq(k).val() != '') {
                    o.sTime = $(".sTime").eq(k).val();
                    o.fTime = $(".fTime").eq(k).val();
                    t.push(o);
                }
            })
            if (t.length > 0) {
                $("input[name='timeJsonStr']").val(JSON.stringify(t));
            } else {
                $("input[name='timeJsonStr']").val("");
            }
        }

        //提交
        function doSubmit() {
            //将设备、推送人和预警时间转为json字符串并赋值到隐藏域中
            getJsonStr();

            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/warning/govDeviceWarning/insert",
                data: $('#krtForm').serialize(),
                validateForm: validateForm,
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        krt.table.reloadTable();
                        krt.layer.close(index);
                    }
                }
            });
        }

        // 新增推送人员
        $("#pushManBtn").click(function () {
            krt.layer.open({
                type: 2,
                area: ['1000px', '600px'],
                title: "新增推送人员",
                maxmin: true, //开启最大化最小化按钮
                content: "${basePath}/gov/staff/pushStaff/list",
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var radio = layero.find("iframe")[0].contentWindow.$('input[type="checkbox"]:checked');
                    for (var i = 0; i < radio.length; i++) {
                        if ($.inArray(Number(radio[i].value), pushManIdArr) == -1 && !isNaN(radio[i].value)) {
                            pushManIdArr.push(Number(radio[i].value));
                            $("#pushManTable").append("<tr id='pushMan" + radio[i].value + "'><td>" + radio[i].value + "</td><td>" + radio[i].name + "</td>" +
                                "<td>" + radio[i].min + "</td><td>" +
                                "<button class='btn btn-xs btn-danger pushManDeleteBtn' rid='" + radio[i].value + "'>" +
                                "<i class='fa fa-trash fa-btn'></i>删除" +
                                "</button>" +
                                "</td><input type='hidden' class='staffUuid' value='" + radio[i].value + "'><input type='hidden' class='staffName' value='" + radio[i].name + "'>" +
                                "<input type='hidden' class='staffPhone' value='" + radio[i].min + "'></tr>");
                        }
                    }
                    if (pushManIdArr.length > 0) {
                        $('#pushManTable').show();
                    }
                    top.layer.close(index);
                },
                cancel: function (index) {
                    top.layer.close(index);
                }
            });
        });

        // 推送人员的删除
        $(document).on("click", ".pushManDeleteBtn", function () {
            var pushManId = $(this).attr("rid");
            pushManIdArr.splice($.inArray(Number(pushManId), pushManIdArr), 1);
            $('#pushMan' + pushManId).remove();
            if (pushManIdArr.length == 0) {
                $('#pushManTable').hide();
            }
        });

        // 关联设备
        $("#linkDeviceBtn").click(function () {
            krt.layer.open({
                type: 2,
                area: ['900px', '500px'],
                title: "关联预警设备",
                maxmin: true, //开启最大化最小化按钮
                content: "${basePath}/gov/warning/govDevice/list?type=2",
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var radio = layero.find("iframe")[0].contentWindow.$('input[type="checkbox"]:checked');
                    for (var i = 0; i < radio.length; i++) {
                        if ($.inArray(Number(radio[i].value), deviceIdArr) == -1 && !isNaN(radio[i].value)) {
                            deviceIdArr.push(Number(radio[i].value));
                            $("#deviceTable").append("<tr id='device" + radio[i].value + "'><td>" + radio[i].value + "</td>" +
                                "<td>" + radio[i].name + "</td><td>" +
                                "<button class='btn btn-xs btn-danger deviceDeleteBtn' rid='" + radio[i].value + "'>" +
                                "<i class='fa fa-trash fa-btn'></i>删除" +
                                "</button>" +
                                "</td><input type='hidden' class='deviceId' value='" + radio[i].value + "'><input type='hidden' class='deviceName' value='" + radio[i].name + "'></tr>");
                        }
                    }
                    if (deviceIdArr.length > 0) {
                        $('#deviceTable').show();
                    }
                    top.layer.close(index);
                },
                cancel: function (index) {
                    top.layer.close(index);
                }
            });
        });

        // 关联设备删除
        $(document).on("click", ".deviceDeleteBtn", function () {
            var pushManId = $(this).attr("rid");
            deviceIdArr.splice($.inArray(Number(pushManId), deviceIdArr), 1);
            $('#device' + pushManId).remove();
            if (deviceIdArr.length == 0) {
                $('#deviceTable').hide();
            }
        });

        // 预警时间
        $("#timeBtn").click(function () {
            krt.layer.open({
                type: 2,
                area: ['900px', '500px'],
                title: "新增预警时间段",
                maxmin: true, //开启最大化最小化按钮
                content: "${basePath}/gov/warning/govDeviceWarningTime/insert",
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var sTime = layero.find("iframe")[0].contentWindow.$("#startTime").val();
                    var fTime = layero.find("iframe")[0].contentWindow.$("#endTime").val();
                    $("#timeTable").append("<tr><td>" + sTime + "</td><td>" + fTime + "</td>" +
                        "<td><button type='button' class='btn btn-xs btn-danger' onclick='timeDelBtn(this)'>" +
                        "<i class='fa fa-trash fa-btn'></i>删除 </button></td>" +
                        "<input type='hidden' class='sTime' value='" + sTime + "'><input type='hidden' class='fTime' value='" + fTime + "'></tr>");
                    if ($('#timeTable').children().children('tr').length > 1) {
                        $('#timeTable').show();
                    }
                    top.layer.close(index);
                },
                cancel: function (index) {
                    top.layer.close(index);
                }
            });
        });

        // 预警时间删除
        function timeDelBtn(a) {
            $(a).parent().parent().remove();
            if ($('#timeTable').children().children('tr').length == 1) {
                $('#timeTable').hide();
            }
        }
    </script>
</@footer>

