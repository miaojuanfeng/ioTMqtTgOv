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
                            <label for="type" class="control-label ">类别：</label>
                            <div class="form-group">
                                <select class="form-control select2" style="width: 120px;" id="type" name="type">
                                    <option value="">==请选择==</option>
                                    <option value="1">预警短信</option>
                                    <option value="2">推送短信</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="staffName" class="control-label ">姓名:</label>
                            <input type="text" id="staffName" name="staffName" placeholder="姓名" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="staffPhone" class="control-label ">手机号:</label>
                            <input type="text" id="staffPhone" name="staffPhone" placeholder="手机号" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="sendTime" class="control-label ">短信发送时间:</label>
                            <input type="text" id="sendTime" name="sendTimeS" placeholder="开始时间" class="form-control" style="width:120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
                            ---
                            <input type="text" id="sendTime" name="sendTimeE" placeholder="结束时间" class="form-control" style="width:120px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
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
                url: "${basePath}/gov/smsLog/govSmsLog/list",
                type: "post",
                data: function (d) {
                    d.type = $("#type").val();
                    d.staffName = $("#staffName").val();
                    d.staffPhone = $("#staffPhone").val();
                    d.sendTimeS = $("#sendTimeS").val();
                    d.sendTimeE = $("#sendTimeE").val();
                    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
                    d.orderType = d.order[0].dir;
                }
            },
            columns: [
                {title: 'id', data: "id", visible: false},
                {
                    title: "类别", data: "type",
                    render: function (data) {
                        if (data == 1){
                            return '<span class="badge bg-red">预警短信</span>';
                        }else if(data == 2){
                            return '<span class="badge bg-green">推送短信</span>';
                        }else{
                            return data;
                        }
                    }
                },
                {title: "短信内容", data: "smsContent", width:"50%" },
                {title: "姓名", data: "staffName"},
                {title: "手机号", data: "staffPhone"},
                {title: "短信发送时间", data: "sendTime"}
            ]
        });

        //搜索
        $("#searchBtn").on('click', function () {
            datatable.ajax.reload();
        });

        //新增
        $("#insertBtn").click(function () {
            top.krt.layer.openDialog("新增短信发送日志", "${basePath}/gov/smsLog/govSmsLog/insert", "1000px", "500px");
        });

        //修改
        $(document).on("click", ".updateBtn", function () {
            var id = $(this).attr("rid");
            top.krt.layer.openDialog("修改短信发送日志", "${basePath}/gov/smsLog/govSmsLog/update?id=" + id, "1000px", "500px");
        });

        //删除
        $(document).on("click", ".deleteBtn", function () {
            var id = $(this).attr("rid");
            krt.layer.confirm("你确定删除吗？", function () {
                krt.ajax({
                    type: "POST",
                    url: "${basePath}/gov/smsLog/govSmsLog/delete",
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
                        url: "${basePath}/gov/smsLog/govSmsLog/deleteByIds",
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