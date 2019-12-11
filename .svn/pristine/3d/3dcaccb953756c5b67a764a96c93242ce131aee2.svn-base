<#include "/common/layoutForm.ftl" />
<@header>

</@header>
<@body>
    <div class="wrapper">
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                        热敏打印机初始化：
                                    </label>
                                    <div class="col-sm-8">
                                        <input class="form-control"
                                               <#if (govDevice.disEmpty)?? && (govDevice.disFull)?? && (govDevice.disFull<govDevice
                                               .disEmpty)>value="初始化完成" <#else >value="未初始化"</#if> readonly id="printerStatus">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                    </label>
                                    <div class="col-sm-8">
                                        <button type="button" class="btn btn-warning btn-sm" onclick="PaperInitialization(${govDevice.id!},2)
                                                ">重新初始化
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                    </label>
                                    <div class="col-sm-8">
                                        <button type="button" id="emptyPaper" <#if (govDevice.disEmpty)??>hidden</#if> class="btn btn-info btn-sm"
                                                onclick="PaperInitialization
                                                        (${govDevice.id!},0)
                                                        ">安装空纸初始化
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="pname" class="control-label col-sm-4">
                                    </label>
                                    <div class="col-sm-8">
                                        <button type="button" id="fullPaper" <#if (govDevice.disFull)??>hidden</#if> class="btn btn-info btn-sm"
                                                onclick="PaperInitialization
                                                        (${govDevice.id!},1)
                                                        ">安装满纸初始化
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#--隐藏域-->
                        <input type="hidden" id="disEmpty" value="${govDevice.disEmpty!}">
                        <input type="hidden" id="disFull" value="${govDevice.disFull!}">
                    </div>
                </div>
            </div>
        </section>
    </div>
</@body>

<@footer>
    <script type="text/javascript">
        //页面加载后
        $(document).ready(function () {
            var disEmpty = $('#disEmpty').val();
            var disFull = $('#disFull').val();

            if (disFull != '') {
                $('#fullPaper').hide();
            } else {
                $('#fullPaper').show();
            }

            if (disEmpty != '') {
                $('#emptyPaper').hide();
            } else {
                $('#emptyPaper').show();
            }

            if (disEmpty != '' && disFull != '' && Number(disFull) < Number(disEmpty)) {
                $('#printerStatus').val('初始化完成');
            } else {
                $('#printerStatus').val('未初始化');
            }
        });

        //空纸初始化
        function PaperInitialization(id, flat) {
            krt.ajax({
                type: "get",
                url: "${basePath}/gov/device/govDevice/paperInitialization",
                data: {
                    id: id,
                    flat: flat,
                },
                success: function (rb) {
                    var code = rb.code;
                    if (code === 200) {
                        var data = rb.data;
                        if (data.disFull != '') {
                            $('#fullPaper').hide();
                        } else {
                            $('#fullPaper').show();
                        }

                        if (data.disEmpty != '') {
                            $('#emptyPaper').hide();
                        } else {
                            $('#emptyPaper').show();
                        }

                        if (data.disEmpty != '' && data.disFull != '' && data.disFull < data.disEmpty) {
                            $('#printerStatus').val('初始化完成');
                        } else {
                            $('#printerStatus').val('未初始化');
                        }
                    }
                }
            });
        }
    </script>
</@footer>

