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
                                            <input type="text" id="productId" name="productId" class="form-control">
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
                                                    <option value="${group.id}">${group.groupName}</option>
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
                                            <input type="text" id="deviceId" name="deviceId" class="form-control" onchange="deviceCheck()">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            设备名：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row airConditioner">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="brandText" class="control-label col-sm-4">
                                            红外品牌
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="brand" name="brandName" class="form-control" placeholder="请选择">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="codeBankText" class="control-label col-sm-4">
                                            码库文件
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="file" name="fileName" class="form-control" placeholder="请选择">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6" id="tempId">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            功能：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="checkbox" value="0" name="function" class="icheck">温度
                                            <input type="checkbox" value="1" name="function" class="icheck">湿度
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            灵敏度：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" name="sensitivity" class="form-control" id="sensitivity">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            温度最小值：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="number" min="16" max="30" id="minId" class="form-control" name="tempMin">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            温度最大值：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="number" min="16" max="30" id="maxId" class="form-control" name="tempMax">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            模式：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="checkbox" value="0" name="mode" class="icheck">制冷
                                            <input type="checkbox" value="1" name="mode" class="icheck">制热
                                            <input type="checkbox" value="2" name="mode" class="icheck">自动
                                            <input type="checkbox" value="3" name="mode" class="icheck">自然风
                                            <input type="checkbox" value="4" name="mode" class="icheck">除湿
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            风速：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="checkbox" value="0" name="windSpeed" class="icheck">自动
                                            <input type="checkbox" value="1" name="windSpeed" class="icheck">低速
                                            <input type="checkbox" value="2" name="windSpeed" class="icheck">中速
                                            <input type="checkbox" value="3" name="windSpeed" class="icheck">高速
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            扫风：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="radio" name="sweepingWind" value="1" class="icheck">支持
                                            <input type="radio" name="sweepingWind" value="0" class="icheck">不支持
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
                                                    <option value="${province.id!}">${province.name!}</option>
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
                                                    <option value="${city.id!}" ${city.name!?contains("赣州市")?string("selected", "")}>${city
                                                        .name!}</option>
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
                                                    <option value="${region.id!}" code="${region.code!}" ${region.name!?contains("章贡区")?string("selected", "")}>${region
                                                        .name!}</option>
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
                                                    <option value="${govHall.id!}">${govHall.floorName!}-${govHall.name!}</option>
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
                                                <input type="text" class="form-control pull-right" name="purchasingTime" id="purchasingTime"
                                                       readonly onClick="WdatePicker()">
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
                                            <input type="text" class="form-control" name="durableYear" id="durableYear">
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
                                            <input type="text" class="form-control" name="warranty" id="warranty">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="area" id="area" value="${area!}">
                        <input type="hidden" name="info" id="info">
                        <input type="hidden" name="type" value="${govDeviceType.id!}">
                    </form>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
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

        function getArr(name) {
            var arr = [];
            $(':checkbox[name="' + name + '"]:checked').each(function () {
                arr.push(Number($(this).val()));
            });
            return arr;
        }

        //将功能和灵敏度信息转为json字符串并赋值给隐藏域中的info
        function setInfo() {
            var json = {};
            json['sensitivity'] = Number($('#sensitivity').val());
            var arr = [];
            $(':checkbox[name="function"]:checked').each(function () {
                arr.push(Number($(this).val()));
            });
            json['function'] = arr;
            //创建temp对象
            var temp = {};
            temp['min'] = Number($('#minId').val());
            temp['max'] = Number($('#maxId').val());
            json['temp'] = temp;
            json['mode'] = getArr('mode');
            json['windSpeed'] = getArr('windSpeed');
            json['sweepingWind'] = Number($(':radio[name="sweepingWind"]:checked').val());
            var jsonStr = JSON.stringify(json);
            $('#info').val(jsonStr);
        }

        //表单校验
        var validateForm;
        $(function () {
            //新增验证规则
            jQuery.validator.addMethod("gt", function (value) {
                if ($('#maxId').val() != "") {
                    if (value > Number($('#maxId').val())) {
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
            }, "最低温度不能大于最高温度");
            jQuery.validator.addMethod("it", function (value) {
                if ($('#minId').val() != "") {
                    if (value < Number($('#minId').val())) {
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
            }, "最高温度不能小于最低温度");

            validateForm = $("#krtForm").validate({
                rules: {
                    deviceId: {
                        required: true,
                        digits: true,
                    },
                    name: "required",
                    productId: {
                        required: true,
                        digits: true,
                    },
                    mode: {
                        required: true,
                        minlength: 1
                    },
                    windSpeed: {
                        required: true,
                        minlength: 1
                    },
                    sweepingWind: {
                        required: true,
                        minlength: 1
                    },
                    tempMin: {
                        required: true,
                        min: 16,
                        digits: true,
                        gt: true,
                    },
                    tempMax: {
                        required: true,
                        max: 30,
                        digits: true,
                        it: true,
                    },
                    function: {
                        required: true,
                        minlength: 1
                    },
                    sensitivity: {
                        required: true,
                        min: 0
                    },
                },
                messages: {
                    deviceId: {
                        required: "必填",
                        digits: "必须是数字"
                    },
                    name: "required",
                    productId: {
                        required: "必填",
                        digits: "必须是数字"
                    },
                    function: {
                        required: "至少选择一个"
                    },
                    sensitivity: {
                        required: "必填",
                        min: "不能小于0"
                    },
                    mode: {
                        required: "至少选择一个"
                    },
                    windSpeed: {
                        required: "至少选择一个"
                    },
                    sweepingWind: {
                        required: "至少选择一个"
                    },
                    tempMin: {
                        required: "必填",
                        min: "最小值为16",
                        digits: "必须是整数",
                    },
                    tempMax: {
                        required: "必填",
                        max: "最大值为30",
                        digits: "必须是整数",
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

            var file = $("#file").val();
            if (file == '') {
                krt.layer.msg("请先选择码库文件");
                return false;
            }

            setInfo();
            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/device/govDevice/insert",
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

        // 添加品牌
        $("#brand").click(function () {
            krt.layer.open({
                type: 2,
                area: ['900px', '650px'],
                title: "选择品牌",
                maxmin: true, //开启最大化最小化按钮
                content: "${basePath}/device/device/insertBrand",
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var radio = layero.find("iframe")[0].contentWindow.$('input[type="radio"]:checked')[0];
                    $("#brand").val(radio.value);
                    $("#brand").attr("brandId", radio.id);
                    $("#file").val('');
                    top.layer.close(index);
                },
                cancel: function (index) {
                    top.layer.close(index);
                }
            });
        });

        // 添加码库
        $("#file").click(function () {
            var brandName = $("#brand").val();
            if (brandName == '') {
                top.krt.layer.msg("请先选择品牌");
                return;
            }
            krt.layer.open({
                type: 2,
                area: ['900px', '650px'],
                title: "选择码库",
                maxmin: true, //开启最大化最小化按钮
                content: "${basePath}/device/device/insertCodeBank?brandName=" + brandName,
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var radio = layero.find("iframe")[0].contentWindow.$('input[type="radio"]:checked')[0];
                    $("#file").val(radio.value);
                    $("#file").attr("bankId", radio.id);
                    top.layer.close(index);
                },
                cancel: function (index) {
                    top.layer.close(index);
                }
            });
        });

        //设备校验
        function deviceCheck() {
            var type = $('#type').val();

            var deviceId = $('#deviceId').val();
            if (isNaN(deviceId) || deviceId == '') {
                return;
            }

            krt.ajax({
                type: "get",
                url: "${basePath}/gov/device/govDevice/deviceCheck",
                data: {
                    type: type,
                    deviceId: deviceId,
                },
                async: true,
                success: function (rb) {
                    if (rb.code === 500) {
                        $('#machine').val('');
                        krt.layer.msg("设备已存在");
                    }
                }
            });
        }
    </script>
</@footer>

