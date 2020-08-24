<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "会员VIP等级管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>会员VIP等级管理</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">会员VIP等级管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/member/level/add" target="_jeesnsOpen"
                                   title="添加会员VIP等级" width="400px" height="200px">
                                    <span class="label label-info">添加</span>
                                </a>
                            </h3>
                            <div class="box-tools">

                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="50px">#</th>
                                    <th>名称</th>
                                    <th>创建时间</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as memberLevel>
                                <tr>
                                    <td>${memberLevel.id}</td>
                                    <td>${memberLevel.name}
                                    <#if memberLevel.id != 1>
                                        <span class="label label-danger">VIP</i>
                                    </#if>
                                    </td>
                                    <td>${memberLevel.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if memberLevel.id != 1>
                                            <a href="javascript:void(0)" data-href="${managePath}/member/level/edit/${memberLevel.id}" target="_jeesnsOpen"
                                               title="修改广告" width="400px" height="200px">
                                                <span class="label label-info">修改</span>
                                            </a>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="javascript:void(0)" data-href="${managePath}/member/level/delete/${memberLevel.id}" confirm="确定要删除会员等级吗？" callback="reload">
                                                <span class="label label-danger"><i class="fa fa-trash red"></i></span>
                                            </a>
                                        </#if>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
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

