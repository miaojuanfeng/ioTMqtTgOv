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
                            <label for="strategyName" class="control-label ">策略名称：</label>
                            <input type="text" id="strategyName" name="strategyName" placeholder="模糊搜索" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="pusher" class="control-label ">推送人：</label>
                            <input type="text" id="pusher" name="pusher" placeholder="模糊搜索" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="control-label ">状态：</label>
                            <select name="status" id="status" class="form-control select2">
                                <option value="">请选择</option>
                                <option value="1">启用</option>
                                <option value="0">禁用</option>
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
                    <@shiro.hasPermission name="GovPush:govPush:insert">
                        <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip"
                                class="btn btn-success btn-sm">
                            <i class="fa fa-plus"></i> 添加
                        </button>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="GovPush:govPush:delete">
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
                url: "${basePath}/gov/strategy/govPush/list",
                type: "post",
                data: function (d) {
                    d.strategyName = $("#strategyName").val();
                    d.pusher = $("#pusher").val();
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
                    title: "序号", data : null,
                    render: function(data, type, full, meta){
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {title: "短信模板", data: "smsMode", width:"30%" },
                {title: "策略名称", data: "strategyName"},
                {title: "推送人", data: "pusher"},
                {
                    title: "状态", data: "status",
                    render: function (data) {
                        if (data == 1){
                            return '<span class="badge bg-green">启用</span>';
                        }else {
                            return '<span class="badge bg-red">禁用</span>';
                        }
                    }
                },
                {
                    title: "操作", data: "id", orderable: false,
                    "render": function (data, type, row) {
                        var button = "";
                        if (row.status == 1) {
                            button = '<@shiro.hasPermission name="GovPush:govPush:status">'
                                    + '<button class="btn btn-xs bg-maroon cancelBtn" rid="' + row.id + '" status="0">'
                                    + '<i class="fa fa-close fa-btn"></i>禁用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                        } else {
                            button = '<@shiro.hasPermission name="GovPush:govPush:status">'
                                    + '<button class="btn btn-xs btn-success cancelBtn" rid="' + row.id + '" status="1">'
                                    + '<i class="fa fa-check fa-btn"></i>启用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                        }
                        return ' <@shiro.hasPermission name="GovPush:govPush:update">'
                            + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                            + '<i class="fa fa-edit fa-btn"></i>修改'
                            + '</button>'
                            + '</@shiro.hasPermission>'
                            + button
                            + '<@shiro.hasPermission name="GovPush:govPush:delete">'
                            + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                            + '<i class="fa fa-trash fa-btn"></i>删除'
                            + '</button>'
                            + '</@shiro.hasPermission>'
                            + '<@shiro.hasPermission name="GovPush:govPush:setting">'
                            + '<button class="btn btn-xs btn-info setBtn" rid="' + row.id + '">'
                            + '<i class="fa fa-cog fa-btn"></i>设置'
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
            top.krt.layer.openDialog("新增推送规则设置", "${basePath}/gov/strategy/govPush/insert", "800px", "400px");
        });

        //修改
        $(document).on("click", ".updateBtn", function () {
            var id = $(this).attr("rid");
            top.krt.layer.openDialog("修改推送规则设置", "${basePath}/gov/strategy/govPush/update?id=" + id, "1000px", "500px");
        });

        //设置
        $(document).on("click", ".setBtn", function () {
            var id = $(this).attr("rid");
            top.krt.layer.openDialog("推送规则设置", "${basePath}/gov/strategy/govPush/setting?id=" + id, "1000px", "500px");
        });

        //启用或禁用
        $(document).on("click", ".cancelBtn", function () {
            var id = $(this).attr("rid");
            var status = $(this).attr("status");
            var msg = "";
            if (status == "1"){
                msg = "你确定启用吗？";
            } else {
                msg = "你确定禁用吗？";
            }
            krt.layer.confirm(msg, function () {
                krt.ajax({
                    type: "POST",
                    url: "${basePath}/gov/strategy/govPush/status",
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
                    url: "${basePath}/gov/strategy/govPush/delete",
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
                        url: "${basePath}/gov/strategy/govPush/deleteByIds",
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
