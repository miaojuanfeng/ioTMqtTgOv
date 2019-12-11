<#include "/common/layoutList.ftl">
<@header>
</@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <section class="content">
            <div class="box-search">
                <div class="row row-search">
                    <div class="col-xs-12">
                        <form class="form-inline" action="">
                            <div class="form-group">
                                <label for="code" class="control-label">策略名称：</label>
                                <input type="text" class="form-control" placeholder="策略名称" id="strategyTypeName">
                            </div>
                            <div class="form-group">
                                <label for="name" class="control-label">策略类型：</label>
                                <div class="form-group">
                                    <select class="form-control select2" id="strategyTypeCode" style="width: 150px;">
                                        <option value="">==全部==</option>
                                        <option value="1">普通手动</option>
                                        <option value="2">定时自动</option>
                                        <option value="3">条件触发</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="control-label">状态：</label>
                                <div class="form-group">
                                    <select class="form-control select2" id="status" style="width: 120px;">
                                        <option value="">==全部==</option>
                                        <option value="1">启用</option>
                                        <option value="0">禁用</option>
                                    </select>
                                </div>
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
            <div class="box">
                <div class="box-body">
                    <div class="table-toolbar" id="table-toolbar">
                        <@shiro.hasPermission name="sys:role:insert">
                            <button title="添加" type="button" id="insertBtn" class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="sys:role:delete">
                            <button title="批量删除" class="btn btn-sm btn-danger" type="button" id="deleteBatchBtn">
                                <i class="fa fa-trash fa-btn"></i>批量删除
                            </button>
                        </@shiro.hasPermission>
                    </div>
                    <table id="datatable" class="table table-bordered table-hover"></table>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</@body>

<@footer>
    <script>
        //定义datatable
        var datatable;
        $(function () {
            //初始化datatable
            datatable = $('#datatable').DataTable({
                order: [[5, 'asc']],
                ajax: {
                    url: "${basePath}/gov/strategy/list",
                    type: "post",
                    data: function (d) {
                        d.strategyTypeName = $("#strategyTypeName").val();
                        d.strategyTypeCode = $("#strategyTypeCode").val();
                        d.status = $("#status").val();
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
                    {title: "策略名称", data: "strategyTypeName"},
                    {title: "策略类型", data: "strategyTypeCode", render: function(data, type, row){
                            if( data == 1 ){
                                return '普通手动执行策略';
                            }else if( data == 2 ){
                                return '定时自动执行策略';
                            }else if( data == 3 ){
                                return '条件触发执行策略';
                            }
                        }
                    },
                    {title: "状态", data: "status", render: function(data, type, row){
                            if( data == 0 ){
                                return '禁用';
                            }else if( data == 1 ){
                                return '启用';
                            }
                        }
                    },
                    {
                        title: "操作", orderable: false,
                        render: function (data, type, row) {
                            var html = '<@shiro.hasPermission name="sys:role:see">'
                                + '<button class="btn btn-xs btn-info seeBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-eye fa-btn"></i>查看'
                                + '</button>'
                                + '</@shiro.hasPermission>';
                                if( row.status == 0 ) {
                                    html += '<@shiro.hasPermission name="sys:role:update">'
                                    + '<button class="btn btn-xs btn-success statusBtn" status="1" rid="' + row.id + '">'
                                    + '<i class="fa fa-eye fa-btn"></i>启用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>'
                                    + '<@shiro.hasPermission name="sys:role:update">'
                                    + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                                    + '<i class="fa fa-edit fa-btn"></i>修改'
                                    + '</button>'
                                    + '</@shiro.hasPermission>'
                                    + '<@shiro.hasPermission name="sys:role:delete">'
                                    + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                                    + '<i class="fa fa-trash fa-btn"></i>删除'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                                }else{
                                    html += '<@shiro.hasPermission name="sys:role:update">'
                                    + '<button class="btn btn-xs btn-success statusBtn" status="0" rid="' + row.id + '">'
                                    + '<i class="fa fa-eye fa-btn"></i>禁用'
                                    + '</button>'
                                    + '</@shiro.hasPermission>';
                                }
                            return html;
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
                top.krt.layer.openDialog("新增策略", "${basePath}/gov/strategy/insert", "400px", "350px");
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("修改策略", "${basePath}/gov/strategy/update?id=" + id, "800px", "550px");
            });

            //状态
            $(document).on("click", ".statusBtn", function () {
                var id = $(this).attr("rid");
                var status = $(this).attr("status");
                var text = "";
                if( status == 1 ){
                    text = "启用";
                }else if( status == 0 ){
                    text = "禁用";
                }
                krt.layer.confirm("你确定"+text+"吗？", function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/gov/strategy/status?id=" + id + "&status=" + status,
                        success: function (rb) {
                            krt.layer.msg(rb.msg);
                            if (rb.code == 200) {
                                krt.table.reloadTable();
                            }
                        }
                    });
                });
            });

            //查看
            $(document).on("click", ".seeBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialogView("查看角色", "${basePath}/gov/strategy/see?id=" + id, "800px", "550px");
            });

            //删除
            $(document).on("click", ".deleteBtn", function () {
                var id = $(this).attr("rid");
                krt.layer.confirm("你确定删除吗？", function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/gov/strategy/delete?id=" + id,
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
                            url: "${basePath}/gov/strategy/deleteByIds",
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

        function  reloadTable () {
            datatable.ajax.reload();
        }
    </script>
</@footer>
