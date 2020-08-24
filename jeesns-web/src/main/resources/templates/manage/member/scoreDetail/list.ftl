<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "积分明细"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>财务明细(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">积分明细</li>
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
                                    <th width="80px">类型</th>
                                    <th width="120px">会员</th>
                                    <th width="120px">变动积分</th>
                                    <th>备注</th>
                                    <th width="150px">时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as scoreDetail>
                                <tr>
                                    <td>${scoreDetail.id}</td>
                                    <td>${(scoreDetail.score < 0)?string('支出','收入')}</td>
                                    <td>${scoreDetail.member.name}</td>
                                    <td>${scoreDetail.score}</td>
                                    <td>${scoreDetail.remark}</td>
                                    <td>${scoreDetail.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/member/scoreDetail/list"
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

