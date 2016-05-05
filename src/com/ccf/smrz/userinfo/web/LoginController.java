package com.ccf.smrz.userinfo.web;

import com.ccf.smrz.servieclient.base.LoginRequestBean;
import com.ccf.smrz.servieclient.base.RegisterRequestBean;
import com.ccf.smrz.userinfo.domain.UserInfo;
import com.ccf.smrz.userinfo.service.IUserInfoService;
import com.ccf.smrz.userinfo.service.impl.UserInfoService;
import com.google.gson.Gson;

import org.apache.commons.codec.Encoder;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dell on 2016/4/29.
 */
@Controller
@RequestMapping(value = "/admin")
public class LoginController {
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping(value = "/showLoginForm.do")
    public String showLoginForm() {
        return "admin/loginform";
    }

    @RequestMapping(value = "/showRegisterForm.do")
    public String showRegisterForm() {
        return "admin/registerform";
    }

    @RequestMapping(value = "/doRegister.do")
    public String doRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        RegisterRequestBean registerRequestBean = new RegisterRequestBean();
        registerRequestBean.setPassword(request.getParameter("password"));
        registerRequestBean.setPhone(request.getParameter("phone"));
        registerRequestBean.setIdnum(request.getParameter("idnum"));
        registerRequestBean.setMail(request.getParameter("mail"));
        registerRequestBean.setRealname(new String(request.getParameter("realname").getBytes("ISO-8859-1"), "UTF-8"));
        String flag = this.userInfoService.doRegister(registerRequestBean);
        if ("0000".equals(flag)) {
            String url = "http://123.206.60.110:8080/smrz_webservice/rest/userinfo/userinfo/";
            Map<String, String> map = new HashMap<String, String>();
            map.put("type", "phone");
            map.put("code", registerRequestBean.getPhone());
            Gson gson = new Gson();
            String str = gson.toJson(map);
            String encodeUrl = URLEncoder.encode(str,"UTF-8");
            url += encodeUrl;
            HttpClient httpClient = new DefaultHttpClient();
            HttpGet httpGet = new HttpGet(url);
            HttpResponse httpResponse = httpClient.execute(httpGet);

            HttpEntity entity = httpResponse.getEntity();
            String responeStr = null;
            if (entity != null) {
                InputStream instreams = entity.getContent();
                responeStr = convertStreamToString(instreams);
                httpGet.abort();
            }

            UserInfo userInfo = gson.fromJson(responeStr, UserInfo.class);
            request.getSession().setAttribute("userinfo", userInfo);
            return "user/main";
        } else {
            return "admin/registerform";
        }
    }

    @RequestMapping(value = "/doLogin.do")
    public String doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LoginRequestBean loginRequestBean = new LoginRequestBean();
        loginRequestBean.setPhone(request.getParameter("username"));
        loginRequestBean.setPassword(request.getParameter("password"));
        loginRequestBean.setLogintype("phone");
        String flag = this.userInfoService.doLogin(loginRequestBean);
        if ("8000".equals(flag.trim())) {
            String url = "http://123.206.60.110:8080/smrz_webservice/rest/userinfo/userinfo/";
            Map<String, String> map = new HashMap<String, String>();
            map.put("type", loginRequestBean.getLogintype());
            map.put("code", loginRequestBean.getPhone());
            Gson gson = new Gson();
            String str = gson.toJson(map);
            String encodeUrl = URLEncoder.encode(str,"UTF-8");
            url += encodeUrl;
            HttpClient httpClient = new DefaultHttpClient();
            HttpGet httpGet = new HttpGet(url);
            HttpResponse httpResponse = httpClient.execute(httpGet);

            HttpEntity entity = httpResponse.getEntity();
            String responeStr = null;
            if (entity != null) {
                InputStream instreams = entity.getContent();
                responeStr = convertStreamToString(instreams);
                httpGet.abort();
            }

            UserInfo userInfo = gson.fromJson(responeStr, UserInfo.class);
            request.getSession().setAttribute("userinfo", userInfo);
            return "user/main";
        } else {
            return "/index.jsp";
        }
    }


    public static String convertStreamToString(InputStream is) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }


}
