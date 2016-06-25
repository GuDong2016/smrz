<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/5/5
  Time: 16:54
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
    <title>Title</title>
</head>
<body>
<div style="height: 5px;width: 100%"></div>
<a style="font-size: 20px; font-weight: bold">     此二维码可以作为您寄件时的身份标识，向快递员出示该二维码无需身份证即可寄送快递</a>
<div style="padding: 5px;height: 80%; position: absolute; top: 40%;left: 30%" align="center" id="main_ewm">
    <img id="erweima" src="<%=basePath%>erweima.gif">
</div>
</body>
</html>
