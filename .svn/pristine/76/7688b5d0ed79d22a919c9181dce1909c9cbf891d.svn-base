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
                                <input type="text" id="name" name="name" placeholder="设备名"
                                       class="form-control">
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
                    <input type="hidden" value="${type!}" id="type">
                </div>
            </div>
            <!-- 列表数据区 -->
            <div class="box">
                <div class="box-body">
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
                    url: "${basePath}/gov/warning/govDevice/list",
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
                        render: function (data, type, row) {
                            return '<input type="checkbox" class="icheck check" value="' + data + '" ' +
                                '  name="' + row.name + '">';
                        }
                    },
                    {title: "设备ID", data: "deviceId"},
                    {title: "设备名", data: "name"},
                    {title: "添加时间", data: "insertTime"},
                ]
            });

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });


            //查看
            $(document).on("click", ".seeBtn", function () {
                var id = $(this).attr("rid");
                top.krt.layer.openDialog("查看设备信息", "${basePath}/gov/warning/govDevice/see?id=" + id, "1000px", "500px");
            });
        });

    </script>
</@footer>
