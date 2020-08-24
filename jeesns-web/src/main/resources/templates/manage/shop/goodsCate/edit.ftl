<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "修改分类"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="${managePath}/shop/goodsCate/update" class="jeesns_form" callback="parentReload">
                    <input type="hidden" class="form-control" id="id" name="id" data-type="require" value="${goodsCate.id}">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">分类名字:</label>
                        <input type="text" class="form-control" id="name" name="name" data-type="require" alt="分类名字" value="${goodsCate.name}">
                    </div>
                    <div class="form-group">
                        <label class="control-label">上级分类</label>
                        <select class="form-control" name="fid" data-type="selected">
                            <option value="0" <#if goodsCate.fid == 0>selected</#if>>顶级分类</option>
                            <#list topList as cate>
                                <option value="${cate.id}" <#if goodsCate.fid == cate.id>selected</#if>>${cate.name}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">状态</label>
                        <select class="form-control" name="status" data-type="selected">
                            <option value="0" <#if goodsCate.status == 0>selected</#if>>启用</option>
                            <option value="1" <#if goodsCate.status == 1>selected</#if>>禁用</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">分类序号:</label>
                        <input type="text" class="form-control" id="sort" name="sort" data-type="require,integer" alt="分类序号" value="${goodsCate.sort}">越大越靠前
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