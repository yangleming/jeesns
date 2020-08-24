<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "问答管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
                <a href="${managePath}/question/list"><span class="btn btn-info">全部</span></a>
                <a href="${managePath}/question/list-unsolved"><span class="btn btn-info">待解决</span></a>
                <a href="${managePath}/question/list-solved"><span class="btn btn-info">已解决</span></a>
                <a href="${managePath}/question/list-close"><span class="btn btn-info">已关闭</span></a>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">问答管理</li>
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
                                    <th>标题</th>
                                    <th>会员</th>
                                    <th>奖金</th>
                                    <th>回答数</th>
                                    <th>状态</th>
                                    <th>时间</th>
                                    <th style="width: 80px;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as question>
                                <tr>
                                    <td>${question.id}</td>
                                    <td><a href="${basePath}/question/detail/${question.id}" target="_blank">${question.title}</a></td>
                                    <td>${question.member.name}</td>
                                    <td>
                                        ${question.bonus}${(question.questionType.bonusType == 0)?string('积分',"元现金")}
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/question/${question.id}/answer/list" target="_jeesnsOpen"
                                           width="1200px" height="600px" title="回答">
                                            <span class="label label-success">${question.answerCount}</span>
                                        </a>
                                    </td>
                                    <td>
                                        <#if question.status == -1>
                                            已关闭
                                        <#elseif question.status == 0>
                                            待解决
                                        <#else>
                                            已解决
                                        </#if>
                                    </td>
                                    <td>${question.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/question/delete/${question.id}"
                                           confirm="确定要删除问题吗？" callback="reload">
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
                                url="${managePath}/question/list<#if statusName??>-${statusName}</#if>"
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