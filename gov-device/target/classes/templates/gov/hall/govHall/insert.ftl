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
                                            大厅名称：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            楼层：
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control select2" style="width: 100%" id="floorCode" name="floorCode">
                                                <#list hallList as item>
                                                    <option value="${item.code}">${item.name}</option>
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
                                            布局图url：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="layout" name="layout" class="form-control">
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
                                                        <option value="${province.id!}" ${province.name!?contains("江西省")?string("selected", "")}>${province
                                                            .name!}</option>
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
                                                        <option value="${region.id!}"
                                                                code="${region.code!}" ${region.name!?contains("章贡区")?string("selected",
                                                        "")
                                                        }>${region
                                                            .name!}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </@shiro.hasRole>
                            </div>
                            <!-- 隐藏域 -->
                            <input type="hidden" name="floorName" id="floorName" value="">
                            <input type="hidden" name="area" id="area">
                            <input type="hidden" name="isAdmin" id="isAdmin" value="${isAdmin!}">
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
            //验证表单
            validateForm = $("#krtForm").validate({});

        });

        function getFloorName() {
            var floorName =$("#floorCode option:selected").text();
            $('#floorName').val(floorName);
        }

        //提交
        function doSubmit() {
            //设备区域校验
            if ($('#area').val() == "") {
                krt.layer.msg("请选择设备区域");
                return false;
            }

            getFloorName();
            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/hall/govHall/insert",
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
    </script>
</@footer>

