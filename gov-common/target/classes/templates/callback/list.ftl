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
                            <label for="url" class="control-label ">回调URL:</label>
                            <input type="text" id="url" name="url" placeholder="模糊搜索" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="status" class="control-label ">回调状态:</label>
                            <div class="form-group">
                                <select id="status" name="status" class="form-control select2">
                                    <option value="">===请选择===</option>
                                    <option value="0">未完成</option>
                                    <option value="1">已完成</option>
                                    <option value="2">超时失败</option>
                                    <option value="3">异常失败</option>
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
                        <div class="form-group">
                            <div class="text-center">
                                <button type="button" id="refreshBtn" class="btn btn-sm bg-orange">
                                    <i class="fa fa-refresh fa-btn"></i>刷新
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
            aaSorting: [5, "desc"],
            aoColumnDefs: [ { "bSortable": false, "aTargets": [1] }] ,
            ajax: {
                url: "${basePath}/access/tCallbackLog/list",
                type: "post",
                data: function (d) {
                    d.url = $("#url").val();
                    d.status = $("#status").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {title: 'id', data: "id", visible: false},
                {
                    title: "#", data: null,
                    className: 'text-center whiteSpace',
                    render: function(data,type,row,meta) {
                        return meta.row + 1 + meta.settings._iDisplayStart;
                    }
                },
                {title: "回调URL", data: "url"},
                {title: "回调参数", data: "data"},
                {
                    title: "回调状态", data: "status",
                    render: function (data, type, row) {
                        if (data == '0') {
                            return '<span class="badge bg-yellow">未完成</span>';
                        }else if (data == '1') {
                            return '<span class="badge bg-green">已完成</span>';
                        }else if (data == '2') {
                            return '<span class="badge bg-red">超时失败</span>';
                        }else if(data == '3') {
                            return '<span class="badge bg-blue">异常失败</span>';
                        }
                    }
                },
                {title: "时间", data: "insertTime"}
            ]
        });
    });

    //搜索
    $("#searchBtn").on('click', function () {
        datatable.ajax.reload();
    });

    //刷新
    $("#refreshBtn").on('click', function () {
        krt.table.reloadTable();
        krt.layer.msg("刷新成功");
    });

</script>
</@footer>
