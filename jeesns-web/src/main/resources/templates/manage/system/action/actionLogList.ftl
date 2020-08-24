<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "会员日志"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>会员日志(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">会员日志</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>会员</th>
                                    <th style="width: 75%">描述</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as actionLog>
                                <tr>
                                    <td>${actionLog.id}</td>
                                    <td>
                                    <#if actionLog.member??>
                                        ${actionLog.member.name}
                                    </#if>
                                    </td>
                                    <td>${actionLog.action.log}。${actionLog.remark}</td>
                                    <td>${actionLog.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/system/action/actionLogList"
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
