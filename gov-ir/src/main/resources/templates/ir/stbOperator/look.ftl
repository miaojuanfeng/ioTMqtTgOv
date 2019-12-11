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
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        运营商名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="operatorName" name="operatorName"
                                               value="${stbOperator.operatorName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        城市代号：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cityCode" name="cityCode"
                                               value="${stbOperator.cityCode!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        城市名称：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="cityName" name="cityName"
                                               value="${stbOperator.cityName!}" readonly class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        状态：
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" id="status" name="status" value="${stbOperator.status!}"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" id="id" value="${stbOperator.id!}">
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
            url: "${basePath}/ir/stbOperator/update",
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

