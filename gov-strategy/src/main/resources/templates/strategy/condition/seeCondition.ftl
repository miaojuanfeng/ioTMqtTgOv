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
                                        <input type="text" name="strategyTypeName" class="form-control"
                                               value="${deviceStrategy.strategyTypeName!}" required>
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
                                        <#list deviceStrategyTimes as deviceStrategyTime>
                                            <p>
                                                开始时间<input type="text" class="form-control input-150 Wdate startTime"
                                                           onfocus="WdatePicker({dateFmt:'HH:mm'})" required
                                                           value="${deviceStrategyTime.sTime!}"/>
                                                结束时间<input type="text" class="form-control input-150 Wdate endTime"
                                                           onfocus="WdatePicker({dateFmt:'HH:mm'})" required
                                                           value="${deviceStrategyTime.eTime!}"/>
                                            </p>
                                        </#list>
                                    </div>
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
                                        <#--<input name="week" value="${week_index}" type="checkbox" class="icheck" ${deviceStrategy.week?contains(week_index)?string("checked", "")} required> ${week}-->
                                        <#--</#list>-->
                                        <input name="week" value="2" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("2")?string("checked", "")}
                                               required> 周一
                                        <input name="week" value="3" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("3")?string("checked", "")}
                                               required> 周二
                                        <input name="week" value="4" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("4")?string("checked", "")}
                                               required> 周三
                                        <input name="week" value="5" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("5")?string("checked", "")}
                                               required> 周四
                                        <input name="week" value="6" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("6")?string("checked", "")}
                                               required> 周五
                                        <input name="week" value="7" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("7")?string("checked", "")}
                                               required> 周六
                                        <input name="week" value="1" type="checkbox"
                                               class="icheck" ${deviceStrategy.week?contains("1")?string("checked", "")}
                                               required> 周日
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
                                        <input type="radio" name="isHoliday" value="1" class="icheck" ${deviceStrategy.isHoliday!?contains("1")?string("checked", "")}> 节假日+工作日
                                        <input type="radio" name="isHoliday" value="2" class="icheck" ${deviceStrategy.isHoliday!?contains("2")?string("checked", "")}> 仅工作日
                                        <input type="radio" name="isHoliday" value="3" class="icheck" ${deviceStrategy.isHoliday!?contains("3")?string("checked", "")}> 仅节假日
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
                            <#--<input type="radio" name="status" value="1" class="icheck" ${deviceStrategy.status!?contains("1")?string("checked", "")}> 启用-->
                            <#--<input type="radio" name="status" value="0" class="icheck" ${deviceStrategy.status!?contains("0")?string("checked", "")}> 禁用-->
                            <#--</div>-->
                            <#--</div>-->
                            <#--</div>-->
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label for="name" class="control-label">
                                            <span class="form-required">*</span>前置条件
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <table id="conditiontable" class="table table-bordered table-hover">
                                            <tr>
                                                <th width="30%">设备名称</th>
                                                <th>设定条件</th>
                                            </tr>
                                            <#list deviceStrategyRequireList as deviceStrategyRequire>
                                                <tr>
                                                    <td>${deviceStrategyRequire.deviceName!}</td>
                                                    <td>${deviceStrategyRequire.requiresDetails!}</td>
                                                </tr>
                                            </#list>
                                        </table>
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

