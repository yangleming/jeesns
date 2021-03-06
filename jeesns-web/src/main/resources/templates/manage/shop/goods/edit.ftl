<!DOCTYPE html>
<html>
<head>
    <#assign PAGE_TITLE = "编辑商品"/>
    <#include "/manage/common/head-res.ftl"/>
    <script type="text/javascript">
        $(function () {
            CKEDITOR.replace('content');
        });
        var basePath = "${basePath}";
        var uploadServer = "${managePath}/uploadImage";
    </script>
    <script src="${basePath}/res/plugins/webuploader/upload.js"></script>
</head>
<body class="hold-transition">
<div class="wrapper">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal jeesns_form" role="form" action="${managePath}/shop/goods/update" method="post" onsubmit="ckUpdate();" callback="parentReload">
                    <input type="hidden" class="form-control" name="id" value="${goods.id}">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">分类</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="cateId" data-type="selected" alt="分类">
                                <option value="" selected>=请选择分类=</option>
                                <#list topList as topCate>
                                    <option value="${topCate.id}" readonly="readonly" <#if goods.cateId == topCate.id>selected</#if>>${topCate.name}</option>
                                    <#list sonList as sonCate>
                                        <#if sonCate.fid == topCate.id>
                                        <option value="${sonCate.id}" <#if goods.cateId == sonCate.id>selected</#if> style="padding-left: 30px">${sonCate.name}</option>
                                        </#if>
                                    </#list>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" name="title" placeholder="标题" data-type="require" value="${goods.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">副标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="subtitle" name="subtitle" placeholder="副标题" data-type="require" value="${goods.subtitle}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">商品编号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="no" name="no" placeholder="商品编号" value="${goods.no}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="price" name="price" placeholder="价格" data-type="require,double" value="${goods.price}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">库存</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="stock" name="stock" placeholder="库存" data-type="require,integer" value="${goods.stock}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">商品图</label>
                        <div class="col-sm-10">
                            <div id="uploader" class="wu-example">
                                <!--用来存放文件信息-->
                                <input type="hidden" id="thumbnail" name="thumbnail" value="${goods.thumbnail?default('')}">
                                <div id="preview" class="uploader-list">
                                    <#if goods.thumbnail?? && goods.thumbnail!=''>
                                        <img src="${basePath}${goods.thumbnail}" width="100px" height="100px"/>
                                    </#if>
                                </div>
                                <div id="imagesList" class="uploader-list"></div>
                                <div class="btns">
                                    <div id="picker">选择文件</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">描述</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="description" alt="描述">${goods.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">关键词</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="keywords" name="keywords" placeholder="关键词" value="${goods.keywords}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="ckeditor" cols="80" id="content" name="content" rows="10">${goods.content}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">浏览数</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="viewCount" name="viewCount" placeholder="浏览数" value="${goods.viewCount}" data-type="integer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">序号</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="sort" name="sort" placeholder="序号" value="${goods.sort}" data-type="integer">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">状态</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="status" data-type="selected">
                                <option value="0" <#if goods.status == 0>selected</#if>>下架</option>
                                <option value="1" <#if goods.status == 1>selected</#if>>上架</option>
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
    </section>
</div>
</body>
</html>