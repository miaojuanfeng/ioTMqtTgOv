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
                                <label for="name" class="control-label ">设备名:</label>
                                <input type="text" id="name" name="name" placeholder="设备名" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="type" class="control-label ">设备类型:</label>
                                <div class="form-group">
                                    <select class="form-control select2" style="width: 160px" id="type" name="type">
                                        <option value="">==请选择==</option>
                                        <#assign json="${govDeviceTypes!}"?eval />
                                        <#list json as govDeviceType>
                                            <option value="${govDeviceType.id!}">${govDeviceType.name!}</option>
                                        </#list>
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
            <!-- 列表数据区 -->
            <div class="box">
                <div class="box-body">
                    <!-- 工具按钮区 -->
                    <div class="table-toolbar" id="table-toolbar">
                        <@shiro.hasPermission name="GovDevice:govDevice:insert">
                            <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip"
                                    class="btn btn-success btn-sm">
                                <i class="fa fa-plus"></i> 添加
                            </button>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="GovDevice:govDevice:delete">
                            <button class="btn btn-sm btn-danger" id="deleteBatchBtn">
                                <i class="fa fa-trash fa-btn"></i>批量删除
                            </button>
                        </@shiro.hasPermission>
                    </div>
                    <table id="datatable" class="table table-bordered table-hover"></table>
                </div>
            </div>
            <!--隐藏域-->
            <input type="hidden" id="types" value='${govDeviceTypes!}'>
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
                    url: "${basePath}/gov/device/govDevice/list",
                    type: "post",
                    data: function (d) {
                        d.name = $("#name").val();
                        d.type = $("#type").val();
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
                    {title: "设备ID", data: "deviceId"},
                    {
                        title: "串口", data: "port", render: function (data) {
                            switch (data) {
                                case '1':
                                    return '串口一';
                                    break;
                                case '2':
                                    return '串口二';
                                    break;
                                case '3':
                                    return '串口三';
                                    break;
                                case '4':
                                    return '串口四';
                                    break;
                                case '5':
                                    return '串口五';
                                    break;
                                case 'PRINTER':
                                    return '打印机';
                                    break;
                                case 'ELEC_METER':
                                    return '电表';
                                    break;
                                default:
                                    return '';
                                    break;
                            }
                        }
                    },
                    {title: "设备名", data: "name"},
                    {
                        title: "设备类型", data: "type",
                        render: function (data) {
                            var jsonStr = $('#types').val();
                            var types = JSON.parse(jsonStr);
                            var typeArr = [];
                            for (var i = 0; i < types.length; i++) {
                                typeArr.push(types[i].id);
                            }
                            var index = $.inArray(Number(data), typeArr);
                            if (index != -1) {
                                return types[index].name;
                            } else {
                                return '';
                            }
                        }
                    },
                    {
                        title: "操作", data: "id", orderable: false,
                        "render": function (data, type, row) {
                            var html = ' <@shiro.hasPermission name="GovDevice:govDevice:update">'
                                + '<button class="btn btn-xs btn-warning updateBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-edit fa-btn"></i>修改'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="GovDevice:govDevice:update">'
                                + '<button class="btn btn-xs btn-info positionBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-info fa-btn"></i>位置'
                                + '</button>'
                                + '</@shiro.hasPermission>'
                                + '<@shiro.hasPermission name="GovDevice:govDevice:delete">'
                                + '<button class="btn btn-xs btn-danger deleteBtn" rid="' + row.id + '">'
                                + '<i class="fa fa-trash fa-btn"></i>删除'
                                + '</button>'
                                + '</@shiro.hasPermission>';

                            if (row.port=='PRINTER'){
                                html+=' <@shiro.hasPermission name="GovDevice:govDevice:setting">'
                                    + '<button class="btn btn-xs btn-info setBtn" rid="' + row.id + '">'
                                    + '<i class="fa fa-cog fa-btn"></i>设置'
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
                top.krt.layer.openDialog("添加设备", "${basePath}/gov/device/govDevice/chooseType", "350px", "350px");
            });

            //修改
            $(document).on("click", ".updateBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("修改设备", "${basePath}/gov/device/govDevice/update?id=" + id, "1000px", "450px");
            });

            //设置
            $(document).on("click", ".setBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("推送规则设置", "${basePath}/gov/device/govDevice/setting?id=" + id, "1000px", "500px");
            });

            //位置
            $(document).on("click", ".positionBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("设备位置信息", "${basePath}/gov/device/govDevice/position?id=" + id, "1000px", "700px");
            });

            //删除
            $(document).on("click", ".deleteBtn", function () {
                var id = $(this).attr("rid");
                krt.layer.confirm("你确定删除吗？", function () {
                    krt.ajax({
                        type: "POST",
                        url: "${basePath}/gov/device/govDevice/delete",
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
                            url: "${basePath}/gov/device/govDevice/deleteByIds",
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
