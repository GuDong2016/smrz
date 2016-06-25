<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.util.Properties" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/6/15
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Properties pro = new Properties();
    try{
        pro.load(request.getServletContext().getResourceAsStream("/WEB-INF/host.properties"));
    }
    catch(FileNotFoundException e){
        out.println(e);
    }
    catch(IOException e){out.println(e);}
    String host = pro.getProperty("host");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + host
            //+ ":" + request.getServerPort()
            + path + "/";
%>
﻿<!DOCTYPE html>
<html>
<head>
    <title>认证页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="<%=basePath%>resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>files/authen/styles.css" type="text/css" rel="stylesheet"/>
    <script src="<%=basePath%>resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="<%=basePath%>resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/axQuery.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/globals.js"></script>
    <script src="<%=basePath%>resources/scripts/axutils.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/annotation.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/axQuery.std.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/doc.js"></script>
    <script src="<%=basePath%>data/document.js"></script>
    <script src="<%=basePath%>resources/scripts/messagecenter.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/events.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/action.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/expr.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/geometry.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/flyout.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/ie.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/model.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/repeater.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/sto.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/utils.temp.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/variables.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/drag.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/move.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/visibility.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/style.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/adaptive.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/tree.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/init.temp.js"></script>
    <script src="<%=basePath%>files/authen/data.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/legacy.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/viewer.js"></script>
    <script src="<%=basePath%>js/plupload/js/plupload.full.min.js"></script>
    <script type="text/javascript">
        $axure.utils.getTransparentGifPath = function () {
            return 'resources/images/transparent.gif';
        };
        $axure.utils.getOtherPath = function () {
            return 'resources/Other.html';
        };
        $axure.utils.getReloadPath = function () {
            return 'resources/reload.html';
        };
        function authenFormSubmit() {
            var idnum = $("#u19_input").attr("value");
            var path1 = $("#u34_input").attr("value");
            var path2 = $("#u39_input").attr("value");
            var path3 = $("#u44_input").attr("value");
            if (isCardNo(idnum)===true&&(path1!==null&&path1!==''&&path1!==undefined)
                    &&(path2!==null&&path2!==''&&path2!==undefined)
                    &&(path3!==null&&path3!==''&&path3!==undefined)){
                document.getElementById("form_authen").submit();
            }else {
                if(isCardNo(idnum) === false){
                    alert("身份证号码输入不合法");
                    return;
                }
                if(path1==null||path1==''||path1==undefined){
                    alert("请上传身份证正面照片！");
                    return;
                }
                if (path2==null||path2==''||path2==undefined){
                    alert("请上传身份证反面照片！");
                    return;
                }
                if (path3==null||path3==''||path3==undefined){
                    alert("请上传手持身份证照片！");
                    return;
                }
            }
        }
    </script>
