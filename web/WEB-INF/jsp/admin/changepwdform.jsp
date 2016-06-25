<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/5/5
  Time: 17:33
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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/demo/demo.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-easyui/jquery.easyui.min.js"></script>
</head>
<body>


<div style="margin:20px 0;height: 60px;width: auto"></div>
<div align="center">
    <div class="easyui-panel" title="ChangePassword" style="width:400px;padding:30px 60px">

        <form id="updatepassword" method="post" novalidate>
            <div style="margin-bottom:20px">
                <div>Old Password:</div>
                <input type="password" class="easyui-textbox" id="old_password" name="old_password"
                       style="width:100%;height:45px">
            </div>
            <div style="margin-bottom:20px">
                <div> New Password:</div>
                <input class="easyui-textbox" id="password" name="password" type="password"
                       style="width:100%;height:45px">
            </div>
            <div style="margin-bottom:20px">
                <div>Confirm new Password:</div>
                <input class="easyui-textbox" id="confirm_password" name="confirm_password" type="password"
                       style="width:100%;height:45px">
            </div>
        </form>
        <div>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="updatePassword()"
               style="width:100%;height:32px">Save</a>
        </div>
    </div>
</div>
</body>
</html>
