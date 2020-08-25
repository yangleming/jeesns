<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改头像 - ${SITE_NAME} - Powered By JEESNS</title>
    <meta name="keywords" content="${SITE_KEYS}"/>
    <meta name="description" content="${SITE_DESCRIPTION}"/>
    <meta name="author" content="JEESNS"/>
    <link rel="shortcut icon" href="${basePath}/favicon.ico">
    <link href="${basePath}/res/common/css/zui.min.css" rel="stylesheet">
    <link href="${basePath}/res/front/css/app.css" rel="stylesheet">
    <link href="${basePath}/res/plugins/cropper/cropper.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="${basePath}/res/common/js/html5shiv.min.js"></script>
    <script src=${basePath}"/res/common/js/respond.min.js"></script>
    <![endif]-->
    <script src="${basePath}/res/common/js/jquery-2.1.1.min.js"></script>
    <script src="${basePath}/res/common/js/zui.min.js"></script>
    <script src="${basePath}/res/plugins/layer/layer.js"></script>
    <script src="${basePath}/res/common/js/jquery.form.js"></script>
    <script src="${basePath}/res/plugins/cropper/cropper.js"></script>
    <script src="${basePath}/res/plugins/html2canvas/html2canvas.min.js"></script>
    <script src="${basePath}/res/common/js/jeesns.js?v1.4"></script>
    <script>
        var basePath = "${basePath}";
    </script>
    <script src="${basePath}/res/modules/avatar.js"></script>

</head>

<body class="gray-bg">
<#include "/${frontTemplate}/common/header.ftl"/>
<div class="wrapper wrapper-content">
    <div class="container">
        <div class="row m-t-10">
            <#include "/member/common/settingMenu.ftl"/>
            <div class="col-sm-10 col-xs-12">
                <div class="col-xs-12 white-bg upload-avatar">
                    <div class="list list-condensed">
                        <header>
                            <h3><i class="icon-list-ul"></i> 修改头像</h3>
                        </header>
                        <div class="show-avatar">
                            <img src="${basePath}${loginUser.avatar}" width="180px" height="180px" data-toggle="modal" data-target="#avatar-modal"/>
                            <div class="tip">
                                点击图片修改头像
                            </div>
                        </div>
                        <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <form class="avatar-form">
                                        <div class="modal-header">
                                            <button class="close" data-dismiss="modal" type="button">&times;</button>
                                            <h4 class="modal-title" id="avatar-modal-label">上传头像</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="avatar-body">
                                                <div class="avatar-upload">
                                                    <input class="avatar-src" name="avatar_src" type="hidden">
                                                    <input class="avatar-data" name="avatar_data" type="hidden">
                                                    <button class="btn btn-danger" type="button" style="height: 35px;" onclick="$('input[id=avatarInput]').click();">请选择头像</button>
                                                    <span id="avatar-name"></span>
                                                    <input class="avatar-input hidden" id="avatarInput" name="avatar_file" type="file"></div>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <div class="avatar-wrapper"></div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="avatar-preview preview-lg" id="imageHead"></div>

                                                    </div>
                                                </div>
                                                <div class="row avatar-btns">
                                                    <div class="col-md-4">
                                                        <div class="btn-group">
                                                            <button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
                                                        </div>
                                                        <div class="btn-group">
                                                            <button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "/${frontTemplate}/common/footer.ftl"/>
</body>
</html>