</head>
<body>
<div id="base" class="">

    <!-- 页眉 (Dynamic Panel) -->
    <div id="u0" class="ax_dynamic_panel" data-label="页眉">
        <div id="u0_state0" class="panel_state" data-label="State1">
            <div id="u0_state0_content" class="panel_state_content">

                <!-- Unnamed (Shape) -->
                <div id="u1" class="ax_shape">
                    <img id="u1_img" class="img " src="<%=basePath%>images/register/u1.png"/>
                    <!-- Unnamed () -->
                    <div id="u2" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u3" class="ax_image">
                    <img id="u3_img" class="img " src="<%=basePath%>images/register/u3.png"/>
                    <!-- Unnamed () -->
                    <div id="u4" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u5" class="ax_h2">
                    <img id="u5_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u6" class="text">
                        <p style="font-size:24px;"><span style="font-size:24px;">快递</span><span style="font-size:24px;">实名</span>
                        </p>
                        <p style="font-size:12px;"><span style="font-size:12px;">E</span><span style="font-size:12px;">XPRESS</span><span
                                style="font-size:12px;">&nbsp;</span><span style="font-size:12px;">REAL NAME</span></p>
                    </div>
                </div>

                <!-- Unnamed (Vertical Line) -->
                <div id="u7" class="ax_vertical_line">
                    <img id="u7_start" class="img " src="<%=basePath%>resources/images/transparent.gif" alt="u7_start"/>
                    <img id="u7_end" class="img " src="<%=basePath%>resources/images/transparent.gif" alt="u7_end"/>
                    <img id="u7_line" class="img " src="<%=basePath%>images/register/u7_line.png" alt="u7_line"/>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u8" class="ax_paragraph">
                    <img id="u8_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u9" class="text">
                        <p><span>认证</span></p>
                    </div>
                </div>

                <!-- Link (Shape) -->
                <div id="u10" class="ax_shape" data-label="Link">
                    <img id="u10_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u11" class="text">
                        <p><span>我的账户</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 认证内容 (Dynamic Panel) -->
    <div id="u12" class="ax_dynamic_panel" data-label="认证内容">
        <div id="u12_state0" class="panel_state" data-label="State1">
            <div id="u12_state0_content" class="panel_state_content">

                <form id="form_authen" action="<%=basePath%>admin/doAuthen.do">
                    <!-- Unnamed (Vertical Line) -->
                    <div id="u13" class="ax_vertical_line">
                        <img id="u13_start" class="img " src="<%=basePath%>resources/images/transparent.gif"
                             alt="u13_start"/>
                        <img id="u13_end" class="img " src="<%=basePath%>resources/images/transparent.gif"
                             alt="u13_end"/>
                        <img id="u13_line" class="img " src="<%=basePath%>images/authen/u13_line.png" alt="u13_line"/>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u14" class="ax_paragraph">
                        <img id="u14_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u15" class="text">
                            <p><span>姓名</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u16" class="ax_paragraph">
                        <img id="u16_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u17" class="text">
                            <p><span>身份证号</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u18" class="ax_text_field">
                        <input id="u18_input" type="text" name="realname" value=""/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u19" class="ax_text_field">
                        <input id="u19_input" type="text" name="idnum" value="" onblur="checkIdnum()"/>
                    </div>
                </form>
                <!-- Unnamed (Shape) -->
                <div id="u20" class="ax_paragraph">
                    <img id="u20_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u21" class="text">
                        <p><span>说明:</span></p>
                        <p><span>&nbsp;</span></p>
                        <p>
                            <span>&nbsp; &nbsp; </span><span>初次进行实名认证,请准备身份证正反两面照片、手持身份证正面照片一张。待人工审核完成后将结果以唯一标识二维码的形式返回。</span>
                        </p>
                        <p><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span>图片格式:JPG</span></p>
                        <p>
                            <span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span>分辨率:大于111</span><span>×111</span>
                        </p>
                        <p><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 图像尺寸：小于5M</span></p>
                        <p><span>&nbsp;</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u22" class="ax_paragraph">
                    <img id="u22_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u23" class="text">
                        <p><span>身份证正面照</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u24" class="ax_paragraph">
                    <img id="u24_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u25" class="text">
                        <p><span>身份证</span><span>反</span><span>面照</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u26" class="ax_paragraph">
                    <img id="u26_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u27" class="text">
                        <p><span>手持</span><span>身份证</span><span>照</span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u28" class="ax_image">
                    <img id="u28_img" class="img " src="<%=basePath%>images/authen/sfzz.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u29" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u30" class="ax_image">
                    <img id="u30_img" class="img " src="<%=basePath%>images/authen/sfzf.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u31" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u32" class="ax_image">
                    <img id="u32_img" class="img " src="<%=basePath%>images/authen/sfzs.jpg"/>
                    <!-- Unnamed () -->
                    <div id="u33" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u34" class="ax_text_field">
                    <input id="u34_input" type="text" name="path1" value=""/>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u35" class="ax_shape">
                    <img id="u35_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u36" class="text">
                        <%--<p><span>浏览</span></p>--%>
                        <button id="browse1" style="width: 100%; height: 100%">浏览</button>
                    </div>

                </div>

                <!-- Unnamed (Shape) -->
                <div id="u37" class="ax_shape">
                    <img id="u37_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u38" class="text">
                        <%--<p><span>上传</span></p>--%>
                        <button id="upload1" style="width: 100%; height: 100%">上传</button>
                    </div>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u39" class="ax_text_field">
                    <input id="u39_input" type="text" name="path1" value=""/>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u40" class="ax_shape">
                    <img id="u40_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u41" class="text">
                        <%--<p><span>浏览</span></p>--%>
                        <button id="browse2" style="width: 100%; height: 100%">浏览</button>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u42" class="ax_shape">
                    <img id="u42_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u43" class="text">
                        <%--<p><span>上传</span></p>--%>
                        <button id="upload2" style="width: 100%; height: 100%">上传</button>
                    </div>
                </div>

                <!-- Unnamed (Text Field) -->
                <div id="u44" class="ax_text_field">
                    <input id="u44_input" type="text" name="path1" value=""/>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u45" class="ax_shape">
                    <img id="u45_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u46" class="text">
                        <%--<p><span>浏览</span></p>--%>
                        <button id="browse3" style="width: 100%; height: 100%">浏览</button>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u47" class="ax_shape">
                    <img id="u47_img" class="img " src="<%=basePath%>images/authen/u35.png"/>
                    <!-- Unnamed () -->
                    <div id="u48" class="text">
                        <%--<p><span>上传</span></p>--%>
                        <button id="upload3" style="width: 100%; height: 100%">上传</button>
                    </div>
                </div>
                <div style="position: relative; left: 720px; top: 410px;">
                    <input type="button" name="authen_submit" id="authen_submit" value="提交"
                           style="width:50px; height:22px;" onclick="authenFormSubmit()">

                </div>


                <!-- Unnamed (Horizontal Line) -->
                <div id="u49" class="ax_horizontal_line">
                    <img id="u49_start" class="img " src="<%=basePath%>resources/images/transparent.gif"
                         alt="u49_start"/>
                    <img id="u49_end" class="img " src="<%=basePath%>resources/images/transparent.gif" alt="u49_end"/>
                    <img id="u49_line" class="img " src="<%=basePath%>images/authen/u49_line.png" alt="u49_line"/>
                </div>

                <!-- Unnamed (Horizontal Line) -->
                <div id="u50" class="ax_horizontal_line">
                    <img id="u50_start" class="img " src="<%=basePath%>resources/images/transparent.gif"
                         alt="u50_start"/>
                    <img id="u50_end" class="img " src="<%=basePath%>resources/images/transparent.gif" alt="u50_end"/>
                    <img id="u50_line" class="img " src="<%=basePath%>images/authen/u49_line.png" alt="u50_line"/>
                </div>
            </div>
        </div>
    </div>


    <!-- 页脚 (Dynamic Panel) -->
    <div id="u51" class="ax_dynamic_panel" data-label="页脚">
        <div id="u51_state0" class="panel_state" data-label="State1">
            <div id="u51_state0_content" class="panel_state_content">

                <!-- Unnamed (Shape) -->
                <div id="u52" class="ax_shape">
                    <img id="u52_img" class="img " src="<%=basePath%>images/authen/u52.png"/>
                    <!-- Unnamed () -->
                    <div id="u53" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u54" class="ax_paragraph">
                    <img id="u54_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u55" class="text">
                        <p><span>快递实名制，让您的生活更加安全</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u56" class="ax_paragraph">
                    <img id="u56_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u57" class="text">
                        <p><span>快递实名制系统版权所</span><span>有&nbsp;&nbsp; 北京航天长峰科技工业集团有限公司</span><span>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    <%--var uploader1 = new plupload.Uploader({--%>
    <%--browse_button: 'browse1', //触发文件选择对话框的按钮，为那个元素id--%>
    <%--url: 'upload.php', //服务器端的上传页面地址--%>
    <%--flash_swf_url: '<%=basePath%>js/Moxie.swf', //swf文件，当需要使用swf方式进行上传时需要配置该参数--%>
    <%--silverlight_xap_url: '<%=basePath%>js/plupload/js/Moxie.xap' //silverlight文件，当需要使用silverlight方式进行上传时需要配置该参数--%>
    <%--});--%>

    var uploader1 = new plupload.Uploader({
        //这个是选择文件的button
        browse_button: 'browse1',
        url: '<%=basePath%>admin/upload1.do',
        flash_swf_url: '<%=basePath%>js/Moxie.swf',
        silverlight_xap_url: '<%=basePath%>js/plupload/js/Moxie.xap',
        filters: {
            mime_types: [ //只允许上传图片文件
                {title: "图片文件", extensions: "jpg,gif,png"}
            ]
        }
    });
    //在实例对象上调用init()方法进行初始化
    uploader1.init();

    //文件添加时，在容器里显示待上传的文件列表
    uploader1.bind('FilesAdded', function (uploader1, files) {
        // alert(files[0].size);
        var msgFlg = 0;
        for (var i = 0, len = files.length; i < len; i++) {
            if (files[i].size > 81920) {
                uploader1.files.splice(i, 1);
                msgFlg = 1;
            }
            else {
                !function (i) {
                    previewImage(files[i], function (imgsrc) {
//                        $('#u28_img').html($('#u28_img-list').html() +
//                                    '<div style="float:left"  id="' + files[i].id + '">'
//                                    + ' (' + plupload.formatSize(files[i].size) +
//                                    ')<a href="###" class="pic_delete" data-val=' + files[i].id +
//                                    '>删除</a><br/>' +
//                                '<img  width="90" height="60" src="' + imgsrc + '" name="' + files[i].name + '" /></div>');
                        //alert(imgsrc);
                        //alert(files[0].name);
                        $('#u28_img').attr("src", imgsrc);
                        //alert(files[0].name);
                        $('#u34_input').attr("value", files[0].name);
                    })
                }(i);
            }
        }
        if (msgFlg == 1) {
            alert("上传图片小于80K");
        }
    });
    //文件上传进度显示
    uploader1.bind('UploadProgress',
            function(uploader1, file) {
                $('#'+file.id).html("&nbsp;&nbsp;&nbsp;"+file.percent + "%");
            }
    );
    //单个文件上完成后事件
    uploader1.bind('FileUploaded',
            function(up, file,result) {
                $('#id'+file.id).val(result.response);
            }
    );
    //全部完成后的事件
