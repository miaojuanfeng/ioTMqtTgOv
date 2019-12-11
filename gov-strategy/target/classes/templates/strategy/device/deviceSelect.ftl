<#include "/common/layoutList.ftl">
<@header></@header>
<@body>
<section class="content">
    <!-- 参数 -->
    <input type="hidden" id="sId" value="${RequestParameters['sId']!}"/>
    <input type="hidden" id="sName" value="${RequestParameters['sName']!}"/>
    <!-- 搜索条件区 -->
    <!--div class="search" id="search">
        <div class="panel-body">
            <form class="form-inline" action="">
                <div class="col-xs-4">
                    <input type="text" class="form-control" placeholder="策略名称" id="strategyTypeName">
                </div>
                <div class="col-xs-3">
                    <select class="form-control select2" id="strategyTypeCode" style="width: 100%;">
                        <option value="">==全部==</option>
                        <option value="1">普通手动</option>
                        <option value="2">定时自动</option>
                        <option value="3">条件触发</option>
                    </select>
                </div>
                <div class="col-xs-3">
                    <select class="form-control select2" id="status" style="width: 100%;">
                        <option value="">==全部==</option>
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </div>
                <div class="col-xs-2">
                    <div class="text-center">
                        <button type="button" id="searchBtn" class="btn btn-primary btn-sm">
                            <i class="fa fa-search fa-btn"></i>搜索
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div-->
    <!-- 列表数据区 -->
    <div class="box-krt">
        <div class="box-body">
            <div class="table-responsive">
                <table id="datatable" class="table table-striped table-hover table-krt">
                </table>
            </div>
        </div>
    </div>
</section>
</@body>
<@footer>
<!-- ./wrapper -->
<!-- page script -->
<script type="text/javascript">
    var datatable;
    function initDatatable() {
        datatable = $('#datatable').DataTable({
            "order": [0, 'desc'],
            "ajax": {
                "url": "${basePath}/gov/strategy/device/select",
                "type": "post",
                "data": function (d) {
                d.name = $("#name").val();
                // d.type = 1;//部门
                d.isRespeople = 1;
                d.orderType = d.order[0].dir;
                }
            },
            "columns": [
                {
                    "title": "序号",
                    "data": "name",
                    "render" : function(data, type, full, meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {
                    "title": "设备ID",
                    "data": "deviceId"
                },
                {
                    "title": "设备名称",
                    "data": "name"
                },
                {
                    "title": "操作",
                    "data": "id",
                    "orderable": false,
                    "render": function (data, type, row) {
                        var checked = "";
                        var sId = "," + $("#sId").val() + ",";
                        var id = "," + row.id + ",";
                        if (sId.indexOf(id) > -1) {
                            checked = "checked";
                        }
                        return '<input type="checkbox" ' + checked + ' class="iCheck cCheck" value="' + data + '" rname="' + row.name + '" rid="' + row.id + '">';
                    }
                }
            ],
            "fnDrawCallback": function () {
                //多选
                cCheck2();
            }
        });
    }

    $(function () {

        //初始化datatable
        initDatatable();

        $("#searchBtn").on('click', function () {
            $("#names").val("");
            $("#ids").val("");
            $("#checkAll").iCheck('uncheck');
            datatable.ajax.reload();
        });
    })
</script>
</@footer>
