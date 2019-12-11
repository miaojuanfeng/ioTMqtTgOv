<#include "/common/layoutForm.ftl">
<@header></@header>
<@body >
    <div class="wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form role="form" class="form-horizontal krt-form" id="krtForm">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            产品编号：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="productId" name="productId" class="form-control" value="${govDevice.productId!}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            设备分组：
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="group" class="form-control">
                                                <#list groupList as group>
                                                    <option value="${group.id}" <#if (group.id==govDevice.group)!false >selected</#if> >${group
                                                        .groupName}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            设备ID：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="deviceId" name="deviceId" class="form-control"
                                                   value="${govDevice.deviceId!}" onchange="deviceCheck()">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            设备名：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" class="form-control"
                                                   value="${govDevice.name!}">
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            串口：
                                        </label>
                                        <div class="col-sm-8">
                                            <select name="port" id="port" class="form-control" onchange="changePort(this.value)">
                                                <option value="1" ${govDevice.port!?contains("1")?string("selected", "")}>串口一
                                                </option>
                                                <option value="2" ${govDevice.port!?contains("2")?string("selected", "")}>串口二
                                                </option>
                                                <option value="3" ${govDevice.port!?contains("3")?string("selected", "")}>串口三
                                                </option>
                                                <option value="4" ${govDevice.port!?contains("4")?string("selected", "")}>串口四
                                                </option>
                                                <option value="5" ${govDevice.port!?contains("5")?string("selected", "")}>串口五
                                                </option>
                                                <option value="PRINTER" ${govDevice.port!?contains("PRINTER")?string("selected", "")}>打印机</option>
                                                <option value="ELEC_METER" ${govDevice.port!?contains("ELEC_METER")?string("selected", "")}>电表
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 not-io"
                                     <#if govDevice.port!?contains("PRINTER") || govDevice.port!?contains("PRINTER")><#else>hidden</#if>
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        子设备编号：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="machine" name="machine" class="form-control" value="${govDevice.machine!}"
                                               onchange="deviceCheck()">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <@shiro.hasRole name="admin">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            区域：
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="province"
                                                    onchange="getCity(this.value)">
                                                <#list provinces as province>
                                                    <option value="${province.id!}"
                                                            <#if "#{((govDevice.area!)?number/10000)?int}"=="${province.code!}">selected</#if> >${province.name!}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="city"
                                                    onchange="getRegion(this.value)">
                                                <#list cities as city>
                                                    <option value="${city.id!}"
                                                            <#if "#{((govDevice.area!)?number/100)?int}"=="${city.code!}">selected</#if> >${city.name!}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </@shiro.hasRole>
                        <div class="row">
                            <@shiro.hasRole name="admin">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="region" onchange="getHall()">
                                                <#list regions as region>
                                                    <option value="${region.id!}"
                                                            code="${region.code!}"
                                                            <#if "${govDevice.area!}"=="${region.code!}">selected</#if> >${region.name!}</option>
                                                </#list>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </@shiro.hasRole>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        大厅:
                                    </label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="hallId" id="hall">
                                            <#list govHallList! as govHall>
                                                <option value="${govHall.id!}"
                                                        <#if "${govDevice.hallId!}"=="${govHall.id!}">selected</#if> >${govHall.floorName!}
                                                    -${govHall.name!}</option>
                                            </#list>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        采购时间：
                                    </label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control pull-right" name="purchasingTime"
                                                   value="${(govDevice.purchasingTime?string
                                                   ('yyyy-MM-dd'))!}" id="purchasingTime" readonly onClick="WdatePicker()">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        使用年限：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="durableYear" id="durableYear" value="${govDevice
                                        .durableYear!}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        保修年限：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="warranty" id="warranty" value="${govDevice.warranty!}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row time">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        时间：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="number" min="0" class="form-control" name="time" value="${govDevice.time!}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="area" id="area" value="${govDevice.area!}">
                        <input type="hidden" name="id" id="id" value="${govDevice.id!}">
                        <input type="hidden" name="type" id="type" value="${govDevice.type!}">
                        <input type="hidden" name="action" value='${govDevice.action!}'>
                    </form>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        //页面加载时
        $(document).ready(function () {
            var port = $('#port').val();
            changePort(port);
        });

        //获取市
        function getCity(val) {
            $('#city').empty();
            $('#city').append('<option value="">市</option>');
            $('#region').empty();
            $('#region').append('<option value="">区</option>');
            $('#hall').empty();
            $('#hall').append('<option value="">大厅</option>');

            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/device/govDevice/getRegions",
                data: {
                    pid: val,
                },
                success: function (rb) {
                    var data = rb.data;
                    if (data != null) {
                        for (var i = 0; i < data.length; i++) {
                            $('#city').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
                        }
                    }

                }
            });

            $('#area').val("");
        }

        //获取区
        function getRegion(val) {
            $('#region').empty();
            $('#region').append('<option value="">区</option>');
            $('#hall').empty();
            $('#hall').append('<option value="">大厅</option>');

            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/device/govDevice/getRegions",
                data: {
                    pid: val,
                },
                success: function (rb) {
                    var data = rb.data;
                    if (data != null) {
                        for (var i = 0; i < data.length; i++) {
                            $('#region').append('<option value="' + data[i].id + '" code="' + data[i].code + '">' + data[i].name + '</option>');
                        }
                    }

                }
            });

            $('#area').val("");
        }

        function getHall() {
            //给区域赋值
            var code = $('#region').find('option:selected').attr("code");
            $('#area').val(code);

            $('#hall').empty();
            $('#hall').append('<option value="">大厅</option>');

            //获取大厅
            krt.ajax({
                type: "get",
                url: "${basePath}/gov/hall/govHall/getHallByArea",
                data: {
                    area: code,
                },
                success: function (rb) {
                    var data = rb.data;
                    if (data != null) {
                        for (var i = 0; i < data.length; i++) {
                            $('#hall').append('<option value="' + data[i].id + '">' + data[i].floorName + '-' + data[i].name + '</option>');
                        }
                    }
                }
            });
        }

        //表单验证
        var validateForm;
        $(function () {
            validateForm = $("#krtForm").validate({
                rules: {
                    deviceId: {
                        required: true,
                        digits: true,
                    },
                    time: {
                        required: true,
                        digits: true,
                    },
                    name: "required",
                    productId: {
                        required: true,
                        digits: true,
                    },
                },
                messages: {
                    deviceId: {
                        required: "必填",
                        digits: "必须是数字"
                    },
                    time: {
                        required: "必填",
                        digits: "必须是数字"
                    },
                    name: "required",
                    productId: {
                        required: "必填",
                        digits: "必须是数字"
                    },
                }
            });
        });

        //提交
        function doSubmit() {
            //设备区域校验
            if ($('#area').val() == "") {
                krt.layer.msg("请选择设备区域");
                return false;
            }

            //设备大厅校验
            if ($('#hall').val() == "") {
                krt.layer.msg("请选择设备所在大厅");
                return false;
            }

            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/device/govDevice/update",
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

        //设备校验
        function deviceCheck() {
            var id = $('#id').val();
            var type = $('#type').val();
            var port = $('#port').val();
            if (port == 'PRINTER' || port == 'ELEC_METER') {
                //非io类设备
                var machine = $('#machine').val();
                var deviceId = $('#deviceId').val();
                if (isNaN(deviceId) || deviceId == '' || machine == '') {
                    return;
                }

                krt.ajax({
                    type: "get",
                    url: "${basePath}/gov/device/govDevice/deviceCheck",
                    data: {
                        type: type,
                        machine: machine,
                        deviceId: deviceId,
                        port: port,
                        id: id
                    },
                    async: true,
                    success: function (rb) {
                        if (rb.code === 500) {
                            $('#machine').val('');
                            krt.layer.msg("设备已存在");
                        }
                    }
                });
            } else {
                //io类设备
                var deviceId = $('#deviceId').val();
                if (isNaN(deviceId) || deviceId == '') {
                    return;
                }

                krt.ajax({
                    type: "get",
                    url: "${basePath}/gov/device/govDevice/deviceCheck",
                    data: {
                        type: type,
                        port: port,
                        deviceId: deviceId,
                        id: id
                    },
                    async: true,
                    success: function (rb) {
                        if (rb.code === 500) {
                            $('#deviceId').val('');
                            krt.layer.msg("设备已存在,请更换串口或者输入不同的设备ID");
                        }
                    }
                });
            }
        }

        //更改串口时
        function changePort(val) {
            if (val == 'PRINTER' || val == 'ELEC_METER') {
                $('.not-io').show();
            } else {
                $('.not-io').hide();
                $('#machine').val('');
            }

            if (val == '1' || val == '2' || val == '3' || val == '4' || val == '5') {
                $('.time').show();
            } else {
                $('.time').hide();
                $('#time').val('');
            }
            deviceCheck();
        }
    </script>
</@footer>