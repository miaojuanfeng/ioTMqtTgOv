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
                                            <span class="form-required">*</span>预警设备类型：
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="radio" name="attrTypeCode" value="switch" class="icheck"
                                                   id="radio1" checked><label for="radio1">开关</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="radio" name="attrTypeCode" value="air_conditioner"
                                                   class="icheck" id="radio2"><label for="radio2">空调</label>
                                        </div>
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
    <script type="text/javascript">
        //提交
        function doSubmit() {
            var attrTypeCode = $("input[name='attrTypeCode']:checked").val();
            var index = krt.layer.getFrameIndex();
            krt.layer.close(index);
            krt.layer.openDialog("添加预警", "${basePath}/gov/warning/govDeviceWarning/insert?attrTypeCode=" + attrTypeCode, "800px", "550px");
        }
    </script>
</@footer>

