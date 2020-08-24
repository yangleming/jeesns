<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "群组分类管理"/>
    <#include "/manage/common/head-res.ftl"/>
    <script>
        var _delSuccess = function (res) {
            localStorage.setItem("message", "删除成功");
            location.reload();
        }
    </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>群组分类管理(${list?size})</h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">群组分类管理</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">
                                <a href="javascript:void(0)" data-href="${managePath}/group/type/add" target="_jeesnsOpen"
                                   title="添加群组分类" width="500px" height="300px">
                                    <span class="label label-info">添加</span>
                                </a>
                            </h3>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="50px">#</th>
                                    <th>分类名称</th>
                                    <th>创建时间</th>
                                    <th width="100px">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list list as groupType>
                                <tr>
                                    <td>${groupType.id}</td>
                                    <td>${groupType.name}</td>
                                    <td>${groupType.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td>
                                        <a href="javascript:void(0)" data-href="${managePath}/group/type/edit/${groupType.id}" target="_jeesnsOpen"
                                           title="修改群组分类" width="500px" height="300px">
                                            <span class="label label-info">修改</span>
                                        </a>
                                        <a class="marg-l-5" target="_jeesnsLink"
                                           href="javascript:void(0)" data-href="${managePath}/group/type/delete/${groupType.id}" confirm="确定要删除群组分类吗？"
                                           callback="reload">
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

