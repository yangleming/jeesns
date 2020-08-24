<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "会员动态"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>会员动态(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">会员动态</li>
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
                                    <th width="50px">#</th>
                                    <th>会员</th>
                                    <th style="width: 75%">描述</th>
                                    <th>时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as actionLog>
                                <tr>
                                    <td>${actionLog.id}</td>
                                    <td>${actionLog.member.name}</td>
                                    <td>${actionLog.action.log}：
                                        <br/>
                                        <#if actionLog.type==1>
                                            <a href="${basePath}/article/detail/${actionLog.foreignId}" target="_blank">${actionLog.remark}</a>
                                        <#elseif actionLog.type==2>
                                            <a href="${weiboPath}/detail/${actionLog.foreignId}" target="_blank">${actionLog.remark}</a>
                                        <#elseif actionLog.type==4>
                                            <a href="${groupPath}/topic/${actionLog.foreignId}" target="_blank">${actionLog.remark}</a>
                                        </#if>
                                    </td>
                                    <td>${actionLog.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/system/action/memberActionLog"
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

