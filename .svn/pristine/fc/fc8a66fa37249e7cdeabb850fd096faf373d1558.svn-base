<#include "/common/layoutForm.ftl">
<@header></@header>
<@body>
    <div class="wrapper" xmlns="http://www.w3.org/1999/html">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form role="form" class="form-horizontal krt-form" id="krtForm">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="code" class="control-label col-sm-4">
                                            <span class="form-required">*</span>请选择设备类型：
                                        </label>
                                    </div>
                                    <#list govDeviceTypes as govDeviceType>
                                        <div class="form-group">
                                            <div class="col-sm-5">
                                                <input type="radio" name="type" value="${govDeviceType.id!}" class="icheck" <#if "${govDeviceType_index}"=="0">checked</#if> id="radio${govDeviceType_index}"><label for="radio${govDeviceType_index}">${govDeviceType.name!}</label>
                                            </div>
                                        </div>
                                    </#list>
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
        //提交
        function doSubmit() {
            var type = $("input[name='type']:checked").val();
            var typeName=$("input[name='type']:checked").parent().next().text();
            var index = krt.layer.getFrameIndex();
            krt.layer.close(index);
            krt.layer.openDialog("添加"+typeName+"设备", "${basePath}/gov/device/govDevice/insert?id="+type+"&name="+typeName, "800px", "450px");
        }
    </script>
</@footer>


