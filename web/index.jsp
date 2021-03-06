<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/5/26
  Time: 9:32
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
<html>
<head>
    <title>首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/index/styles.css" type="text/css" rel="stylesheet"/>
    <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/axure/axQuery.js"></script>
    <script src="resources/scripts/axure/globals.js"></script>
    <script src="resources/scripts/axutils.js"></script>
    <script src="resources/scripts/axure/annotation.js"></script>
    <script src="resources/scripts/axure/axQuery.std.js"></script>
    <script src="resources/scripts/axure/doc.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/messagecenter.js"></script>
    <script src="resources/scripts/axure/events.js"></script>
    <script src="resources/scripts/axure/action.js"></script>
    <script src="resources/scripts/axure/expr.js"></script>
    <script src="resources/scripts/axure/geometry.js"></script>
    <script src="resources/scripts/axure/flyout.js"></script>
    <script src="resources/scripts/axure/ie.js"></script>
    <script src="resources/scripts/axure/model.js"></script>
    <script src="resources/scripts/axure/repeater.js"></script>
    <script src="resources/scripts/axure/sto.js"></script>
    <script src="resources/scripts/axure/utils.temp.js"></script>
    <script src="resources/scripts/axure/variables.js"></script>
    <script src="resources/scripts/axure/drag.js"></script>
    <script src="resources/scripts/axure/move.js"></script>
    <script src="resources/scripts/axure/visibility.js"></script>
    <script src="resources/scripts/axure/style.js"></script>
    <script src="resources/scripts/axure/adaptive.js"></script>
    <script src="resources/scripts/axure/tree.js"></script>
    <script src="resources/scripts/axure/init.temp.js"></script>
    <script src="files/index/data.js"></script>
    <script src="resources/scripts/axure/legacy.js"></script>
    <script src="resources/scripts/axure/viewer.js"></script>
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
    </script>
