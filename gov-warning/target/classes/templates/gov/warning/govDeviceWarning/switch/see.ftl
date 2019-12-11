<#include "/common/layoutForm.ftl">
<@header></@header>
<style type="text/css" xmlns="http://www.w3.org/1999/html">
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
                                    <label for="pname" class="control-label col-sm-3">开关：</label>
                                    <div class="col-sm-8">
                                        <input type="radio" name="power" class="icheck" value="1"
                                               <#if "${govDevWarn.power!}"=="1">checked</#if> >开
                                        <input type="radio" name="power" class="icheck" value="0"
                                               <#if "${govDevWarn.power!}"=="0">checked</#if> >关
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">
                                        短信模板：
                                    </label>
                                    <div class="col-sm-8">
                                        <textarea rows="4" name="smsMode"
                                                  class="form-control">${govDevWarn.smsMode!}</textarea>
                                        <span style="color: red">短信模板规则：${r'${name}'}:表示设备名,${r'${power}'}:表示开关状态</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">预警时间：</label>
                                    <div class="col-sm-8">
                                        <input type="checkbox" name="week" class="icheck" value="2" ${govDevWarn.week?contains("2")?string("checked", "")} required>周一&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="3" ${govDevWarn.week?contains("3")?string("checked", "")} required>周二&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="4" ${govDevWarn.week?contains("4")?string("checked", "")} required>周三&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="5" ${govDevWarn.week?contains("5")?string("checked", "")} required>周四&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="6" ${govDevWarn.week?contains("6")?string("checked", "")} required>周五&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="7" ${govDevWarn.week?contains("7")?string("checked", "")} required>周六&nbsp;&nbsp;
                                        <input type="checkbox" name="week" class="icheck" value="1" ${govDevWarn.week?contains("1")?string("checked", "")} required>周日
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">节假日预警：</label>
                                    <div class="col-sm-8">
                                        <input type="radio" name="isHoliday" class="icheck" value="1"
                                               <#if "${govDevWarn.isHoliday}"=="1">checked</#if> >是
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isHoliday" class="icheck" value="0"
                                               <#if "${govDevWarn.isHoliday}"=="0">checked</#if> >否
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isHoliday" class="icheck" value="2"
                                               <#if "${govDevWarn.isHoliday}"=="2">checked</#if> >仅节假日执行
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-3">状态：</label>
                                    <div class="col-sm-8">
                                        <input type="radio" name="status" class="icheck" value="1"
                                               <#if "${govDevWarn.status}"=="1">checked</#if> >启用
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="status" class="icheck" value="0"
                                               <#if "${govDevWarn.status}"=="0">checked</#if> >禁用
                                    </div>
                                </div>
                            </div>
                            <#--隐藏域-->
                            <input type="hidden" name="id" value="${govDevWarn.id!}">
                            <input type="hidden" name="attrTypeCode" value="term_appli_equip">
                            <input type="hidden" name="attrTypeName" value="终端应用设备">
                            <input type="hidden" name="linkDeviceJsonStr" id="linkDeviceJsonStr"
                                   value='${govDevWarn.linkDeviceJsonStr!}'>
                            <input type="hidden" name="pushManJsonStr" id="pushManJsonStr"
                                   value='${govDevWarn.pushManJsonStr!}'>
                        </form>
                        <form id="linkDeviceForm">
                            <div class="row">
                                <div class="form-group">
                                    <label for="linkDevice" class="control-label col-sm-3" style="text-align: right;">关联设备：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <table id="deviceTable" class="table table-bordered"
                                           style="margin: 0 auto;width: 80%" hidden>
                                        <tr>
                                            <th width="33%">ID</th>
                                            <th width="33%">设备名称</th>
                                        </tr>
                                        <#assign deviceJsonArr="${govDevWarn.linkDeviceJsonStr!}"?eval />
                                        <#list deviceJsonArr as deviceJson>
                                            <tr id='device${deviceJson.deviceId!}'>
                                                <td>${deviceJson.deviceId!}</td>
                                                <td>${deviceJson.deviceName!}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                </div>
                            </div>
                        </form>
                        <form id="pushManForm">
                            <div class="row">
                                <div class="form-group">
                                    <label for="pushMan" class="control-label col-sm-3"
                                           style="text-align: right;">推送人：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <table id="pushManTable" class="table table-bordered" hidden
                                           style="margin: 0 auto;width: 80%">
                                        <tr>
                                            <th width="10%">ID</th>
                                            <th width="20%">姓名</th>
                                            <th width="30%">手机号码</th>
                                        </tr>
                                        <#assign pushManJsonArr="${govDevWarn.pushManJsonStr!}"?eval />
                                        <#list pushManJsonArr as pushManJson>
                                            <tr id='pushMan${pushManJson.staffUuid!}'>
                                                <td>${pushManJson.staffUuid!}</td>
                                                <td>${pushManJson.staffName!}</td>
                                                <td>${pushManJson.staffPhone!}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                </div>
                            </div>
                        </form>
                        <form id="timeForm">
                            <div class="row">
                                <div class="form-group">
                                    <label for="time" class="control-label col-sm-3"
                                           style="text-align: right;">预警时间：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <table id="timeTable" class="table table-bordered"
                                           style="margin: 0 auto;width: 80%">
                                        <tr>
                                            <th width="20%">开始时间</th>
                                            <th width="30%">结束时间</th>
                                        </tr>
                                        <#list govTimes as govTime>
                                            <tr>
                                                <td>${govTime.sTime!}</td>
                                                <td>${govTime.fTime!}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                </div>
                            </div>
                        </form>
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
        var timeLength;//存储当前保存的预警时间条数

        //页面加载后执行
        $(document).ready(function () {
            var deviceStr = $('#linkDeviceJsonStr').val();
            var deviceJsonArr = JSON.parse(deviceStr);
            if (deviceJsonArr.length > 0) {
                $('#deviceTable').show();
                for (var i = 0; i < deviceJsonArr.length; i++) {
                    deviceIdArr.push(Number(deviceJsonArr[i].deviceId));
                }
            }

            var pushManStr = $('#pushManJsonStr').val();
            var pushManJsonArr = JSON.parse(pushManStr);
            if (pushManJsonArr.length > 0) {
                $('#pushManTable').show();
                for (var i = 0; i < pushManJsonArr.length; i++) {
                    pushManIdArr.push(Number(pushManJsonArr[i].staffUuid));
                }
            }
        });
    </script>
</@footer>