<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "问题分类管理"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h4>
                <a href="javascript:void(0)" data-href="${managePath}/question/type/add" target="_jeesnsOpen"
                   title="添加分类" width="500px" height="400px">
                    <span class="label label-info">添加</span>
                </a>
            </h4>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">问题分类</li>
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
                                    <th>分类名称</th>
                                    <th>奖励类型</th>
                                    <th>序号</th>
                                    <th style="width: 100px;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as questionType>
                                <tr>
                                    <td>${questionType.name}</td>
                                    <td>${(questionType.bonusType == 0)?string("积分","现金")}</td>
                                    <td>${questionType.sort}</td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/question/type/edit/${questionType.id}" target="_jeesnsOpen"
                                           width="500px" height="400px" title="编辑分类">
                                            <span class="label label-warning"><i class="fa fa-edit green"></i></span>
                                        </a>
                                        <a target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/question/type/delete/${questionType.id}"
                                           confirm="确定要删除分类吗？" callback="reload">
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