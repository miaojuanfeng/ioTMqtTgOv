<#include "/common/layoutList.ftl">
<@header>
    <style type="text/css">
        #DevPosition{
            height: 30px; width: 30px; background: #f00;
            border: 1px solid #ccc; border-radius: 30px;
            top: 0px; left: 0px; position: relative;
            filter: blur(5px);
        }
        #content{
            padding: 0px;
        }
        #contentDiv{
            height: 600px; width: 1000px;
            background-image: url("${basePath}/dist/img/layout/layout-one-first.png");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
    </style>
</@header>
<@body class="body-bg-default">
    <div class="wrapper">
        <section class="content" id="content">
            <div id="contentDiv">
                <div id="DevPosition"></div>
            </div>
        </section>
        <input type="hidden" id="DeviceId" value="${id}" />
    </div>
</@body>
<@footer>
    <script type="text/javascript">
        // 数据库中存储的位置
        var subX = ${(position.x)!0};
        var subY = ${(position.y)!0};
        // 弹出框的宽高
        var WindowW = $(window).width();
        var WindowH = $(window).height();
        // 点击坐标
        var xx; var yy;

        // 初始化点坐标位置
        SetDevPosition((subX/10000)*WindowW, (subY/10000)*WindowH);

        // 点击事件
        $('#contentDiv').click(function(e) {
            xx = e.originalEvent.x || e.originalEvent.layerX || 0;
            yy = e.originalEvent.y || e.originalEvent.layerY || 0;
            console.log(xx+"===="+yy);

            SetDevPosition(xx, yy);
            subX = xx;
            subY = yy;
            console.log(subX+"===="+subY);
        });

        // 设置图标位置
        function SetDevPosition(xx, yy){
            // 30可变，是一个可调整的差值
            $("#DevPosition").css("top", yy-15);
            $("#DevPosition").css("left", xx-15);
        }

        //提交
        function doSubmit() {
            var id = $("#DeviceId").val();
            var x = parseInt((subX / WindowW)*10000, 10) % 10000;
            var y = parseInt((subY / WindowH)*10000, 10) % 10000;

            krt.ajax({
                type: "POST",
                url: "${basePath}/gov/device/govDevice/position",
                data: {"x":x, "y":y, "id": id},
                success: function (rb) {
                    krt.layer.msg(rb.msg);
                    if (rb.code === 200) {
                        var index = krt.layer.getFrameIndex(); //获取窗口索引
                        krt.table.reloadTable();
                        krt.layer.close(index);
                    }
                }
            });
        }

    </script>
</@footer>
