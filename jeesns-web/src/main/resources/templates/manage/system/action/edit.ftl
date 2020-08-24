<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "修改动态类型"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="${managePath}/system/action/update" class="jeesns_form" callback="parentReload">
                    <div class="box-body">
                        <input type="hidden" class="form-control" name="id" value="${action.id}">
                        <div class="form-group">
                            <label class="col-sm-1 control-label">名称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="name" name="name" placeholder="名称" data-type="require" value="${action.name}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label">描述</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" rows="3" name="log">${action.log}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10">
                                <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
</body>
</html>