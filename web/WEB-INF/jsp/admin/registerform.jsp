<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/4/29
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>新用户注册</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script>
        function changeBtnStatus() {
           // alert(1);
            if (document.getElementById("yhxy").checked){
               // alert("111");
                document.getElementById('btn_subm').removeAttribute('disabled');
            }
        }
    </script>
</head>
<body>

<div class="panel panel-default" style="width: 40%;height: auto; position: absolute; top: 20%;left: 25%;translate(-20%,-25%)">
    <div class="panel-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <div align="center">用户协议</div>
                </h3>
            </div>
            <div class="panel-body" align="cneter">
                <div align="center">
                    <ul>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <div align="center">
                <input type="radio" id="yhxy" onchange="changeBtnStatus()">
                <a>我同意</a>
            </div>
        </div>

        <div style="height: 80px"></div>


        <div class="panel panel-default">

            <div class="panel-body">
                <form role="form" action="<%=basePath%>admin/doRegister.do">
                    <div class="form-group">
                        <label for="phone">手机号码：</label>
                        <input type="number" class="form-control" id="phone" name="phone"
                               placeholder="请输入手机号" required="required">
                        <input type="button" value="获取验证码">
                    </div>
                    <div class="form-group">
                        <label for="mail">验证码：</label>
                        <input type="text" class="form-control" id="vcode" name="vcode"
                               placeholder="请输入验证码" required="required">
                    </div>
                    <div class="form-group">
                        <label for="mail">邮箱（可选）：</label>
                        <input type="email" class="form-control" id="mail" name="mail"
                               placeholder="请输入邮箱">
                    </div>
                    <div class="form-group">
                        <label for="mail">姓名：</label>
                        <input type="text" class="form-control" id="realname" name="realname"
                               placeholder="请输入姓名" required="required">
                    </div>
                    <div class="form-group">
                        <label for="idnum">身份证号码：</label>
                        <input type="text" class="form-control" id="idnum" name="idnum"
                               placeholder="请输入身份证号码" required="required">
                    </div>

                    <div class="form-group">
                        <label for="password">密码：</label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="请输入密码" required="required">
                    </div>

                    <div class="form-group">
                        <label for="inputfile1">身份证正面图像</label>
                        <input type="file" id="inputfile1" required="required">
                    </div>
                    <div class="form-group">
                        <label for="inputfile2">身份证反面图像</label>
                        <input type="file" id="inputfile2" required="required">
                    </div>
                    <div class="form-group">
                        <label for="inputfile3">手持身份证图像</label>
                        <input type="file" id="inputfile3" required="required">
                    </div>

                    <button type="submit" id="btn_subm" class="btn btn-default" disabled="disabled">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>
