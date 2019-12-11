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
                                <label for="username" class="control-label ">操作人名称:</label>
                                <input class="form-control" id="username">
                            </div>
                            <div class="form-group">
                                <label for="deviceId" class="control-label ">设备ID:</label>
                                <input class="form-control" id="deviceId">
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
                    url: "${basePath}/gov/operationLog/govOperationLog/list",
                    type: "post",
                    data: function (d) {
                        d.username = $("#username").val();
                        d.deviceId = $("#deviceId").val();
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
                    {title: "用户名", data: "username"},
                    {title: "设备ID", data: "deviceId"},
                    {title: "设备名", data: "deviceName"},
                    {title: "产品ID", data: "productId"},
                    {title: "串口", data: "port"},
                    {title: "操作内容", data: "action"},
                    {title: "用户ID", data: "inserter"},
                    {title: "操作时间", data: "insertTime"}
                ]
            });

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });

        });
    </script>
</@footer>
