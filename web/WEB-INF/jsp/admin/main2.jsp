<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/5/5
  Time: 12:10
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
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>快递实名制认证系统</title>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/themes/icon.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-easyui/demo/demo.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-easyui/jquery.easyui.min.js"></script>
    <%-- <script type="text/javascript" src='<%=basePath%>js/outlook.js'></script>--%>

    <script type="text/javascript">
        function changePassword(title) {
            if ($("#tt").tabs("exists", title)) {
                $("#tt").tabs("select", title);
            } else {
                $('#tt').tabs('add', {
                    title: '修改密码',
                    href: '<%=basePath%>admin/changePassword.do',
                    closable: true
                });
            }
        }

        function updatePassword() {
            var pw = $("#password").val();
            var c_pw = $("#confirm_password").val();

            if (pw != c_pw) {
                alert("两次输入的密码不一样！");
            }
            else {
                $('#updatepassword').form('submit', {
                    url: '<%=basePath%>admin/updatePassword.do',
                    // data: email,
                    onSubmit: function () {
                        return $(this).form('validate');
                    },
                    success: function (result) {
                        var result = eval('(' + result + ')');
                        // alert(result);
                        //alert(result);
                        if (!result.success) {
                            // alert(result.success);
                            // alert(result.errorMsg);
                            //location.href = '<%=basePath%>admin/register.do';
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: result.errorMsg
                            });
                            alert(result.errorMsg);

                        } else {
                            alert("修改成功！");
                        }
                    }
                });
            }
        }

        function showEWM(title) {
            if ($("#tt").tabs("exists", title)) {
                $("#tt").tabs("select", title);
            } else {
                $('#tt').tabs('add', {
                    title: '我的二维码',
                    href: '<%=basePath%>admin/showEWM.do',
                    closable: true
                });
            }
        }

        function userinfo(title) {
            if ($("#tt").tabs("exists", title)) {
                $("#tt").tabs("select", title);
            } else {
                $('#tt').tabs('add', {
                    title: '个人信息管理',
                    href: '<%=basePath%>admin/changePassword.do',
                    closable: true
                });
            }
        }
    </script>

</head>
<body class="easyui-layout">
<div id="cc" class="easyui-layout" style="width:100%;height:95%;">
    <div data-options="region:'north',border:false" style="height:58px;">
        <%--<img alt="logo" src="images/logo.png" style="padding: 20px 0 0 20px;">--%>
        <%--<p aria-atomic="true">${userinfo.realname},欢迎物流实名制认证系统</p>--%>
        <img src="<%=basePath%>images/register/yemei4.png" style="background-size: contain">
    </div>
    <div data-options="region:'west',title:'菜单',split:true" style="width:200px;">
        <div id="aa" class="easyui-accordion" data-options="fit:true,border:false">
            <div title="信息管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">
                <a id="mailmanage" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true"
                   onclick="userinfo('个人信息管理')">个人信息管理</a><br/>
                <%--<a id="appmanage" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true"
                   onclick="appmanage('接入应用管理')">接入应用管理</a>--%>
            </div>
            <div title="我的二维码" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">
                <a id="myerweima" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true"
                   onclick="showEWM('我的二维码')">我的二维码</a>
            </div>
            <div title="设置" data-options="iconCls:'icon-reload'" style="padding:10px;">
                <a id="changePassword" href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true"
                   onclick="changePassword('修改密码')">修改密码</a> <br/>
                <%--<a href="#" class="easyui-linkbutton" data-options="plain:true">刷新系统缓存</a>--%>
            </div>
        </div>
    </div>

    <div data-options="region:'center',border:false,plain:true">
        <div id="tt" class="easyui-tabs" fit=true>
            <div title="首页" style="text-align: center;font-size: 24px;">
                <p>欢迎物流实名制认证系统</p>
            </div>
        </div>
    </div>
</div>
<div style="height: 100px;text-align: center;font-size: 12px;">
    <p>Created by 北京航天长峰科技工业集团有限公司 on 2016/05/01.</p>
</div>
</body>
</html>
