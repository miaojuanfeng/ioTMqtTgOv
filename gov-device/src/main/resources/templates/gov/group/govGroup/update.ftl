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
                                            组名：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="groupName" name="groupName" value="${govGroup.groupName!}" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            图标url：
                                        </label>
                                        <div class="col-sm-8">
                                            <input type="text" id="icon" name="icon" class="form-control" value="${govGroup.icon!}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <@shiro.hasRole name="admin">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="pname" class="control-label col-sm-4">
                                            是否允许修改删除分组：
                                        </label>
                                        <div class="col-sm-8">
                                            <select class="form-control" name="modifiable">
                                                <option value="0" ${govGroup.modifiable!?contains("0")?string("selected", "")}>禁止</option>
                                                <option value="1" ${govGroup.modifiable!?contains("1")?string("selected", "")}>允许</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </@shiro.hasRole>
                        </div>
                        <!-- 隐藏域 -->
                        <input type="hidden" name="id" id="id" value="${govGroup.id!}">
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
                url: "${basePath}/gov/group/govGroup/update",
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

