<#include "/common/layoutForm.ftl">
<@header></@header>
<style type="text/css">
    .form-horizontal .row {
        margin-right: 0 !important;
    }
</style>
<@body>
    <div class="wrapper">
        <section class="content">
            <form role="form" class="form-horizontal krt-form krt-width-form" id="krtForm">
                <div class="box-body">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="pname" class="control-label">
                                <span class="form-required">*</span>开关：
                            </label>
                        </div>
                        <div class="col-sm-10">
                            <input type="radio" name="onOff" value="1" class="icheck"
                                   <#if onOff=="" || onOff == "1">checked</#if>> 开
                            <input type="radio" name="onOff" value="0" class="icheck"
                                   <#if onOff == "0">checked</#if>> 关
                        </div>
                    </div>
                </div>
            </form>
            <input type="hidden" name="type" value="${type!}">
        </section>
    </div>
</@body>
<@footer>
    <script type="text/javascript">

    </script>
</@footer>