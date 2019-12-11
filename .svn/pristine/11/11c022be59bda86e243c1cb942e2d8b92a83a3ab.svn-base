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
                                        <input type="text" name="strategyTypeName" class="form-control" value="${deviceStrategy.strategyTypeName!}" required>
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
                                        <#--<input type="radio" name="status" value="1" class="icheck" ${deviceStrategy.status!?contains("1")?string("checked", "")}> 启用-->
                                        <#--<input type="radio" name="status" value="0" class="icheck" ${deviceStrategy.status!?contains("0")?string("checked", "")}> 禁用-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</div>-->
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>管理设备
                                        </label>
                                    </div>
                                    <div class="col-sm-2">
                                        <#--<button title="添加" type="button" id="insertBtn" class="btn btn-success btn-sm">-->
                                            <#--<i class="fa fa-plus"></i> 添加-->
                                        <#--</button>-->
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <table id="datatable" class="table table-bordered table-hover">
                                            <tr>
                                                <th width="30%">设备名称</th>
                                                <th>执行操作</th>
                                            </tr>
                                            <#list deviceStrategyLinkList as deviceStrategyLink>
                                            <tr>
                                                <td>${deviceStrategyLink.deviceName!}</td>
                                                <td>${deviceStrategyLink.actionDetails!}</td>
                                                <#--<input type="hidden" class="deviceId" value="102" />-->
                                                <#--<input type="hidden" class="deviceName" value="test" />-->
                                                <#--<input type="hidden" class="areaName" value="test" />-->
                                                <#--<input type="hidden" class="action" />-->
                                            </tr>
                                            </#list>
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
        });
        
        function getDeviceStrategyLinks() {
            var a = [];
            $(".deviceId").each(function (k, v) {
                var o = {};
                o.deviceId = $(".deviceId").eq(k).val();
                o.deviceName = $(".deviceName").eq(k).val();
                o.action = $(".action").eq(k).val();
                a.push(o);
            })
            $("input[name='deviceStrategyLinks']").val(JSON.stringify(a));
        }
        
        //提交
        function doSubmit() {
            getDeviceStrategyLinks();
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
                        // contentWindow.reloadTable();
                        // contentWindow.initTree();
                        krt.layer.close(index);
                    }
                }
            });
        }
    </script>
</@footer>

