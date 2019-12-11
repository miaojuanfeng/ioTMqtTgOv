<#include "/common/layoutForm.ftl">
<@header></@header>
<style type="text/css">
    .form-horizontal .row {
        margin-right: 0 !important;
    }
</style>
<@body>
    <div class="wrapper">
        <section class="content">
            <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                <div class="box-body">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>温度低于（℃）：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="number" name="tempMin" class="form-control" value="${tempMin!}"
                                   placeholder="温度低于">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>温度高于（℃）：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="number" name="tempMax" class="form-control" value="${tempMax!}"
                                   placeholder="温度高于">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>湿度低于（%rh）：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="number" name="humiMin" class="form-control" value="${humiMin!}"
                                   placeholder="湿度低于">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="name" class="control-label">
                                <span class="form-required">*</span>湿度高于（%rh）：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="number" name="humiMax" class="form-control" value="${humiMax!}"
                                   placeholder="湿度高于">
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </div>
</@body>
<@footer>
    <script src="<%=basePath%>static/plugin/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        var validateForm;
        $(function () {
            validateForm = $("#krtForm").validate({
                rules: {
                    code: {
                        remote: {
                            url: "${basePath}/sys/organ/checkCode",
                            type: "post",
                            dataType: "json",
                            async: false,
                            data: {
                                code: function () {
                                    return $("#code").val();
                                }
                            }
                        }
                    }
                },
                messages: {
                    code: {remote: "机构代码已存在"}
                }
            });

            //机构
            $("#pname,#organTreeBtn").click(function () {
                var url = "${basePath}/sys/organ/organTree";
                krt.layer.open({
                    type: 2,
                    area: ['300px', '450px'],
                    title: "选择机构",
                    maxmin: false,
                    content: "${basePath}/common/treeSelect?url=" + encodeURI(url) + "&sValue=" + $("#pid").val(),
                    btn: ['确定', '取消', '关闭'],
                    yes: function (index, layero) {
                        var tree = layero.find("iframe")[0].contentWindow.tree;
                        var nodes = tree.getSelectedNodes();
                        if (nodes == null || nodes == '') {
                            krt.layer.msg("请选择机构");
                        } else {
                            $("#pname").val(nodes[0].name);
                            $("#pid").val(nodes[0].id);
                            krt.layer.close(index);
                        }
                    },
                    btn2: function () {
                        $("#pname").val("");
                        $("#pid").val("");
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //区域
            $("#regionName,#regionTreeBtn").click(function () {
                var url = "${basePath}/sys/region/regionTree";
                krt.layer.open({
                    type: 2,
                    area: ['300px', '500px'],
                    title: "选择区域",
                    maxmin: false, //开启最大化最小化按钮
                    content: "${basePath}/common/treeSelect?url=" + encodeURI(url) + "&sValue=" + $("#regionId").val(),
                    btn: ['确定', '取消', '关闭'],
                    yes: function (index, layero) {
                        var tree = layero.find("iframe")[0].contentWindow.tree;
                        var nodes = tree.getSelectedNodes();
                        if (nodes == null || nodes == '') {
                            krt.layer.msg("请选择区域");
                        } else {
                            $("#regionName").val(nodes[0].name);
                            $("#regionId").val(nodes[0].id);
                            krt.layer.close(index);
                        }
                    },
                    btn2: function () {
                        $("#regionName").val("");
                        $("#regionId").val("");
                    },
                    cancel: function (index) {
                        krt.layer.close(index);
                    }
                });
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("执行操作", "${basePath}/gov/strategy/device/update/" + id, "780px", "600px");
            });
        });

        //提交
        function doSubmit() {
            krt.ajax({
                type: "POST",
                url: "${basePath}/sys/organ/insert",
                data: $('#krtForm').serialize(),
                validateForm: validateForm,
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        var contentWindow = top.krt.tab.getContentWindow();
                        contentWindow.reloadTable();
                        contentWindow.initTree();
                        krt.layer.close(index);
                    }
                }
            });
        }
    </script>
</@footer>

