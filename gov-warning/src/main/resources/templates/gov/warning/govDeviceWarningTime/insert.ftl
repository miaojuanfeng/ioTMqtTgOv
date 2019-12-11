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
                                <label for="startTime" class="control-label col-md-2">开始时间：</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="startTime" placeholder="00:00"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="endTime" class="control-label col-md-2">结束时间：</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="endTime" placeholder="00:00"/>
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
        //验证表单
        validateForm = $("#krtForm").validate({});

    });

    //提交
    function doSubmit() {
        var index = krt.layer.getFrameIndex(); //获取窗口索引
        krt.table.reloadTable();
        krt.layer.close(index);
    }

</script>
</@footer>

