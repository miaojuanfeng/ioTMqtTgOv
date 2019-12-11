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
                                <div class="col-md-6">
                                    <textarea rows="3" name="smsMode" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="pname" class="control-label col-md-2">状态：</label>
                                <div class="col-md-6">
                                    <input type="radio" name="status" class="icheck" value="1">启用 &nbsp;&nbsp;
                                    <input type="radio" name="status" class="icheck" value="2" checked>禁用
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" id="id">
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
            url: "${basePath}/gov/strategy/govPush/insert",
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
