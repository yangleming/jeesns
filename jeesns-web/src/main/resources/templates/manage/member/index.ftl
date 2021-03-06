<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "会员管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>会员管理(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">会员管理</li>
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
                                <form method="get" action="${managePath}/member/index">
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
                                    <th>VIP会员</th>
                                    <th>手机号码</th>
                                    <th>登录次数</th>
                                    <th>注册时间</th>
                                    <th>状态</th>
                                    <th width="200px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as member>
                                <tr>
                                    <td>${member.id}</td>
                                    <td>${member.name}</td>
                                    <td>${member.email}</td>
                                    <td>${(member.isVip == 0)?string("否","是")}</td>
                                    <td>${member.phone!''}</td>
                                    <td>${member.loginCount}</td>
                                    <td>${member.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if member.status=-1>
                                        <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/member/isenable/${member.id}" confirm="确定要启用会员吗？" callback="reload">
                                            <span class="label label-danger">禁用</span>
                                        </a>
                                        <#else>
                                        <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/member/isenable/${member.id}" confirm="确定要禁用会员吗？" callback="reload">
                                            <span class="label label-success">启用</span>
                                        </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/member/level/${member.id}" target="_jeesnsOpen"
                                           title="设置VIP会员" width="400px" height="300px">
                                            <span class="label label-info">VIP</span>
                                        </a>
                                        <a href="javascript:void(0)" data-href="${managePath}/member/info/${member.id}" target="_jeesnsOpen"
                                           title="会员详情" width="1000px" height="600px">
                                            <span class="label label-info">详情</span>
                                        </a>
                                        <a href="javascript:void(0)" data-href="${managePath}/member/changepwd/${member.id}" target="_jeesnsOpen"
                                           title="修改密码" width="400px" height="300px">
                                            <span class="label label-info">修改密码</span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/member/delete/${member.id}" confirm="确定要删除会员吗？" callback="reload">
                                            <span class="label label-danger"><i class="fa fa-trash red"></i></span>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/member/index?key=${key?default("")}"
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

