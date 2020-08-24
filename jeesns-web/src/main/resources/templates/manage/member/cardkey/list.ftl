<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "充值卡密管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>充值卡密管理(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">充值卡密管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/member/cardkey/add" target="_jeesnsOpen"
                                   title="添加充值卡密" width="600px" height="400px">
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
                                    <th>卡号</th>
                                    <th>金额</th>
                                    <th>过期时间</th>
                                    <th>状态</th>
                                    <th>创建时间</th>
                                    <th width="80px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as cardkey>
                                <tr>
                                    <td>${cardkey.id}</td>
                                    <td>${cardkey.no}</td>
                                    <td>${cardkey.money}</td>
                                    <td>${cardkey.expireTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${(cardkey.status == 0)?string('未使用','已使用')}</td>
                                    <td>${cardkey.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/member/cardkey/delete/${cardkey.id}" confirm="确定要删除卡密吗？" callback="reload">
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
                                url="${managePath}/member/cardkey/list"
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

