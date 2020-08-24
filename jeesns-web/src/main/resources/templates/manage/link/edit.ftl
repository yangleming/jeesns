<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "修改友情链接"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/link/update" method="post" callback="parentReload">
                    <input type="hidden" class="form-control" id="id" name="id" data-type="require" value="${link.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">网站名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" data-type="require" value="${link.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">网址</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="url" name="url" data-type="require" value="${link.url}">
                        </div>
                    </div>
                    <div class="form-group" id="linkDiv">
                        <label class="col-sm-2 control-label">序号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="sort" name="sort" data-type="require,number" value="${link.sort}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">推荐</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="recomment" data-type="selected">
                                <option value="0" <#if link.recomment == 0>selected</#if>>不推荐</option>
                                <option value="1" <#if link.recomment == 1>selected</#if>>推荐</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="status" data-type="selected">
                                <option value="0" <#if link.status == 0>selected</#if>>禁用</option>
                                <option value="1" <#if link.status == 1>selected</#if>>启用</option>
                            </select>
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