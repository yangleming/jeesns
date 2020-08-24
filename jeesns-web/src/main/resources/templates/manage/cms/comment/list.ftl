<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "文章评论管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>文章评论(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">文章评论管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title"></h3>
                            <div class="box-tools">
                                <form method="get" action="${managePath}/cms/comment/list">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" class="form-control pull-right"
                                               placeholder="请输入关键词" value="${key?default("")}">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="50px">#</th>
                                    <th width="120px">会员</th>
                                    <th>评论内容</th>
                                    <th width="200px">文章</th>
                                    <th width="120px">创建时间</th>
                                    <th width="50px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as articleComment>
                                <tr>
                                    <td>${articleComment.id}</td>
                                    <td>
                                        <a href="${basePath}/u/${articleComment.member.id}" target="_blank">
                                            ${articleComment.member.name}
                                        </a>
                                        </td>
                                    <td style="word-break: break-all">${articleComment.content}</td>
                                    <td>
                                        <a href="${basePath}/article/detail/${articleComment.article.id}" target="_blank">
                                        《${articleComment.article.title}》
                                        </a>
                                    </td>
                                    <td>${articleComment.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/cms/comment/delete/${articleComment.id}" confirm="确定要删除评论吗？" callback="reload">
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
                                url="${managePath}/cms/comment/list?key=${key?default("")}"
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

