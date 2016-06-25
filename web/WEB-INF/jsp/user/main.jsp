<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/4/29
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
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
<!DOCTYPE html>
<html>
<head>
    <title>物流实名制认证系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/demo/demo.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-easyui/jquery.easyui.min.js"></script>

    <script>
        function toHome() {
            /*document.getElementById('main_text2').style.display="none";
            document.getElementById('main_text').display="";*/
            $("#main_text2").hide();
            $("#main_text").show();
            $("#main_ewm").hide();
        }
        function toMessage() {
            /*document.getElementById('main_text').display="none";
            document.getElementById('main_text2').display="";*/
            $("#main_text").hide();
           $("#main_text2").show();
            $("#main_ewm").hide();
        }
        function toEWM(){
            $("#erweima").attr("src", "<%=basePath%>erweima.gif");
            $("#main_text").hide();
            $("#main_text2").hide();
            $("#main_ewm").show();
        }
    </script>
</head>
<body>
<h2>欢迎进入物流实名制认证系统</h2>
<div style="margin:20px 0;"></div>
<div class="easyui-panel"  style="padding:5px; height: 800px;">
    <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="toHome()" >首页</a>
   <%-- <a href="#" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-edit'">消息</a>--%>
    <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="toMessage()">消息</a>
    <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="toEWM()">我的二维码</a>
    <div style="height: 10px"></div>
    <div class="easyui-panel" style="padding:5px;">
        <div id="ta"></div>
        </div>
    <div  style="padding:5px; " id="main_text">
        <a >您的认证申请我们已经收到，请耐心等待我们审核，也可以关注下方二维码实时查询审核动态。</a>

    </div>
    <div  style="display: none;padding: 5px;" id="main_text2">
        <a >暂时没有消息</a>
    </div>
    <div style="display: none;padding: 5px;" id="main_ewm">
        <img id="erweima" src="">
    </div>

</div>
<%--<div id="mm1" style="width:150px;">
    <div data-options="iconCls:'icon-undo'">Undo</div>
    <div data-options="iconCls:'icon-redo'">Redo</div>
    <div class="menu-sep"></div>
    <div>未读消息</div>
   <div>已读消息</div>

    <div class="menu-sep"></div>
    <div>
        <span>Toolbar</span>
        <div>
            <div>Address</div>
            <div>Link</div>
            <div>Navigation Toolbar</div>
            <div>Bookmark Toolbar</div>
            <div class="menu-sep"></div>
            <div>New Toolbar...</div>
        </div>
    </div>
    <div data-options="iconCls:'icon-remove'">Delete</div>
    <div>Select All</div>
</div>--%>
</body>
</html>
