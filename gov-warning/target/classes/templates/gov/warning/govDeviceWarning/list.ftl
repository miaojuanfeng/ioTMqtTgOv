<#include "/common/layoutList.ftl">
<@header></@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <section class="content">
            <!-- 搜索条件区 -->
            <div class="box-search">
                <div class="row row-search">
                    <div class="col-xs-12">
                        <form class="form-inline" action="">
                            <div class="form-group">
                                <label for="attrTypeCode" class="control-label ">预警设备类型:</label>
                                <div class="form-group">
                                    <select class="form-control select2" style="width: 120px" id="attrTypeCode"
                                            name="attrTypeCode">
                                        <option value="">==请选择==</option>
                                        <option value="switch">开关</option>
                                        <option value="air_conditioner">空调</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label ">状态：</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="">==请选择==</option>
                                    <option value="1">启用</option>
                                    <option value="2">禁用</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="text-center">
                                    <button type="button" id="searchBtn" class="btn btn-primary btn-sm">
                                        <i class="fa fa-search fa-btn"></i>搜索
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 列表数据区 -->
            <div class="box">
                <div class="box-body">
                    <!-- 工具按钮区 -->
                    <div class="table-toolbar" id="table-toolbar">
                        <@shiro.hasPermission name="warnRule:govDeviceWarning:insert">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip"
                                    class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="warnRule:govDeviceWarning:delete">
                            <button class="btn btn-sm btn-danger" id="deleteBatchBtn">
                                <i class="fa fa-trash fa-btn"></i>批量删除
                            </button>
                        </@shiro.hasPermission>
                    </div>
                    <table id="datatable" class="table table-bordered table-hover"></table>
                </div>
            </div>
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        var datatable;

        $(function () {
            //初始化datatable
            datatable = $('#datatable').DataTable({
                ajax: {
                    url: "${basePath}/gov/warning/govDeviceWarning/list",
                    type: "post",
                    data: function (d) {
                        d.attrTypeCode = $("#attrTypeCode").val();
                        d.warningTypeCode = $("#warningTypeCode").val();
                        d.pushMan = $("#pushMan").val();
                        d.status = $("#status").val();
                        d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                        d.orderType = d.order[0].dir;
                    }
                },
                columns: [
                    {title: 'id', data: "id", visible: false},
                    {
                        title: '<input type="checkbox" id="checkAll" class="icheck">',
                        data: "id", class: "td-center", width: "40", orderable: false,
                        render: function (data) {
                            return '<input type="checkbox" class="icheck check" value="' + data + '">';
                        }
                    },
                    {
                        title: "序号", data: null,
                        render: function (data, type, full, meta) {
                            return meta.row + 1 + meta.settings._iDisplayStart;
                        }
                    },
                    {title: "属性类型名", data: "attrTypeName"},
                    {title: "短信模板", data: "smsMode", width: "40%"},
                    {
                        title: "状态", data: "status",
                        render: function (data) {
                            if (data == 1) {
                                return '<span class="badge bg-green">启用</span>';
                            } else {
                                return '<span class="badge bg-red">禁用</span>';
                            }
                        }
                    },
                    {
                        title: "操作",
                        data: "id",
                        orderable: false,

                        render: function (data, type, row) {
                            var button = "";
                            if (row.status == 1) {
                                button = '<@shiro.hasPermission name="warnRule:govDeviceWarning:status">'
                                    + '<button class="btn btn-xs bg-maroon cancelBtn" rid="' + row.id + '" status="0">'
                                    + '<i class="fa fa-close fa-btn"></i>禁用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                            } else {
                                button = '<@shiro.hasPermission name="warnRule:govDeviceWarning:status">'
                                    + '<button class="btn btn-xs btn-success cancelBtn" rid="' + row.id + '" status="1">'
                                    + '<i class="fa fa-check fa-btn"></i>启用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                            }
                            return '<@shiro.hasPermission name="warnRule:govDeviceWarning:see">'
                                + '<button class="btn btn-xs btn-info seeBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-eye fa-btn"></i>查看'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="warnRule:govDeviceWarning:update">'
                                + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-edit fa-btn"></i>修改'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + button
                                + '<@shiro.hasPermission name="warnRule:govDeviceWarning:delete">'
                                + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-trash fa-btn"></i>删除'
                                + '</button>'
                                + '</@shiro.hasPermission>';
                        }
                    }
                ]
            });

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });

            //新增
            $("#insertBtn").click(function () {
                top.krt.layer.openDialog("新增设备预警", "${basePath}/gov/warning/govDeviceWarning/chooseAttrType", "400px", "350px");
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("修改设备预警设置", "${basePath}/gov/warning/govDeviceWarning/update?id=" + id, "800px", "650px");
            });

            //查看
            $(document).on("click", ".seeBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialogView("预警规则查看", "${basePath}/gov/warning/govDeviceWarning/see?id=" + id, "1000px", "500px");
            });

            //启用或禁用
            $(document).on("click", ".cancelBtn", function () {
                var id = $(this).attr("rid");
                var status = $(this).attr("status");
                var msg = "";
                if (status == "1") {
                    msg = "你确定启用吗？";
                } else {
                    msg = "你确定禁用吗？";
                }
                krt.layer.confirm(msg, function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/gov/warning/govDeviceWarning/status",
                        data: {"status": status, "id": id},
                        success: function (rb) {
                            krt.layer.msg(rb.msg);
                            if (rb.code == 200) {
                                krt.table.reloadTable();
                            }
                        }
                    });
                });

            });

            //删除
            $(document).on("click", ".deleteBtn", function () {
                var id = $(this).attr("rid");
                krt.layer.confirm("你确定删除吗？", function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/gov/warning/govDeviceWarning/delete",
                        data: {"id": id},
                        success: function (rb) {
                            krt.layer.msg(rb.msg);
                            if (rb.code == 200) {
                                krt.table.reloadTable();
                            }
                        }
                    });
                });
            });

            //批量删除
            $("#deleteBatchBtn").click(function () {
                var ids = getIds();
                if (ids == "") {
                    krt.layer.error("请选择要删除的数据!");
                    return false;
                } else {
                    krt.layer.confirm("你确定删除吗？", function () {
                        krt.ajax({
                            type: "POST",
                            url: "${basePath}/gov/warning/govDeviceWarning/deleteByIds",
                            data: {"ids": ids},
                            success: function (rb) {
                                krt.layer.msg(rb.msg);
                                if (rb.code == 200) {
                                    krt.table.reloadTable(ids);
                                }
                            }
                        });
                    });
                }
            });
        });

    </script>
</@footer>
