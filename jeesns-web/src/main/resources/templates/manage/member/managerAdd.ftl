<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "授权管理员"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/member/managerAdd" method="post" callback="parentReload">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">会员用户名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" data-type="require" alt="会员用户名" placeholder="请输入已注册的会员用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <button type="submit" class="btn btn-info jeesns-submit">确定授权</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>