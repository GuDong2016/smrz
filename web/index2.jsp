<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/4/29
  Time: 8:26
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
    <title>物流实名制认证系统</title>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body onload="hideForm()">
<div align="center" style="position: absolute; top: 40%;left: 40%; transform: translate(-40%,-40%)">
    <section>
        <div class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
            <button type="button" class="btn btn-default btn-lg" onclick="showRegisterForm()">新用户</button>

            <strong class="joiner"> &nbsp;/&nbsp; </strong>

            <button type="button" class="btn btn-default btn-lg" onclick="showForm()">老用户</button>
        </div><!-- morph-button -->
    </section>
</div>

<div id="loginModal" class="modal none" style="position: absolute; top: 40%;left: 40%; transform: translate(-40%,-40%)">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"></button>
                <h1 class="text-center text-primary">登录</h1>
            </div>
            <ul class="nav nav-tabs" id="loginform">
                <li class="active">
                    <a href="#login_zh"  data-toggle="tab">账号登陆</a>
                </li>
                <li>
                    <a href="#login_dt"  data-toggle="tab">动态密码登录</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="login_zh">
            <div class="modal-body">
                <form action="<%=basePath%>admin/doLogin.do" class="form col-md-12 center-block">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control input-lg" placeholder="手机号/身份证号/电子邮件">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control input-lg" placeholder="登录密码">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-lg btn-block">立刻登录</button>
                        <span><a href="#">找回密码</a></span>
                    </div>
                </form>
            </div>
                </div>
                <div class="tab-pane" id="login_dt">
                    <div class="modal-body">
                        <form action="" class="form col-md-12 center-block">
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" placeholder="手机号">
                                <input type="button" value="获取动态密码">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control input-lg" placeholder="动态密码">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-primary btn-lg btn-block">立刻登录</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<script>


    function hideForm() {
        //$('#loginModal').modal('hide');
        document.getElementById('loginModal').style.display="none";

    }
    
    function showForm() {
        //$('#loginModal').modal('show');
        document.getElementById('loginModal').style.display="block";
    }
    
    function showLoginForm() {
        //window.location.href="<%=basePath%>admin/showLoginForm.do";
    }

    function showRegisterForm() {
        window.location.href="<%=basePath%>admin/showRegisterForm.do";
    }

</script>
</body>

</html>
