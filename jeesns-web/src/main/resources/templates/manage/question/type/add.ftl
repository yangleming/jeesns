<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "添加问题分类"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="${managePath}/question/type/save" class="jeesns_form" callback="parentReload">
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">栏目名字:</label>
                        <input type="text" class="form-control" id="name" name="name" data-type="require"
                               alt="分类名称">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">栏目序号:</label>
                        <select class="form-control" name="bonusType">
                            <option value="0" selected>积分</option>
                            <option value="1">现金</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">栏目序号:</label>
                        <input type="text" class="form-control" id="sort" name="sort" data-type="require,integer"
                               alt="分类序号" value="50">越大越靠前
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