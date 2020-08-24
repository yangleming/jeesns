<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "广告管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>广告管理</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">广告管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/ads/add" target="_jeesnsOpen"
                                   title="添加广告" width="800px" height="500px">
                                    <span class="label label-info">添加</span>
                                </a>
                            </h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="50px">#</th>
                                    <th>类型</th>
                                    <th>名称</th>
                                    <th>添加时间</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>状态</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as ads>
                                <tr>
                                    <td>${ads.id}</td>
                                    <td>${ads.typeName}</td>
                                    <td>${ads.name}</td>
                                    <td>${ads.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${ads.startTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${ads.endTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if ads.status=0>
                                        <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/ads/enable/${ads.id}" confirm="确定要启用广告吗？" callback="reload">
                                            <span class="label label-danger">禁用</span>
                                        </a>
                                        <#else>
                                        <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/ads/enable/${ads.id}" confirm="确定要禁用广告吗？" callback="reload">
                                            <span class="label label-success">启用</span>
                                        </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/ads/edit/${ads.id}" target="_jeesnsOpen"
                                           title="修改广告" width="800px" height="500px">
                                            <span class="label label-info">修改</span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/ads/delete/${ads.id}" confirm="确定要删除广告吗？" callback="reload">
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
                                url="${managePath}/ads/list"
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