//    uploader1.bind('UploadComplete',
//            function(up, files,result) {
//                alert("您选择的文件已经全部上传，总计共" + files.length + "个文件");
//            }
//    );

    //给"开始上传"按钮注册事件
    document.getElementById('u37').onclick = function(){
        var idnum = $("#u19_input").attr("value");
        //(idnum);
        if(idnum == ''|| idnum==undefined||idnum==null){
            alert("请先输入身份证号码");
        }else {
            //window.location.href = "admin/getIdnum.do?idnum="+idnum;
            $.ajax({
                type: 'GET',
                url: '<%=basePath%>admin/getIdnum.do?idnum='+idnum,
            })
            uploader1.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法
        }

    }

    function previewImage(file, callback) {//file为plupload事件监听函数参数中的file对象,callback为预览图片准备完成的回调函数
        if (!file || !/image\//.test(file.type)) return; //确保文件是图片
        if (file.type == 'image/gif') {//gif使用FileReader进行预览,因为mOxie.Image只支持jpg和png
            var fr = new mOxie.FileReader();
            fr.onload = function () {
                callback(fr.result);
                fr.destroy();
                fr = null;
            }
            fr.readAsDataURL(file.getSource());
        } else {
            var preloader = new mOxie.Image();
            preloader.onload = function () {
                //preloader.downsize(550, 400);//先压缩一下要预览的图片,宽300，高300
                var imgsrc = preloader.type == 'image/jpeg' ? preloader.getAsDataURL('image/jpeg', 80) : preloader.getAsDataURL(); //得到图片src,实质为一个base64编码的数据
                callback && callback(imgsrc); //callback传入的参数为预览图片的url
                preloader.destroy();
                preloader = null;
            };
            preloader.load(file.getSource());
        }
    }
    //    $("#update").bind('click', function () {
    //        if (uploader1.files.length < 1) {
    //            alert('请选择图片！');
    //            return false;
    //        }
    //        uploader1.start();
    //    })
    //    function previewImage(file, callback) {//file为plupload事件监听函数参数中的file对象,callback为预览图片准备完成的回调函数
    //        if (!file || !/image\//.test(file.type)) return; //确保文件是图片
    //        if (file.type == 'image/gif') {//gif使用FileReader进行预览,因为mOxie.Image只支持jpg和png
    //            var fr = new mOxie.FileReader();
    //            fr.onload = function () {
    //                callback(fr.result);
    //                fr.destroy();
    //                fr = null;
    //            }
    //            fr.readAsDataURL(file.getSource());
    //        } else {
    //            var preloader = new mOxie.Image();
    //            preloader.onload = function () {
    //                //preloader.downsize(550, 400);//先压缩一下要预览的图片,宽300，高300
    //                var imgsrc = preloader.type == 'image/jpeg' ? preloader.getAsDataURL('image/jpeg', 80) : preloader.getAsDataURL(); //得到图片src,实质为一个base64编码的数据
    //                callback && callback(imgsrc); //callback传入的参数为预览图片的url
    //                preloader.destroy();
    //                preloader = null;
    //            };
    //            preloader.load(file.getSource());
    //        }
    //    }

    //......
    //......

    //最后给"开始上传"按钮注册事件


    //uploader2
    var uploader2 = new plupload.Uploader({
        //这个是选择文件的button
        browse_button: 'browse2',
        url: '<%=basePath%>admin/upload2.do',
        flash_swf_url: '<%=basePath%>js/Moxie.swf',
        silverlight_xap_url: '<%=basePath%>js/plupload/js/Moxie.xap',
        filters: {
            mime_types: [ //只允许上传图片文件
                {title: "图片文件", extensions: "jpg,gif,png"}
            ]
        }
    });
    //在实例对象上调用init()方法进行初始化
    uploader2.init();

    //文件添加时，在容器里显示待上传的文件列表
    uploader2.bind('FilesAdded', function (uploader2, files) {
        // alert(files[0].size);
        var msgFlg = 0;
        for (var i = 0, len = files.length; i < len; i++) {
            if (files[i].size > 81920) {
                uploader2.files.splice(i, 1);
                msgFlg = 1;
            }
            else {
                !function (i) {
                    previewImage(files[i], function (imgsrc) {
//                        $('#u28_img').html($('#u28_img-list').html() +
//                                    '<div style="float:left"  id="' + files[i].id + '">'
//                                    + ' (' + plupload.formatSize(files[i].size) +
//                                    ')<a href="###" class="pic_delete" data-val=' + files[i].id +
//                                    '>删除</a><br/>' +
//                                '<img  width="90" height="60" src="' + imgsrc + '" name="' + files[i].name + '" /></div>');
                     //   alert(imgsrc);
                     //   alert(files[0].name);
                        $('#u30_img').attr("src", imgsrc);
                        $('#u39_input').attr("value", files[0].name);
                    })
                }(i);
            }
        }
        if (msgFlg == 1) {
            alert("上传图片小于80K");
        }
    });
    //文件上传进度显示
    uploader2.bind('UploadProgress',
            function(uploader2, file) {
                $('#'+file.id).html("&nbsp;&nbsp;&nbsp;"+file.percent + "%");
            }
    );
    //单个文件上完成后事件
    uploader2.bind('FileUploaded',
            function(up, file,result) {
                $('#id'+file.id).val(result.response);
            }
    );
    //全部完成后的事件
//    uploader1.bind('UploadComplete',
//            function(up, files,result) {
//                alert("您选择的文件已经全部上传，总计共" + files.length + "个文件");
//            }
//    );

    //给"开始上传"按钮注册事件
    document.getElementById('u42').onclick = function(){
        var idnum = $("#u19_input").attr("value");
        //(idnum);
        if(idnum == ''|| idnum==undefined||idnum==null){
            alert("请先输入身份证号码");
        }else {
            //window.location.href = "admin/getIdnum.do?idnum="+idnum;
            $.ajax({
                type: 'GET',
                url: '<%=basePath%>admin/getIdnum.do?idnum='+idnum,
            })
            uploader2.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法
        }
    }
    //uploader3
    var uploader3 = new plupload.Uploader({
        //这个是选择文件的button

        browse_button: 'browse3',
        url: '<%=basePath%>admin/upload3.do',
        flash_swf_url: '<%=basePath%>js/Moxie.swf',
        silverlight_xap_url: '<%=basePath%>js/plupload/js/Moxie.xap',
        filters: {
            mime_types: [ //只允许上传图片文件
                {title: "图片文件", extensions: "jpg,gif,png"}
            ]
        }
    });
    //在实例对象上调用init()方法进行初始化
    uploader3.init();

    //文件添加时，在容器里显示待上传的文件列表
    uploader3.bind('FilesAdded', function (uploader3, files) {
        // alert(files[0].size);
        var msgFlg = 0;
        for (var i = 0, len = files.length; i < len; i++) {
            if (files[i].size > 81920) {
                uploader3.files.splice(i, 1);
                msgFlg = 1;
            }
            else {
                !function (i) {
                    previewImage(files[i], function (imgsrc) {
//                        $('#u28_img').html($('#u28_img-list').html() +
//                                    '<div style="float:left"  id="' + files[i].id + '">'
//                                    + ' (' + plupload.formatSize(files[i].size) +
//                                    ')<a href="###" class="pic_delete" data-val=' + files[i].id +
//                                    '>删除</a><br/>' +
//                                '<img  width="90" height="60" src="' + imgsrc + '" name="' + files[i].name + '" /></div>');
                        //alert(imgsrc);
                        //alert(files[0].name);
                        $('#u32_img').attr("src", imgsrc);
                        $('#u44_input').attr("value", files[0].name);
                    })
                }(i);
            }
        }
        if (msgFlg == 1) {
            alert("上传图片小于80K");
        }
    });
    //文件上传进度显示
//    uploader3.bind('UploadProgress',
//            function(uploader3, file) {
//                $('#'+file.id).html("&nbsp;&nbsp;&nbsp;"+file.percent + "%");
//            }
//    );
    //单个文件上完成后事件
    uploader3.bind('FileUploaded',
            function(up, file,result) {
                $('#id'+file.id).val(result.response);
            }
    );
    //全部完成后的事件
//    uploader3.bind('UploadComplete',
//            function(up, files,result) {
//                alert("您选择的文件已经全部上传，总计共" + files.length + "个文件");
//            }
//    );

    //给"开始上传"按钮注册事件
    document.getElementById('u47').onclick = function(){
        var idnum = $("#u19_input").attr("value");
        //(idnum);
        if(idnum == ''|| idnum==undefined||idnum==null){
            alert("请先输入身份证号码");
        }else {
            //window.location.href = "admin/getIdnum.do?idnum="+idnum;
            $.ajax({
                type: 'GET',
                url: '<%=basePath%>admin/getIdnum.do?idnum='+idnum,
            })
            uploader3.start(); //调用实例对象的start()方法开始上传文件，当然你也可以在其他地方调用该方法
        }
    }

    function isCardNo(card)
    {
        // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if(reg.test(card) === false)
        {
            //alert("身份证输入不合法");
            return  false;
        }else {
            return true;
        }
    }

    function checkIdnum() {
        var idnum = $("#u19_input").attr("value");
        //alert(idnum);
        if (isCardNo(idnum) === false){
            alert("身份证号码输入不合法！");
        }
    }

</script>
</body>
</html>

