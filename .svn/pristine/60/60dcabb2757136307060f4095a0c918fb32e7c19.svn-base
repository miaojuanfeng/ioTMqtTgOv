<#include "/common/layoutForm.ftl" />
<@header>

</@header>
<@body>
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form role="form" class="form-horizontal krt-form" id="krtForm">
                    <div class="box-body">
                        <!--策略名称-->
                        <div class="row">
                            <div class="form-group">
                                <label for="pushMan" class="control-label col-sm-3"
                                       style="text-align: right;">关联策略：</label>
                                <button title="添加" type="button" id="strategyBtn" data-placement="left"
                                        data-toggle="tooltip"
                                        class="btn btn-success btn-sm">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <table id="strategyTable" class="table table-bordered" hidden
                                       style="margin: 0 auto;width: 80%">
                                    <tr>
                                        <th width="20%">ID</th>
                                        <th width="30%">策略名</th>
                                        <th width="30%">策略类型</th>
                                        <th width="20%">操作</th>
                                    </tr>
                                    <#assign strategyJsonArr="${strategyJsonStr!}"?eval />
                                    <#list strategyJsonArr as strategyJson>
                                        <tr id='strategy${strategyJson.strategyId!}'>
                                            <td>${strategyJson.strategyId!}</td>
                                            <td>${strategyJson.strategyName!}</td>
                                            <td>${strategyJson.strategyTypeName!}</td>
                                            <td>
                                                <button class='btn btn-xs btn-danger strategyDeleteBtn'
                                                        rid='${strategyJson.strategyId!}'><i
                                                            class='fa fa-trash fa-btn'></i>删除
                                                </button>
                                            </td>
                                            <input type="hidden" class='strategyId' value='${strategyJson.strategyId!}'>
                                            <input type="hidden" class='strategyName' value='${strategyJson.strategyName!}'>
                                            <input type="hidden" class='strategyTypeName' value='${strategyJson.strategyTypeName!}'>
                                        </tr>
                                    </#list>
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
                                    <#assign pushManJsonArr="${pushManJsonStr!}"?eval />
                                    <#list pushManJsonArr as pushManJson>
                                        <tr id='pushMan${pushManJson.staffUuid!}'>
                                            <td>${pushManJson.staffUuid!}</td>
                                            <td>${pushManJson.staffName!}</td>
                                            <td>${pushManJson.staffPhone!}</td>
                                            <td>
                                                <button class='btn btn-xs btn-danger pushManDeleteBtn'
                                                        rid='${pushManJson.staffUuid!}'><i
                                                            class='fa fa-trash fa-btn'></i>删除
                                                </button>
                                            </td>
                                            <input type="hidden" class='staffUuid' value='${pushManJson.staffUuid!}'>
                                            <input type="hidden" class='staffName' value='${pushManJson.staffName!}'>
                                            <input type="hidden" class='staffPhone' value='${pushManJson.staffPhone!}'>
                                        </tr>
                                    </#list>
                                </table>
                            </div>
                        </div>
                    </div>
                    <#--隐藏域-->
                    <input type="hidden" name="strategyJsonStr" id="strategyJsonStr"
                           value='${strategyJsonStr!}'>
                    <input type="hidden" name="pushManJsonStr" id="pushManJsonStr"
                           value='${pushManJsonStr!}'>
                    <input type="hidden" name="pushId" id="pushId"
                           value='${pushId!}'>
                </form>
            </div>
        </div>
    </section>
</div>
</@body>

