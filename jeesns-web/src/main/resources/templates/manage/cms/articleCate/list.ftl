<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "文章栏目管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h4>
                <a href="javascript:void(0)" data-href="${managePath}/cms/articleCate/add" target="_jeesnsOpen" title="添加栏目">
                    <label class="label label-info">添加</label>
                </a>
            </h4>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">文章栏目</li>
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
                                    <th>栏目名称</th>
                                    <th>序号</th>
                                    <th width="100px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as mainMenu>
                                <tr>
                                    <td>${mainMenu.name}</td>
                                    <td>${mainMenu.sort}</td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/cms/articleCate/edit/${mainMenu.id}" target="_jeesnsOpen"
                                           title="编辑栏目">
                                            <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                        </a>
                                        <a target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/cms/articleCate/delete/${mainMenu.id}"
                                           confirm="确定要删除栏目吗？删除后栏目下的文章将会移到未分类中！" callback="reload">
                                            <span class="label label-danger"><i class="fa fa-trash red"></i></span>
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