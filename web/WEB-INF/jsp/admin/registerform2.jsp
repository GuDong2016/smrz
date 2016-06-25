<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/6/14
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Properties pro = new Properties();
    try {
        pro.load(request.getServletContext().getResourceAsStream("/WEB-INF/host.properties"));
    } catch (FileNotFoundException e) {
        out.println(e);
    } catch (IOException e) {
        out.println(e);
    }
    String host = pro.getProperty("host");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + host
            //+ ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>注册页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="<%=basePath%>resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>files/register/styles.css" type="text/css" rel="stylesheet"/>
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
    <script src="<%=basePath%>files/register/data.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/legacy.js"></script>
    <script src="<%=basePath%>resources/scripts/axure/viewer.js"></script>
    <script type="text/javascript">
        $axure.utils.getTransparentGifPath = function () {
            return '<%=basePath%>resources/images/transparent.gif';
        };
        $axure.utils.getOtherPath = function () {
            return '<%=basePath%>resources/Other.html';
        };
        $axure.utils.getReloadPath = function () {
            return '<%=basePath%>resources/reload.html';
        };

        var code = '';

        function getPhoneCode() {
            // alert(eval(document.getElementById("u29_input")).value);
            var phone = eval(document.getElementById("u29_input")).value;
            // alert("getphonecode");
            if (phone == null || phone == undefined || phone == '') {
                alert("请输入手机号码");
            } else {
                $.ajax({
                    type: "post",
                    url: "<%=basePath%>admin/getPhoneCode.do?phone=" + phone,
                    success: function (data) {
                        // $("#view").html(msg);
                        // alert(data);
                        var obj = eval('(' + data + ')');
                        //  alert(obj.toJSONString);
                        // alert(obj.phonecode);
                        // alert(obj.msg);
                        code = obj.phonecode;
                    },
                    error: function () {
                        alert("获取验证码失败，请重试");
                    }
                });
            }
        }
        function register_submit() {
            var phone = $("#u29_input").attr("value");
            var password = $("#u42_input").attr("value");
            var repassword = $("#u45_input").attr("value");
           // alert(password);
            //alert(repassword);
            if (phone !== null) {
                if (phone.length !== 11 || (!(phone.match(/^1[3|4|5|7|8][0-9]\d{4,8}$/)))) {
                    alert("请输入正确的手机号！");
                } else {
                    $.ajax({
                        type: "GET",
                        url: "<%=basePath%>admin/getPhone.do",
                        data: {phone: phone},
                        dataType: "json",
                        success: function (data) {
                            //var obj = eval("("+ data + ")");
                            // alert(data.msg);
                            var password = $("#u42_input").attr("value");
                            var repassword = $("#u45_input").attr("value");
                            if (data.msg === "1") {
                                alert("手机号已注册！");
                            } else if (data.msg === "0") {
                                alert("请输入手机号");
                            }
                            else if (data.msg === "2" && (password !== null || password !== undefined || password !== '')
                                    && (repassword !== null || repassword !== undefined || repassword !== '') && password === repassword) {
                                var phonecode = eval(document.getElementById("u39_input")).value;
                                var phone = eval(document.getElementById("u29_input")).value;
                                var password = eval(document.getElementById("u42_input")).value;
                                var repassword = eval(document.getElementById("u45_input")).value;
                                //alert(phonecode);
                                if (phonecode == '' || (phonecode != code) || phonecode == undefined || phonecode == '') {
                                    alert("请输入正确的手机验证码！");
                                } else if (phone == null || phone == undefined || phone == '') {
                                    alert("手机号不能为空");
                                } else if (password == null || password == undefined || password == '') {
                                    alert("密码不能为空");
                                } else if (repassword == null || repassword == undefined || repassword == '') {
                                    alert("请确认密码");
                                } else if (password !== repassword) {
                                    alert("两次输入密码不一样");
                                } else {
                                    document.getElementById("register_form").submit();
                                }
//            if (phonecode == code && phonecode !== null && phonecode !== undefined && phonecode !== '') {
//                document.getElementById("register_form").submit();
//            } else {
//                alert("请输入正确的手机验证码！");
//            }
                            }
                            else if (password === null || password === undefined || password === '') {
                                alert("请输入密码");
                            } else if (repassword === null || repassword === undefined || repassword === '') {
                                alert("请确认密码");
                            } else if (password !== repassword) {
                                alert("两次输入的密码不一样");
                            }
                        }
                    });
                }
            }


        }

        function checkPhone() {
            var phone = $("#u29_input").attr("value");
            if (phone !== null) {
                if (phone.length !== 11 || (!(phone.match(/^1[3|4|5|7|8][0-9]\d{4,8}$/)))) {
                    alert("请输入正确的手机号！");
                } else {
                    $.ajax({
                        type: "GET",
                        url: "<%=basePath%>admin/getPhone.do",
                        data: {phone: phone},
                        dataType: "json",
                        success: function (data) {
                            //var obj = eval("("+ data + ")");
                            // alert(data.msg);
                            if (data.msg === "1") {
                                alert("手机号已注册！");
                            } else if (data.msg === "0") {
                                alert("请输入手机号");
                            }
                        }
                    });
                }
            }
        }
        function checkpassword() {
            var password = $("#u42_input").attr("value");
            var repassword = $("#u45_input").attr("value");
            if (password !== repassword){
                alert("两次输入的密码不一样");
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
                        <p><span>欢迎注册</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u10" class="ax_paragraph">
                    <img id="u10_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u11" class="text">
                        <p><span>已有账号</span></p>
                    </div>
                </div>

                <!-- Link (Shape) -->
                <div id="u12" class="ax_shape" data-label="Link">
                    <img id="u12_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u13" class="text">
                        <p><span>请登录</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Unnamed (Dynamic Panel) -->
    <div id="u14" class="ax_dynamic_panel">
        <div id="u14_state0" class="panel_state" data-label="State1">
            <div id="u14_state0_content" class="panel_state_content">

                <!-- Unnamed (Image) -->
                <div id="u15" class="ax_image">
                    <img id="u15_img" class="img " src="<%=basePath%>images/register/u15.png"/>
                    <!-- Unnamed () -->
                    <div id="u16" class="text">
                        <p><span></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 页面内容 (Dynamic Panel) -->
    <div id="u17" class="ax_dynamic_panel" data-label="页面内容">
        <div id="u17_state0" class="panel_state" data-label="State1">
            <div id="u17_state0_content" class="panel_state_content">

                <!-- Unnamed (Flow Shape) -->
                <div id="u18" class="ax_flow_shape">
                    <img id="u18_img" class="img " src="<%=basePath%>images/register/u18.png"/>
                    <!-- Unnamed () -->
                    <div id="u19" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u20" class="ax_image">
                    <img id="u20_img" class="img " src="<%=basePath%>images/register/u20.png"/>
                    <!-- Unnamed () -->
                    <div id="u21" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u22" class="ax_paragraph">
                    <img id="u22_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u23" class="text">
                        <p style="font-size:16px;text-align:center;"><span
                                style="font-family:'宋体 Bold', '宋体';font-weight:700;font-size:16px;text-align:center;">声明</span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:center;">&nbsp; </span>
                        </p>
                        <p style="font-size:13px;text-align:center;"><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:center;">&nbsp; </span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:center;"></span>
                        </p>
                        <p style="font-size:13px;text-align:left;"><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">&nbsp; &nbsp; </span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">初次进行实名认证,请准备身份证正反两面照片、手持身份证正面</span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">照片一张。待人工审核完成后将结果以唯一标识二维码的形式返回。</span>
                        </p>
                        <p style="font-size:13px;text-align:left;"><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">&nbsp;</span>
                        </p>
                        <p style="font-size:13px;text-align:left;"><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">&nbsp; &nbsp; </span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">本网站个人身份信息注册仅作实名制收寄快递使用，信息严格保密，</span><span
                                style="font-family:'宋体 Regular', '宋体';font-weight:400;font-size:13px;text-align:left;">不会用作其它用途！请放心注册。</span>
                        </p>
                    </div>
                </div>

                <!-- Unnamed (Checkbox) -->
                <div id="u24" class="ax_checkbox">
                    <label for="u24_input">
                        <!-- Unnamed () -->
                        <div id="u25" class="text">
                            <p><span>同意 以上声明</span></p>
                        </div>
                    </label>
                    <input id="u24_input" type="checkbox" value="checkbox"/>
                </div>

                <!-- Unnamed (Horizontal Line) -->
                <div id="u26" class="ax_horizontal_line">
                    <img id="u26_start" class="img " src="<%=basePath%>resources/images/transparent.gif"
                         alt="u26_start"/>
                    <img id="u26_end" class="img " src="<%=basePath%>resources/images/transparent.gif" alt="u26_end"/>
                    <img id="u26_line" class="img " src="<%=basePath%>images/register/u26_line.png" alt="u26_line"/>
                </div>

                <!-- Unnamed (Shape) -->
                <form id="register_form" action="<%=basePath%>admin/doRegister2.do">
                    <div id="u27" class="ax_paragraph">
                        <img id="u27_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u28" class="text">
                            <p><span>手机号</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u29" class="ax_text_field">
                        <input id="u29_input" type="number" name="phone" value="" onblur="checkPhone()"/>
                    </div>

                    <!-- Unnamed (Droplist) -->
                    <div id="u30" class="ax_droplist">
                        <select id="u30_input">
                            <option selected value="86">86</option>
                        </select>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u31" class="ax_paragraph">
                        <img id="u31_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u32" class="text">
                            <p><span>手机</span><span>验证码</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u33" class="ax_paragraph">
                        <img id="u33_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u34" class="text">
                            <p><span>密码</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u35" class="ax_paragraph">
                        <img id="u35_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u36" class="text">
                            <p><span>确认</span><span>密码</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u37" class="ax_paragraph">
                        <img id="u37_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u38" class="text">
                            <p><span>电子邮箱</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u39" class="ax_text_field">
                        <input id="u39_input" type="text" value=""/>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u40" class="ax_shape" onclick="getPhoneCode()">
                        <img id="u40_img" class="img " src="<%=basePath%>images/register/u40.png"/>
                        <!-- Unnamed () -->
                        <div id="u41" class="text">
                            <p><span>获取验证码</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u42" class="ax_text_field">
                        <input id="u42_input" type="password" name="password" value=""/>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u43" class="ax_paragraph">
                        <img id="u43_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u44" class="text">
                            <p><span>请填写8-16位密码,密码必须由英文及数字组成</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u45" class="ax_text_field">
                        <input id="u45_input" type="password" value="" onblur="checkpassword()"/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u46" class="ax_text_field">
                        <input id="u46_input" type="email" name="mail" value=""/>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u47" class="ax_shape" onclick="register_submit()">
                        <img id="u47_img" class="img " src="<%=basePath%>images/register/u47.png"/>
                        <!-- Unnamed () -->
                        <div id="u48" class="text">
                            <p><span>下一步</span></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 页脚 (Dynamic Panel) -->
    <div id="u49" class="ax_dynamic_panel" data-label="页脚">
        <div id="u49_state0" class="panel_state" data-label="State1">
            <div id="u49_state0_content" class="panel_state_content">

                <!-- Unnamed (Shape) -->
                <div id="u50" class="ax_paragraph">
                    <img id="u50_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u51" class="text">
                        <p><span>快递实名制，让您的生活更加安全</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u52" class="ax_paragraph">
                    <img id="u52_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u53" class="text">
                        <p><span>快递实名制系统版权所</span><span>有&nbsp;&nbsp; 北京航天长峰科技工业集团有限公司</span><span>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 手机客户端二维码 (Dynamic Panel) -->
    <div id="u54" class="ax_dynamic_panel" data-label="手机客户端二维码">
        <div id="u54_state0" class="panel_state" data-label="State1">
            <div id="u54_state0_content" class="panel_state_content">

                <!-- Unnamed (Image) -->
                <div id="u55" class="ax_image">
                    <img id="u55_img" class="img " src="<%=basePath%>images/index/u32.png"/>
                    <!-- Unnamed () -->
                    <div id="u56" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u57" class="ax_paragraph">
                    <img id="u57_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u58" class="text">
                        <p><span>下载手机</span></p>
                        <p><span>客户端</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 微信公众号 (Dynamic Panel) -->
    <div id="u59" class="ax_dynamic_panel" data-label="微信公众号">
        <div id="u59_state0" class="panel_state" data-label="State1">
            <div id="u59_state0_content" class="panel_state_content">

                <!-- Unnamed (Image) -->
                <div id="u60" class="ax_image">
                    <img id="u60_img" class="img " src="<%=basePath%>images/index/u32.png"/>
                    <!-- Unnamed () -->
                    <div id="u61" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u62" class="ax_paragraph">
                    <img id="u62_img" class="img " src="<%=basePath%>resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u63" class="text">
                        <p><span>关注微信</span></p>
                        <p><span>公众号</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
</body>
</html>

