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
                                <label for="names" class="control-label ">姓名:</label>
                                <input type="text" id="names" name="names" placeholder="姓名" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="control-label ">性别</label>
                                <select name="sex" class="form-control" id="sex" style="width: 120px">
                                    <option value="">==请选择==</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="personTel" class="control-label ">个人电话:</label>
                                <input type="text" id="personTel" name="personTel" placeholder="个人电话"
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
                </div>
            </div>
            <!-- 列表数据区 -->
            <div class="box">
                <div class="box-body">
                    <!-- 工具按钮区 -->
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
                    url: "${basePath}/gov/staff/pushStaff/list",
                    type: "post",
                    data: function (d) {
                        d.names = $("#names").val();
                        d.sex = $("#sex").val();
                        d.personTel = $("#personTel").val();
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
                            return '<input type="checkbox" class="icheck check" value="' + data + '" name="' + row.names + '" min="' + row.personTel + '">';
                        }
                    },
                    {title: "姓名", data: "names"},
                    {
                        title: "性别", data: "sex",
                        "render": function (data) {
                            if (data == 1) {
                                return '男';
                            } else {
                                return '女';
                            }
                        }
                    },
                    {title: "个人电话", data: "personTel"}
                ]
            });

            //搜索
            $("#searchBtn").on('click', function () {
                datatable.ajax.reload();
            });
        });
    </script>
</@footer>
