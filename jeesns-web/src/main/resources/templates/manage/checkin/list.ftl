<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "签到"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>签到</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">签到</li>
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
                                    <th>签到时间</th>
                                    <th>连续签到（天）</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as checkin>
                                <tr>
                                    <td>${checkin.id}</td>
                                    <td><a href="${basePath}/u/${checkin.member.id}" target="_blank">${checkin.member.name}</a></td>
                                    <td>${checkin.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${checkin.continueDay}</td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/checkin/list"
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

