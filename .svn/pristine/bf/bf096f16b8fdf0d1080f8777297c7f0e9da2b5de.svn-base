<#include "/common/layoutList.ftl">
<@header></@header>
<@body class="body-bg-default">
<div class="wrapper">
    <section class="content">
            <!-- 搜索条件区 -->
<#--            <div class="box-search">-->
<#--                <div class="row row-search">-->
<#--                    <div class="col-xs-12">-->
<#--                        <form class="form-inline" action="">-->
<#--            <div class="form-group">-->
<#--                <label for="name" class="control-label ">设备类型名:</label>-->
<#--    <input type="text" id="name" name="name" placeholder="设备类型名" class="form-control">-->
<#--            </div>-->
<#--                            <div class="form-group">-->
<#--                                <div class="text-center">-->
<#--                                    <button type="button" id="searchBtn" class="btn btn-primary btn-sm">-->
<#--                                        <i class="fa fa-search fa-btn"></i>搜索-->
<#--                                    </button>-->
<#--                                </div>-->
<#--                            </div>-->
<#--                        </form>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
        <!-- 列表数据区 -->
        <div class="box">
            <div class="box-body">
                <!-- 工具按钮区 -->
                <div class="table-toolbar" id="table-toolbar">
<#--                    <@shiro.hasPermission name="GovDeviceType:govDeviceType:insert">-->
<#--                        <button title="添加" type="button" id="insertBtn" data-placement="left" data-toggle="tooltip" class="btn btn-success btn-sm">-->
<#--                            <i class="fa fa-plus"></i> 添加-->
<#--                        </button>-->
<#--                    </@shiro.hasPermission>-->
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
            aaSorting:[0,"asc"],
            ajax: {
                url: "${basePath}/gov/device/govDeviceType/list",
                type: "post",
                data: function (d) {
                d.name = $("#name").val();
    d.orderName = krt.util.camel2Underline(d.columns[d.order[0].column].data);
    d.orderType = d.order[0].dir;
                }
            },
            columns: [
    {title: 'id', data: "id",visible:false},
        // {title: '<input type="checkbox" id="checkAll" class="icheck">',
        //     data: "id", class:"td-center", width:"40",orderable: false,
        //     render: function (data) {
        //         return '<input type="checkbox" class="icheck check" value="' + data + '">';
        //     }
        // },
                {title: "设备类型名",data: "name"},
            ]
        });

        //搜索
        // $("#searchBtn").on('click', function () {
        //     datatable.ajax.reload();
        // });

        //新增
        <#--$("#insertBtn").click(function () {-->
        <#--    top.krt.layer.openDialog("新增设备类型","${basePath}/gov/device/govDeviceType/insert","400px","250px");-->
        <#--});-->
    });
</script>
</@footer>
