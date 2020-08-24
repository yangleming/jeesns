<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "回答管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="box box-primary">
                <div class="box-body">
                    <#if bestAnswer??>
                        <div class="item alert alert-info">
                            <p class="message">
                                <a href="${basePath}/u/${bestAnswer.member.id}" class="label label-info" target="_blank">
                                    ${bestAnswer.member.name}
                                </a>
                                <span class="text-muted pull-right">
                                    <i class="fa fa-clock-o"></i> ${bestAnswer.createTime?string("yyyy-MM-dd HH:mm:ss")}
                                    <a target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/question/${question.id}/answer/delete/${bestAnswer.id}"
                                       confirm="确定要删除该回答吗？" callback="reload">
                                        <span class="label label-danger">删除</span>
                                    </a>
                                </span>
                                ${answer.content}
                            <hr>
                            </p>
                        </div>
                    </#if>
                    <#list model.data as answer>
                        <div class="item">
                            <p class="message">
                                <a href="${basePath}/u/${answer.member.id}" class="label label-info" target="_blank">
                                    ${answer.member.name}
                                </a>
                                <span class="text-muted pull-right">
                                    <i class="fa fa-clock-o"></i> ${answer.createTime?string("yyyy-MM-dd HH:mm:ss")}
                                    <a target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/question/${question.id}/answer/delete/${answer.id}"
                                       confirm="确定要删除该回答吗？" callback="reload">
                                        <span class="label label-danger">删除</span>
                                    </a>
                                </span>
                                ${answer.content}
                                <hr>
                            </p>
                        </div>
                    </#list>
                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right"
                            url="${managePath}/question/${question.id}/answer/list"
                            currentPage="${model.page.pageNo}"
                            pageCount="${model.page.totalPage}">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    $(function () {
        $(".pagination").jeesns_page("jeesnsPageForm");
    });
</script>
</body>
</html>