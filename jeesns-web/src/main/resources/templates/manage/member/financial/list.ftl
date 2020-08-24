<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "财务明细"/>
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
                <li class="active">财务明细</li>
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
                                    <th>类型</th>
                                    <th>时间</th>
                                    <th>会员</th>
                                    <th>变动金额</th>
                                    <th>支付方式</th>
                                    <th>操作人</th>
                                    <th>备注</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as financial>
                                <tr>
                                    <td>${financial.id}</td>
                                    <td>${(financial.type == 0)?string('收入','支出')}</td>
                                    <td>${financial.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${financial.member.name}</td>
                                    <td>${financial.money}</td>
                                    <td>${financial.paymentName}</td>
                                    <td>${financial.operator}</td>
                                    <td>${financial.remark}</td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right"
                                url="${managePath}/member/financial/list"
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

