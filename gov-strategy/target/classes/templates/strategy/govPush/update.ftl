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
                            <div class="form-group">
                                <label for="pname" class="control-label col-md-2">短信模板：</label>
                                <div class="col-md-8">
                                    <textarea rows="4" name="smsMode" class="form-control">${govPush.smsMode!}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="pname" class="control-label col-md-2">状态：</label>
                                <div class="col-md-8">
                                    <#if govPush.status == 1>
                                        <input type="radio" name="status" class="icheck" checked value="1">启用 &nbsp;&nbsp;
                                        <input type="radio" name="status" class="icheck" value="2">禁用
                                    <#else>
                                        <input type="radio" name="status" class="icheck" value="1">启用 &nbsp;&nbsp;
                                        <input type="radio" name="status" class="icheck" checked value="2">禁用
                                    </#if>

                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" value="${govPush.id!}">
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

    //提交
    function doSubmit() {
        krt.ajax({
            type: "POST",
            url: "${basePath}/gov/strategy/govPush/update",
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
</script>
</@footer>
