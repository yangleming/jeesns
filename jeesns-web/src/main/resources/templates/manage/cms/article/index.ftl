<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "文章管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>文章(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">文章管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-2">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">栏目</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                        class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body no-padding">
                            <ul class="nav nav-pills nav-stacked">
                                <li <#if cateid?length == 0>class="active"</#if>>
                                    <a href="${managePath}/cms/index"><i
                                            class="fa fa-circle-o text-light-blue"></i>全部</a>
                                </li>
                            <#list cateList as mainMenu>
                                <li <#if cateid==mainMenu.id>class="active"</#if>>
                                    <a href="${managePath}/cms/index?cateid=${mainMenu.id}">
                                        <i class="fa fa-circle-o text-light-blue"></i>
                                    ${mainMenu.name}
                                    </a>
                                </li>
                            </#list>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/cms/article/add" target="_jeesnsOpen"
                                   title="发布文章" width="1000px" height="680px">
                                    <span class="label label-info">发布</span>
                                </a>
                            </h3>

                            <div class="box-tools">
                                <form method="get" action="${managePath}/cms/index">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" class="form-control pull-right"
                                               placeholder="请输入关键词">
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
                                    <th>标题</th>
                                    <th>所在栏目</th>
                                    <th>创建时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as article>
                                <tr>
                                    <td>${article.id}</td>
                                    <td>${article.title}</td>
                                    <td>${article.articleCate.name}</td>
                                    <td>${article.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if article.status==0>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="javascript:void(0)" data-href="${managePath}/cms/article/audit/${article.id}" callback="reload">
                                                <span class="label label-danger">未审核</span>
                                            </a>
                                        <#else>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="javascript:void(0)" data-href="${managePath}/cms/article/audit/${article.id}" callback="reload">
                                                <span class="label label-success">已审核</span>
                                            </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="${managePath}/cms/comment/list?articleId=${article.id}" title="查看评论">
                                            <span class="label label-info"><i class="fa fa-comment green"></i></span>
                                        </a>
                                        <a href="javascript:void(0)" data-href="${managePath}/cms/article/edit/${article.id}" target="_jeesnsOpen"
                                           title="编辑文章" width="1000px" height="680px">
                                            <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/cms/article/delete/${article.id}" confirm="确定要删除文章吗？" callback="reload">
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
                                url="${managePath}/cms/index?key=${key?default("")}"
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

