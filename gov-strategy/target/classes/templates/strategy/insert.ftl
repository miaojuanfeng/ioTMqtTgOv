<#include "/common/layoutForm.ftl">
<@header></@header>
<@body>
    <div class="wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <form role="form" class="form-horizontal krt-form" id="krtForm">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="code" class="control-label col-sm-4">
                                            <span class="form-required">*</span>请选择策略类型：
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="radio" name="type" value="1" class="icheck" checked="checked"> 普通手动执行策略
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="radio" name="type" value="2" class="icheck"> 定时自动执行策略
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-5">
                                            <input type="radio" name="type" value="3" class="icheck"> 条件触发执行策略
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
        var validateForm;
        $(function () {
            //表单验证
            validateForm = $("#krtForm").validate({
                rules: {
                    name: {
                        remote: {
                            url: "${basePath}/sys/role/checkName",
                            type: "post",
                            dataType: "json",
                            async: false,
                            data: {
                                name: function () {
                                    return $("#name").val();
                                }
                            }
                        }
                    },
                    code: {
                        remote: {
                            url: "${basePath}/sys/role/checkCode",
                            type: "post",
                            dataType: "json",
                            data: {
                                code: function () {
                                    return $("#code").val();
                                }
                            }
                        }
                    },
                },
                messages: {
                    name: {remote: "角色名已存在"},
                    code: {remote: "角色编码已存在"}
                }
            });
        });

        //提交
        function doSubmit() {
            var type = $("input[name='type']:checked").val();
            var index = krt.layer.getFrameIndex();
            krt.layer.close(index);
            switch (type){
                case "1":
                    krt.layer.openDialog("新增策略", "${basePath}/gov/strategy/insertManual", "800px", "550px");
                    break;
                case "2":
                    krt.layer.openDialog("新增策略", "${basePath}/gov/strategy/insertTime", "800px", "550px");
                    break;
                case "3":
                    krt.layer.openDialog("新增策略", "${basePath}/gov/strategy/insertCondition", "800px", "550px");
                    break;
            }
            <#--krt.ajax({-->
                <#--type: "POST",-->
                <#--url: "${basePath}/sys/role/insert",-->
                <#--data: $('#krtForm').serialize(),-->
                <#--validateForm: validateForm,-->
                <#--success: function (rb) {-->
                    <#--krt.layer.msg(rb.msg);-->
                    <#--if (rb.code === 200) {-->
                        <#--var index = krt.layer.getFrameIndex(); //获取窗口索引-->
                        <#--krt.table.reloadTable();-->
                        <#--krt.layer.close(index);-->
                    <#--}-->
                <#--}-->
            <#--});-->
        }
    </script>
</@footer>
