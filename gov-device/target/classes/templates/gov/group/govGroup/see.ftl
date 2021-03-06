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
                                    <label for="deviceGroup" class="control-label col-sm-3"
                                           style="text-align: right;">分组内的设备：</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <table id="deviceGroupTable" class="table table-bordered"
                                           style="margin: 0 auto;width: 80%">
                                        <tr>
                                            <th width="30%">设备ID</th>
                                            <th width="30%">设备名</th>
                                            <th width="30%">串口</th>
                                        </tr>
                                        <#list govDeviceList as device>
                                            <tr>
                                                <td>${device.deviceId!}</td>
                                                <td>${device.name!}</td>
                                                <td>${device.port!}</td>
                                            </tr>
                                        </#list>
                                    </table>
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

    </script>
</@footer>

