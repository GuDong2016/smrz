<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/5/5
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="padding: 5px;" id="main_ewm">
    <img id="erweima" src="<%=basePath%>erweima.gif">
</div>
</body>
</html>
