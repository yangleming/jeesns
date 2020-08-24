<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "设置会员VIP等级"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/member/setLevel" method="post" callback="parentReload">
                    <input type="hidden" name="id" value="${member.id}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">会员用户名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" data-type="require" value="${member.name}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">会员VIP等级</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="memberLevelId" data-type="selected">
                                <#list memberLevelList as memberLevel>
                                    <option value="${memberLevel.id}" <#if memberLevel.id==member.memberLevelId>selected</#if>>${memberLevel.name}</option>
                                </#list>
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