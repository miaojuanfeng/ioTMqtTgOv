<#include "/common/layoutList.ftl">
<@header>
</@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <section class="content">
            <div class="box">
                <div class="box-body">
                    <table id="datatable" class="table table-bordered table-hover"></table>
                </div>
            </div>
        </section>
    </div>
</@body>

<@footer>
    <script>
        var datatable;

        $(function () {
            //初始化datatable
            datatable = $('#datatable').DataTable({
                ajax: {
                    url: "${basePath}/gov/strategy/govPushStrategy/list",
                    type: "post",
                    data: function (d) {

                    }
                },
                columns: [
                    {title: 'id', data: "id", visible: false},
                    {
                        title: '<input type="checkbox" id="checkAll" class="icheck">',
                        data: "id", class: "td-center", width: "40", orderable: false,
                        render: function (data, type, row) {
                            return '<input type="checkbox" class="icheck check" value="' + data + '"' +
                                ' name="' + row.strategyTypeName + '" max="' + row.strategyTypeCode + '">';
                        }
                    },
                    {title: "策略名称", data: "strategyTypeName"},
                    {
                        title: "策略类型", data: "strategyTypeCode", render: function (data, type, row) {
                            switch (data) {
                                case 2:
                                    return '定时自动执行策略';
                                case 3:
                                    return '条件触发执行策略';
                                default:
                                    return '';
                            }
                        }
                    },
                    {
                        title: "状态", data: "status", render: function (data, type, row) {
                            if (data == 0) {
                                return '禁用';
                            } else if (data == 1) {
                                return '启用';
                            }
                        }
                    }
                ]
            });

        });
    </script>
</@footer>