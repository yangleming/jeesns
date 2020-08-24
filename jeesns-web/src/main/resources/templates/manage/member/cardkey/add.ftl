<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "生成充值卡密"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/member/cardkey/save" method="post" callback="parentReload">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">生成数量</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="num" name="num" data-type="require,number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">卡密金额</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="money" name="money" data-type="require,double">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">有效期至</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" readonly id="expireTime" name="expireTime" data-type="require" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="background-color: #fff;">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>