<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "添加分类"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="${managePath}/shop/goodsCate/save" class="jeesns_form" callback="parentReload">
                    <div class="form-group">
                        <label class="control-label">分类名字:</label>
                        <input type="text" class="form-control" id="name" name="name" data-type="require" alt="分类名字">
                    </div>
                    <div class="form-group">
                        <label class="control-label">上级分类</label>
                        <select class="form-control" name="fid" data-type="selected">
                            <option value="0" selected>顶级分类</option>
                            <#list topList as goodsCate>
                                <option value="${goodsCate.id}">${goodsCate.name}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">状态</label>
                        <select class="form-control" name="status" data-type="selected">
                            <option value="0" selected>启用</option>
                            <option value="1">禁用</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">分类序号:</label>
                        <input type="text" class="form-control" id="sort" name="sort" data-type="require,integer"
                               alt="分类序号" value="50">越大越靠前
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
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