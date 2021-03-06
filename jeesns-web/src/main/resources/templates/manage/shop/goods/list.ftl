<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "商品管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>商品(${model.page.totalCount})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">商品管理</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-2">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">栏目</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body no-padding">
                            <ul class="nav nav-pills nav-stacked">
                                <li <#if cateid == 0>class="active"</#if>>
                                    <a href="${managePath}/shop/goods/list"><i
                                            class="fa fa-circle-o text-light-blue"></i>全部</a>
                                </li>
                                <#list topList as topCate>
                                <li <#if cateid==topCate.id>class="active"</#if>>
                                    <a href="${managePath}/shop/goods/list?cateid=${topCate.id}">
                                        <i class="fa fa-circle-o text-light-blue"></i>
                                        ${topCate.name}
                                    </a>
                                </li>
                                    <#list sonList as sonCate>
                                        <#if sonCate.fid == topCate.id>
                                            <li <#if cateid==sonCate.id>class="active"</#if> style="padding-left: 30px">
                                                <a href="${managePath}/shop/goods/list?cateid=${sonCate.id}">
                                                    <i class="fa fa-circle-o text-light-blue"></i>
                                                    ${sonCate.name}
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/shop/goods/add" target="_jeesnsOpen"
                                   title="发布商品" width="1000px" height="680px">
                                    <span class="label label-info">发布</span>
                                </a>
                            </h3>

                            <div class="box-tools">
                                <form method="get" action="${managePath}/shop/goods/list">
                                    <div class="input-group input-group-sm" style="width: 350px;">
                                        <input type="text" name="key" value="${key}" class="form-control pull-right" placeholder="请输入关键词">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 10px">#</th>
                                    <th>标题</th>
                                    <th width="20%">副标题</th>
                                    <th>编号</th>
                                    <th>所属分类</th>
                                    <th>价格</th>
                                    <th>库存</th>
                                    <th>商品图</th>
                                    <th>发布时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list model.data as goods>
                                <tr>
                                    <td>${goods.id}</td>
                                    <td>${goods.title}</td>
                                    <td>${goods.subtitle}</td>
                                    <td>${goods.no}</td>
                                    <td>${goods.goodsCate.name}</td>
                                    <td>${goods.price}</td>
                                    <td>${goods.stock}</td>
                                    <td>
                                        <#if goods.thumbnail??>
                                            <img src="${basePath}${goods.thumbnail}" width="100px" height="100px">
                                        </#if>
                                    </td>
                                    <td>${goods.pubTime?string("yyyy-MM-dd HH:mm")}</td>
                                    <td>
                                        <#if goods.status==0>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="javascript:void(0)" data-href="${managePath}/shop/goods/changeStatus/${goods.id}" callback="reload">
                                                <span class="label label-danger">已下架</span>
                                            </a>
                                        <#else>
                                            <a class="marg-l-5" target="_jeesnsLink"
                                               href="javascript:void(0)" data-href="${managePath}/shop/goods/changeStatus/${goods.id}" callback="reload">
                                                <span class="label label-success">已上架</span>
                                            </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/shop/goods/edit/${goods.id}" target="_jeesnsOpen"
                                           title="编辑商品" width="1000px" height="680px">
                                            <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/shop/goods/delete/${goods.id}" confirm="确定要删除商品吗？" callback="reload">
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
                                url="${managePath}/shop/goods/list?key=${key}"
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

