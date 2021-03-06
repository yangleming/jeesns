<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "系统设置"/>
    <#include "/manage/common/head-res.ftl"/>
    <script type="text/javascript">
        var basePath = "${basePath}";
        var uploadServer = "${managePath}/uploadImage";
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<#include "/manage/common/header.ftl"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                系统设置
            </h1>
            <ol class="breadcrumb">
                <li><a href="${managePath}/index"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li class="active">系统设置</li>
            </ol>
        </section>
        <section class="content">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">基本设置</a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">会员设置</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">CMS设置</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">微博设置</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-5" aria-expanded="false">群组设置</a></li>
                    <li class=""><a data-toggle="tab" href="#tab-6" aria-expanded="false">支付设置</a></li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/baseUpdate" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">网站名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_name" name="site_name" placeholder="网站名称" value="${site_name}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">SEO标题</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_seo_title" name="site_seo_title" placeholder="网站SEO标题" value="${site_seo_title}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">网址</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_domain" name="site_domain" placeholder="网址" value="${site_domain}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">网站关键词</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_keys" name="site_keys" placeholder="网站关键词" value="${site_keys}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">网站描述</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" name="site_description" alt="网站描述">${site_description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">网站LOGO</label>
                                    <div class="col-sm-10">
                                        <div id="uploader" class="wu-example">
                                        <#if site_logo??>
                                            <img src="${basePath}${site_logo}" height="80px"/>
                                        </#if>
                                            <!--用来存放文件信息-->
                                            <input type="hidden" id="thumbnail" name="site_logo">
                                            <div id="preview" class="uploader-list"></div>
                                            <div id="imagesList" class="uploader-list"></div>
                                            <div class="btns">
                                                <div id="picker">选择文件</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">邮箱账号</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_send_email_account" name="site_send_email_account" placeholder="邮箱账号" value="${site_send_email_account}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">邮箱密码</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="site_send_email_password" name="site_send_email_password" placeholder="邮箱密码">*不修改请留空
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">SMTP服务器</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_send_email_smtp" name="site_send_email_smtp" placeholder="SMTP服务器" value="${site_send_email_smtp}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">备案号</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_icp" name="site_icp" placeholder="备案号" value="${site_icp}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">版权说明</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="site_copyright" name="site_copyright" placeholder="版权说明" value="${site_copyright}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">统计代码</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" name="site_tongji" alt="统计代码">${site_tongji}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/update" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">会员登录</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="member_login_open">
                                            <option value="0" <#if member_login_open=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if member_login_open=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">会员注册</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="member_register_open">
                                            <option value="0" <#if member_register_open=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if member_register_open=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">邮箱验证</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="member_email_valid">
                                            <option value="0" <#if member_email_valid=='0'>selected</#if>>不需要验证</option>
                                            <option value="1" <#if member_email_valid=='1'>selected</#if>>需要验证</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">推荐注册</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="member_recommend">
                                            <option value="0" <#if member_recommend=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if member_recommend=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">推荐注册奖励积分</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="member_recommend_reward_score" name="member_recommend_reward_score" placeholder="推荐注册奖励积分" value="${member_recommend_reward_score}">
                                        推荐注册开启才生效
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">推荐注册奖励金额</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="member_recommend_reward_money" name="member_recommend_reward_money" placeholder="推荐注册奖励金额" value="${member_recommend_reward_money}">
                                        推荐注册开启才生效
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/cmsUpdate" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">文章投稿</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="cms_post">
                                            <option value="0" <#if cms_post=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if cms_post=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">投稿审核</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="cms_post_review">
                                            <option value="0" <#if cms_post_review=='0'>selected</#if>>需要审核</option>
                                            <option value="1" <#if cms_post_review=='1'>selected</#if>>无需审核</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="tab-4" class="tab-pane">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/weiboUpdate" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">微博别名</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="weibo_alias" name="weibo_alias" placeholder="微博别名" value="${weibo_alias}">
                                        默认为微博，如果需要修改微博访问路径，请修改jeesns.properties中weiboPath的值
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">微博发布</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="weibo_post">
                                            <option value="0" <#if weibo_post=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if weibo_post=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">微博字数</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="weibo_post_maxcontent" name="weibo_post_maxcontent" placeholder="微博字数" value="${weibo_post_maxcontent}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="tab-5" class="tab-pane">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/groupUpdate" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">群组别名</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="group_alias" name="group_alias" placeholder="群组别名" value="${group_alias}">
                                        默认为群组，如果需要修改群组访问路径，请修改jeesns.properties中groupPath的值
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">群组申请</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="group_apply">
                                            <option value="0" <#if group_apply=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if group_apply=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">申请审核</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="group_apply_review">
                                            <option value="0" <#if group_apply_review=='0'>selected</#if>>需要审核</option>
                                            <option value="1" <#if group_apply_review=='1'>selected</#if>>无需审核</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">付费群组手续费</label>
                                    <div class="col-sm-8">
                                        <#if group_follow_pay_fee??>
                                            <input type="text" class="form-control" id="group_follow_pay_fee" name="group_follow_pay_fee" placeholder="付费群组手续费" value="${group_follow_pay_fee}" data-type="require,double">
                                        <#else>
                                            <input type="text" class="form-control" id="group_follow_pay_fee" name="group_follow_pay_fee" placeholder="付费群组手续费" value="0" data-type="require,double">
                                        </#if>
                                        如0.1表示收取10%手续费
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div id="tab-6" class="tab-pane">
                        <div class="panel-body">
                            <form class="form-horizontal jeesns_form" role="form" action="${managePath}/system/config/payUpdate" method="post">
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">支付宝支付</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="alipay_open">
                                            <option value="0" <#if !(alipay_open??) || alipay_open=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if alipay_open?? && alipay_open=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">支付宝APPID</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="alipay_app_id" name="alipay_app_id" placeholder="支付宝APPID" value="${alipay_app_id}">
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-sm-1 control-label">支付宝商户私钥</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" name="alipay_merchant_private_key" alt="支付宝商户私钥">${alipay_merchant_private_key}</textarea>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-sm-1 control-label">支付宝公钥</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" name="alipay_public_key" alt="支付宝公钥">${alipay_public_key}</textarea>
                                        这里填写的是支付宝公钥，不是支付宝应用公钥
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-1 control-label">PAYJS微信支付</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="payjs_open">
                                            <option value="0" <#if payjs_open=='0'>selected</#if>>关闭</option>
                                            <option value="1" <#if payjs_open=='1'>selected</#if>>开启</option>
                                        </select>
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-sm-1 control-label">PAYJS商户号</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="payjs_mchid" name="payjs_mchid" placeholder="PAYJS商户号" value="${payjs_mchid}">
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label class="col-sm-1 control-label">PAYJS通信密钥</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="payjs_key" name="payjs_key" placeholder="PAYJS通信密钥" value="${payjs_key}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <button type="submit" class="btn btn-info jeesns-submit">保存</button>
                                    </div>
                                </div>
                            </form>
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