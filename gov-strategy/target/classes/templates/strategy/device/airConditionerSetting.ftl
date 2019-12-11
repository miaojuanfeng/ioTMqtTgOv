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
            <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                <div class="box-body">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="pname" class="control-label">
                                <span class="form-required">*</span>开关机：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="radio" name="onOff" value="0" class="icheck"
                                   <#if onOff=="" || onOff == "0">checked</#if>> 开机
                            <input type="radio" name="onOff" value="1" class="icheck"
                                   <#if onOff == "1">checked</#if>> 关机
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>设定温度（℃）：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <select name="temp" class="form-control" id="temp">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>开启模式
                            </label>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control select2" name="mode" style="width: 100%;" id="mode">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>风速
                            </label>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control select2" name="windSpeed" style="width: 100%;" id="windSpeed">

                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <input type="hidden" value='${deviceInfo!}' id="deviceInfo">
            <input type="hidden" value='${temp!}' id="tempIn">
            <input type="hidden" value='${mode!}' id="modeIn">
            <input type="hidden" value='${windSpeed!}' id="windSpeedIn">
            <input type="hidden" name="type" value="${type!}">
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        //空调设备信息
        $(document).ready(function () {
            var deviceInfo = $('#deviceInfo').val();
            var temp = $('#tempIn').val();
            var mode = $('#modeIn').val();
            var windSpeed = $('#windSpeedIn').val();
            var json = JSON.parse(deviceInfo);
            for (var i = json.temp.min; i <= json.temp.max; i++) {
                if (i == Number(temp)) {
                    $('#temp').append('<option value="' + i + '" selected>' + i + '℃</option>');
                } else {
                    $('#temp').append('<option value="' + i + '">' + i + '℃</option>');
                }
            }
            for (var j = 0; j < json.mode.length; j++) {
                if (json.mode[j] == Number(mode)) {
                    switch (json.mode[j]) {
                        case 0:
                            $('#mode').append('<option value="0" selected>制冷</option>');
                            break;
                        case 1:
                            $('#mode').append('<option value="1" selected>制热</option>');
                            break;
                        case 2:
                            $('#mode').append('<option value="2" selected>自动</option>');
                            break;
                        case 3:
                            $('#mode').append('<option value="3" selected>自然风</option>');
                            break;
                        case 4:
                            $('#mode').append('<option value="4" selected>除湿</option>');
                            break;
                    }
                } else {
                    switch (json.mode[j]) {
                        case 0:
                            $('#mode').append('<option value="0">制冷</option>');
                            break;
                        case 1:
                            $('#mode').append('<option value="1">制热</option>');
                            break;
                        case 2:
                            $('#mode').append('<option value="2">自动</option>');
                            break;
                        case 3:
                            $('#mode').append('<option value="3">自然风</option>');
                            break;
                        case 4:
                            $('#mode').append('<option value="4">除湿</option>');
                            break;
                    }
                }
            }
            for (var k = 0; k < json.windSpeed.length; k++) {
                if (json.windSpeed[k] == Number(windSpeed)) {
                    switch (json.windSpeed[k]) {
                        case 0:
                            $('#windSpeed').append('<option value="0" selected>自动</option>');
                            break;
                        case 1:
                            $('#windSpeed').append('<option value="1" selected>低速</option>');
                            break;
                        case 2:
                            $('#windSpeed').append('<option value="2" selected>中速</option>');
                            break;
                        case 3:
                            $('#windSpeed').append('<option value="3" selected>高速</option>');
                            break;
                    }
                } else {
                    switch (json.windSpeed[k]) {
                        case 0:
                            $('#windSpeed').append('<option value="0">自动</option>');
                            break;
                        case 1:
                            $('#windSpeed').append('<option value="1">低速</option>');
                            break;
                        case 2:
                            $('#windSpeed').append('<option value="2">中速</option>');
                            break;
                        case 3:
                            $('#windSpeed').append('<option value="3">高速</option>');
                            break;
                    }
                }
            }
        });
    </script>
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

            //机构
            $("#pname,#organTreeBtn").click(function () {
                var url = "${basePath}/sys/organ/organTree";
                krt.layer.open({
                    type: 2,
                    area: ['300px', '450px'],
                    title: "选择机构",
                    maxmin: false,
                    content: "${basePath}/common/treeSelect?url=" + encodeURI(url) + "&sValue=" + $("#pid").val(),
                    btn: ['确定', '取消', '关闭'],
                    yes: function (index, layero) {
                        var tree = layero.find("iframe")[0].contentWindow.tree;
                        var nodes = tree.getSelectedNodes();
                        if (nodes == null || nodes == '') {
                            krt.layer.msg("请选择机构");
                        } else {
                            $("#pname").val(nodes[0].name);
                            $("#pid").val(nodes[0].id);
                            krt.layer.close(index);
                        }
                    },
                    btn2: function () {
                        $("#pname").val("");
                        $("#pid").val("");
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //区域
            $("#regionName,#regionTreeBtn").click(function () {
                var url = "${basePath}/sys/region/regionTree";
                krt.layer.open({
                    type: 2,
                    area: ['300px', '500px'],
                    title: "选择区域",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/common/treeSelect?url=" + encodeURI(url) + "&sValue=" + $("#regionId").val(),
                    btn: ['确定', '取消', '关闭'],
                    yes: function (index, layero) {
                        var tree = layero.find("iframe")[0].contentWindow.tree;
                        var nodes = tree.getSelectedNodes();
                        if (nodes == null || nodes == '') {
                            krt.layer.msg("请选择区域");
                        } else {
                            $("#regionName").val(nodes[0].name);
                            $("#regionId").val(nodes[0].id);
                            krt.layer.close(index);
                        }
                    },
                    btn2: function () {
                        $("#regionName").val("");
                        $("#regionId").val("");
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("执行操作", "${basePath}/gov/strategy/device/update/" + id, "780px", "600px");
            });
        });

        //提交
        function doSubmit() {
            krt.ajax({
                type: "POST",
                url: "${basePath}/sys/organ/insert",
                data: $('#krtForm').serialize(),
                validateForm: validateForm,
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        var contentWindow = top.krt.tab.getContentWindow();
                        contentWindow.reloadTable();
                        contentWindow.initTree();
                        krt.layer.close(index);
                    }
                }
            });
        }

    </script>
</@footer>