<@footer>
<script type="text/javascript">
    //全局变量
    var pushManIdArr = [];//存储当前保存的推送人员id
    var strategyIdArr = [];//存储当前保存的关联策略id

    //页面加载后执行
    $(document).ready(function () {
        var pushManStr = $('#pushManJsonStr').val();
        var pushManJsonArr = JSON.parse(pushManStr);
        if (pushManJsonArr.length > 0) {
            $('#pushManTable').show();
            for (var i = 0; i < pushManJsonArr.length; i++) {
                pushManIdArr.push(Number(pushManJsonArr[i].staffUuid));
            }
        }

        var strategyStr = $('#strategyJsonStr').val();
        var strategyJsonArr = JSON.parse(strategyStr);
        if (strategyJsonArr.length > 0) {
            $('#strategyTable').show();
            for (var i = 0; i < strategyJsonArr.length; i++) {
                strategyIdArr.push(Number(strategyJsonArr[i].strategyId));
            }
        }
    });

    function getJsonStr() {
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

        var s = [];
        $(".strategyId").each(function (k, v) {
            var o = {};
            o.strategyId = $(".strategyId").eq(k).val();
            o.strategyName = $(".strategyName").eq(k).val();
            o.strategyTypeName = $(".strategyTypeName").eq(k).val();
            s.push(o);
        })
        if (s.length > 0) {
            $("input[name='strategyJsonStr']").val(JSON.stringify(s));
        } else {
            $("input[name='strategyJsonStr']").val("");
        }
    }

    var validateForm;
    $(function () {
        //验证表单
        validateForm = $("#krtForm").validate({});
    });

    //提交
    function doSubmit() {
        getJsonStr();
        var strategyJsonStr=$('#strategyJsonStr').val();
        var pushManJsonStr=$('#pushManJsonStr').val();
        var pushId=$('#pushId').val();
        if (strategyJsonStr==""){
            krt.layer.msg("请关联策略");
            return false;
        }
        if (pushManJsonStr==""){
            krt.layer.msg("请添加推送人");
            return false;
        }
        krt.ajax({
            type: "POST",
            url: "${basePath}/gov/strategy/govPush/setting",
            data: {"strategyJsonStr":strategyJsonStr,"pushManJsonStr":pushManJsonStr,"pushId":pushId},
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
                    if ($.inArray(Number(radio[i].value), pushManIdArr) == -1  && !isNaN(radio[i].value)) {
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

    // 新增关联策略
    $("#strategyBtn").click(function () {
        krt.layer.open({
            type: 2,
            area: ['1000px', '600px'],
            title: "新增关联策略",
            maxmin: true, //开启最大化最小化按钮
            content: "${basePath}/gov/strategy/govPushStrategy/list",
            btn: ['确定', '关闭'],
            yes: function (index, layero) {
                var radio = layero.find("iframe")[0].contentWindow.$('input[type="checkbox"]:checked');
                for (var i = 0; i < radio.length; i++) {
                    var typeName = "";
                    if (radio[i].max == 2) {
                        typeName = '定时自动执行策略';
                    } else if (radio[i].max == 3) {
                        typeName = '条件触发执行策略';
                    }
                    if ($.inArray(Number(radio[i].value), strategyIdArr) == -1 && !isNaN(radio[i].value) ) {
                        strategyIdArr.push(Number(radio[i].value));
                        $("#strategyTable").append("<tr id='strategy" + radio[i].value + "'><td>" + radio[i].value + "</td><td>" + radio[i].name + "</td><td>" + typeName + "</td>" +
                            "<td><button class='btn btn-xs btn-danger strategyDeleteBtn' rid='" + radio[i].value + "'>" +
                            "<i class='fa fa-trash fa-btn'></i>删除</button>" +
                            "</td><input type='hidden' class='strategyId' value='" + radio[i].value + "'><input type='hidden' class='strategyName' value='" + radio[i].name + "'>" +
                            "<input type='hidden' class='strategyTypeName' value='" + typeName + "'></tr>");
                    }
                }
                if (strategyIdArr.length > 0) {
                    $('#strategyTable').show();
                }
                top.layer.close(index);
            },
            cancel: function (index) {
                top.layer.close(index);
            }
        });
    });

    // 关联策略的删除
    $(document).on("click", ".strategyDeleteBtn", function () {
        var strategyId = $(this).attr("rid");
        strategyIdArr.splice($.inArray(Number(strategyId), strategyIdArr), 1);
        $('#strategy' + strategyId).remove();
        if (strategyIdArr.length == 0) {
            $('#strategyTable').hide();
        }
    });
</script>
</@footer>

