<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "积分规则"/>
    <#include "/manage/common/head-res.ftl"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                积分规则
            </h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">积分规则</li>
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
                                    <th>变动积分</th>
                                    <th>周期</th>
                                    <th>添加时间</th>
                                    <th>更新时间</th>
                                    <th>状态</th>
                                    <th width="150px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as scoreRule>
                                <tr>
                                    <td>${scoreRule.id}</td>
                                    <td>${scoreRule.name}</td>
                                    <td>${scoreRule.remark}</td>
                                    <td>${scoreRule.score}</td>
                                    <td>
                                        <#if scoreRule.type=="day">
                                            一天一次
                                        <#elseif scoreRule.type=="week">
                                            一周一次
                                        <#elseif scoreRule.type=="month">
                                            一月一次
                                        <#elseif scoreRule.type=="year">
                                            一年一次
                                        <#elseif scoreRule.type=="one">
                                            一次
                                        <#elseif scoreRule.type=="unlimite">
                                            不限
                                        </#if>
                                    </td>
                                    <td>${scoreRule.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>${scoreRule.updateTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <#if scoreRule.status=0>
                                            <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/system/scoreRule/enabled/${scoreRule.id}" callback="reload">
                                                <span class="label label-danger">禁用</span>
                                            </a>
                                        <#else>
                                            <a class="marg-l-5" target="_jeesnsLink" href="javascript:void(0)" data-href="${managePath}/system/scoreRule/enabled/${scoreRule.id}" callback="reload">
                                                <span class="label label-success">启用</span>
                                            </a>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/system/scoreRule/edit/${scoreRule.id}" target="_jeesnsOpen" title="编辑积分规则" height="480px" callback="reload">
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