<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "会员动态类型"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                会员动态类型
            </h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">会员动态类型</li>
            </ol>
        </section>
        <section class="content">
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>名称</th>
                                    <th>描述</th>
                                    <th>添加时间</th>
                                    <th>更新时间</th>
                                    <th>状态</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as action>
                                <tr>
                                    <td>${action.id}</td>
                                    <td>${action.name}</td>
                                    <td>${action.log}</td>
                                    <td>${action.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${action.updateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if action.status=1>
                                            <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/system/action/isenable/${action.id}" callback="reload">
                                                <span class="label label-danger">禁用</span>
                                            </a>
                                        <#else>
                                            <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/system/action/isenable/${action.id}" callback="reload">
                                                <span class="label label-success">启用</span>
                                            </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/system/action/edit/${action.id}" target="_jeesnsOpen" title="编辑动态类型" height="350px">
                                            <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<#include "/manage/common/footer.ftl"/>
</div>
</body>
</html>