$(document).ready(function () {
    var $avatarModal = $("body").find('#avatar-modal');
    var $avatarForm = $avatarModal.find('.avatar-form');
    var $avatarInput = $avatarForm.find('.avatar-input');
    var $avatarSave = $avatarForm.find('.avatar-save');
    var hasAvatar = false;
    $avatarInput.on('change', function (e) {
        var filemaxsize = 1024 * 5;//5M
        var target = $(e.target);
        var Size = target[0].files[0].size / 1024;
        if (Size > filemaxsize) {
            jeesnsDialog.alert('图片过大，请重新选择!');
            $(".avatar-wrapper").childre().remove;
            return false;
        }
        if (!this.files[0].type.match(/image.*/)) {
            jeesnsDialog.alert('请选择正确的图片!')
        } else {
            var filename = document.querySelector("#avatar-name");
            var texts = document.querySelector("#avatarInput").value;
            var teststr = texts;
            testend = teststr.match(/[^\\]+\.[^\(]+/i);
            filename.innerHTML = testend;
        }
        hasAvatar = true;
    });

    $avatarSave.on("click", function () {
        if (!hasAvatar){
            jeesnsDialog.tips("请先选择头像");
            return;
        }
        var img_lg = document.getElementById('imageHead');
        // 截图小的显示框内的内容
        html2canvas(img_lg, {
            allowTaint: true,
            taintTest: false,
            onrendered: function (canvas) {
                canvas.id = "mycanvas";
                //生成base64图片数据
                var dataUrl = canvas.toDataURL("image/jpeg");
                var newImg = document.createElement("img");
                newImg.src = dataUrl;
                imagesAjax(dataUrl)
            }
        });
    })

})
var avatarSuccess = function(res) {
    window.location.href = window.location.href;
}
function imagesAjax(imgData) {
    var data = {
        avatarBase64: imgData
    };
    jeesns.jeesnsAjax(basePath + "/member/avatar", "post", data, "avatarSuccess")
}
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } else if (typeof exports === 'object') {
        factory(require('jquery'));
    } else {
        factory(jQuery);
    }
})(function ($) {
    'use strict';
    var console = window.console || {
        log: function () {
        }
    };

    function CropAvatar($element) {
        this.$container = $element;
        this.$avatarView = this.$container.find('.avatar-view');
        this.$avatar = this.$avatarView.find('img');
        this.$avatarModal = $("body").find('#avatar-modal');
        this.$avatarForm = this.$avatarModal.find('.avatar-form');
        this.$avatarUpload = this.$avatarForm.find('.avatar-upload');
        this.$avatarSrc = this.$avatarForm.find('.avatar-src');
        this.$avatarInput = this.$avatarForm.find('.avatar-input');
        this.$avatarSave = this.$avatarForm.find('.avatar-save');
        this.$avatarBtns = this.$avatarForm.find('.avatar-btns');
        this.$avatarWrapper = this.$avatarModal.find('.avatar-wrapper');
        this.$avatarPreview = this.$avatarModal.find('.avatar-preview');
        this.init();
    }

    CropAvatar.prototype = {
        constructor: CropAvatar,
        support: {
            fileList: !!$('<input type="file">').prop('files'),
            blobURLs: !!window.URL && URL.createObjectURL,
            formData: !!window.FormData
        },
        init: function () {
            this.support.datauri = this.support.fileList && this.support.blobURLs;
            if (!this.support.formData) {
                this.initIframe();
            }
            this.addListener();
        },
        addListener: function () {
            this.$avatarView.on('click', $.proxy(this.click, this));
            this.$avatarInput.on('change', $.proxy(this.change, this));
            this.$avatarForm.on('submit', $.proxy(this.submit, this));
            this.$avatarBtns.on('click', $.proxy(this.rotate, this));
        },


        initPreview: function () {
            var url = this.$avatar.attr('src');
        },
        initIframe: function () {
            var target = 'upload-iframe-' + (new Date()).getTime(),
                $iframe = $('<iframe>').attr({name: target, src: ''}), _this = this;
            $iframe.one('load', function () {
                $iframe.on('load', function () {
                    var data;
                    try {
                        data = $(this).contents().find('body').text();
                    } catch (e) {
                        console.log(e.message);
                    }
                    if (data) {
                        try {
                            data = $.parseJSON(data);
                        } catch (e) {
                            console.log(e.message);
                        }
                        _this.submitDone(data);
                    } else {
                        _this.submitFail('Image upload failed!');
                    }
                    _this.submitEnd();
                });
            });
            this.$iframe = $iframe;
            this.$avatarForm.attr('target', target).after($iframe.hide());
        },
        click: function () {
            this.$avatarModal.modal('show');
            this.initPreview();
        },
        change: function () {
            console.log("change")
            var files, file;
            console.log("change uri", this.support.datauri)
            if (this.support.datauri) {
                files = this.$avatarInput.prop('files');
                console.log("change files", files)
                if (files.length > 0) {
                    file = files[0];
                    if (this.isImageFile(file)) {
                        if (this.url) {
                            URL.revokeObjectURL(this.url);
                        }
                        this.url = URL.createObjectURL(file);
                        this.startCropper();
                    }
                }
            } else {
                file = this.$avatarInput.val();
                if (this.isImageFile(file)) {
                    this.syncUpload();
                }
            }
        },
        submit: function () {
            if (!this.$avatarSrc.val() && !this.$avatarInput.val()) {
                return false;
            }
            if (this.support.formData) {
                this.ajaxUpload();
                return false;
            }
        },
        rotate: function (e) {
            var data;
            if (this.active) {
                data = $(e.target).data();
                if (data.method) {
                    this.$img.cropper(data.method, data.option);
                }
            }
        },
        isImageFile: function (file) {
            if (file.type) {
                return /^image\/\w+$/.test(file.type);
            } else {
                return /\.(jpg|jpeg|png|gif)$/.test(file);
            }
        },
        startCropper: function () {
            console.log("startCropper")
            var _this = this;
            if (this.active) {
                console.log(this.url)
                this.$img.cropper('replace', this.url);
            } else {
                this.$img = $('<img src="' + this.url + '">');
                console.log(this.$img)
                this.$avatarWrapper.empty().html(this.$img);
                this.$img.cropper({aspectRatio: 1, preview: this.$avatarPreview.selector, strict: false,});
                this.active = true;
            }
        },
        stopCropper: function () {
            if (this.active) {
                this.$img.cropper('destroy');
                this.$img.remove();
                this.active = false;
            }
        },
        syncUpload: function () {
            this.$avatarSave.click();
        },
        submitStart: function () {
        },
        submitFail: function (msg) {
            this.alert(msg);
        },
        submitEnd: function () {
        },
        cropDone: function () {
            this.$avatarForm.get(0).reset();
            this.$avatar.attr('src', this.url);
            this.stopCropper();
            this.$avatarModal.modal('hide');
        },
        alert: function (msg) {
            var $alert = ['<div class="alert alert-danger avater-alert">', '<button type="button" class="close" data-dismiss="alert">&times;</button>', msg, '</div>'].join('');
            this.$avatarUpload.after($alert);
        }
    };
    $(function () {
        new CropAvatar($('#crop-avatar'));
        $(".upload-avatar .show-avatar").hover(function(){
            $(".upload-avatar .show-avatar .tip").show();
        },function(){
            $(".upload-avatar .show-avatar .tip").hide();
        });
    });
});