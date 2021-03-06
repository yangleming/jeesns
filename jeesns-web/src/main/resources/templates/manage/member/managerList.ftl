<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "管理员"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>管理员(${model.page.totalCount})
            <a href="javascript:void(0)" data-href="${managePath}/member/managerAdd" target="_jeesnsOpen" title="授权管理员">授权</a>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">管理员</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                            </h3>
                            <div class="box-tools">
                                <form method="get" action="${managePath}/member/managerList">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" class="form-control pull-right"
                                               placeholder="请输入关键词">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="50px">#</th>
                                    <th>用户名</th>
                                    <th>邮箱</th>
                                    <th>手机号码</th>
                                    <th>登录次数</th>
                                    <th>注册时间</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as member>
                                <tr>
                                    <td>${member.id}</td>
                                    <td>${member.name}</td>
                                    <td>${member.email}</td>
                                    <td>${member.phone!''}</td>
                                    <td>${member.loginCount}</td>
                                    <td>${member.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/member/managerCancel/${member.id}" confirm="确定要取消管理员吗？">
                                            <span class="label label-danger">取消管理员</span>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/member/managerList?key=${key?default('')}"
                                currentPage="${model.page.pageNo}"
                                pageCount="${model.page.totalPage}">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>