</head>
<body style="text-align: center">
<div id="base" class="">

    <!-- 登录框 (Dynamic Panel) -->
    <div id="u0" class="ax_dynamic_panel" data-label="登录框">
        <div id="u0_state0" class="panel_state" data-label="State1">
            <div id="u0_state0_content" class="panel_state_content">

                <!-- Unnamed (Shape) -->
                <div id="u1" class="ax_shape">
                    <img id="u1_img" class="img " src="images/index/u1.png"/>
                    <!-- Unnamed () -->
                    <div id="u2" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <form id="login_form" action="<%=basePath%>admin/doLogin.do">
                    <!-- Unnamed (Text Field) -->
                    <div id="u3" class="ax_text_field">
                        <input id="u3_input" name="username" type="text" value=""/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u4" class="ax_text_field">
                        <input id="u4_input" name="password" type="password" value=""/>
                    </div>

                    <!-- Unnamed (Text Field) -->
                    <div id="u5" class="ax_text_field">
                        <input id="u5_input" name="kaptcha" type="text" value=""/>
                    </div>

                    <!-- Unnamed (Checkbox) -->
                    <div id="u6" class="ax_checkbox">
                        <label for="u6_input">
                            <!-- Unnamed () -->
                            <div id="u7" class="text">
                                <p><span>下次自动登录</span></p>
                            </div>
                        </label>
                        <input id="u6_input" type="checkbox" value="checkbox"/>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u8" class="ax_paragraph">
                        <img id="u8_img" class="img " src="resources/images/transparent.gif"/>
                        <!-- Unnamed () -->
                        <div id="u9" class="text">
                            <p><span>忘记密码？</span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Image) -->
                    <div id="u10" class="ax_image">
                        <img id="kaptchaImage" class="img " src="<%=basePath%>admin/getKaptchaImage.do" onclick="changCode()"/>
                        <!-- Unnamed () -->
                        <div id="u11" class="text">
                            <p><span></span></p>
                        </div>
                    </div>

                    <!-- Unnamed (Shape) -->
                    <div id="u12" class="ax_shape">
                        <img id="u12_img" class="img " src="images/index/u12.png"/>
                        <!-- Unnamed () -->
                        <div id="u13" class="text" onclick="userLogin()">
                            <p><span>登</span><span>录</span></p>
                        </div>
                    </div>
                </form>

                <!-- Unnamed (Shape) -->
                <div id="u14" class="ax_paragraph">
                    <img id="u14_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u15" class="text">
                        <p><span>验证码:</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u16" class="ax_paragraph">
                    <img id="u16_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u17" class="text">
                        <%--<p><span>注册新用户</span></p>--%>
                        <a href="<%=basePath%>admin/showRegisterForm.do" style="color: white; text-decoration: none">注册新用户</a>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u18" class="ax_image">
                    <img id="u18_img" class="img " src="images/index/u18.png"/>
                    <!-- Unnamed () -->
                    <div id="u19" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Image) -->
                <div id="u20" class="ax_image">
                    <img id="u20_img" class="img " src="images/index/u20.png"/>
                    <!-- Unnamed () -->
                    <div id="u21" class="text">
                        <p><span></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 下方文字 (Dynamic Panel) -->
    <div id="u22" class="ax_dynamic_panel" data-label="下方文字">
        <div id="u22_state0" class="panel_state" data-label="State1">
            <div id="u22_state0_content" class="panel_state_content">

                <!-- Link (Shape) -->
                <div id="u23" class="ax_shape" data-label="Link">
                    <img id="u23_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u24" class="text">
                        <p><span>关于快递实名系统</span></p>
                    </div>
                </div>

                <!-- Link (Shape) -->
                <div id="u25" class="ax_shape" data-label="Link">
                    <img id="u25_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u26" class="text">
                        <p><span>联系我们</span></p>
                    </div>
                </div>

                <!-- Link (Shape) -->
                <div id="u27" class="ax_shape" data-label="Link">
                    <img id="u27_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u28" class="text">
                        <p><span>航天长峰</span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u29" class="ax_paragraph">
                    <img id="u29_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u30" class="text">
                        <p><span>快递实名系统版权所有</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 微信公众号 (Dynamic Panel) -->
    <div id="u31" class="ax_dynamic_panel" data-label="微信公众号">
        <div id="u31_state0" class="panel_state" data-label="State1">
            <div id="u31_state0_content" class="panel_state_content">

                <!-- Unnamed (Image) -->
                <div id="u32" class="ax_image">
                    <img id="u32_img" class="img " src="images/index/u32.png"/>
                    <!-- Unnamed () -->
                    <div id="u33" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u34" class="ax_paragraph">
                    <img id="u34_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u35" class="text">
                        <p><span>关注微信</span></p>
                        <p><span>公众号</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 手机客户端二维码 (Dynamic Panel) -->
    <div id="u36" class="ax_dynamic_panel" data-label="手机客户端二维码">
        <div id="u36_state0" class="panel_state" data-label="State1">
            <div id="u36_state0_content" class="panel_state_content">

                <!-- Unnamed (Image) -->
                <div id="u37" class="ax_image">
                    <img id="u37_img" class="img " src="images/index/u32.png"/>
                    <!-- Unnamed () -->
                    <div id="u38" class="text">
                        <p><span></span></p>
                    </div>
                </div>

                <!-- Unnamed (Shape) -->
                <div id="u39" class="ax_paragraph">
                    <img id="u39_img" class="img " src="resources/images/transparent.gif"/>
                    <!-- Unnamed () -->
                    <div id="u40" class="text">
                        <p><span>下载手机</span></p>
                        <p><span>客户端</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function userLogin() {
        document.getElementById('login_form').submit();
    }
    function changCode() {
        $("#kaptchaImage").attr("src", "<%=basePath%>admin/getKaptchaImage.do");
    }
</script>
</body>
</html>