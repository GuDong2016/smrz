package com.ccf.smrz.userinfo.web;

import com.ccf.smrz.servieclient.base.LoginRequestBean;
import com.ccf.smrz.servieclient.base.RegisterRequestBean;
import com.ccf.smrz.userinfo.domain.AttachmentEntity;
import com.ccf.smrz.userinfo.domain.UserInfo;
import com.ccf.smrz.userinfo.service.IUserInfoService;
import com.ccf.smrz.userinfo.service.impl.UserInfoService;
import com.ccf.util.DateUtilZh;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.google.gson.Gson;

import org.apache.commons.codec.Encoder;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.DateUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.*;
import java.lang.invoke.MethodType;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.commons.io.FileUtils;

/**
 * Created by dell on 2016/4/29.
 */
@Controller
@RequestMapping(value = "/admin")
public class LoginController {

    private File file;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private Producer captchaProducer;

    @RequestMapping(value = "/showLoginForm.do")
    public String showLoginForm() {
        return "admin/loginform";
    }

    @RequestMapping(value = "/showRegisterForm.do")
    public String showRegisterForm() {
        return "admin/registerform2";
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
            String encodeUrl = URLEncoder.encode(str, "UTF-8");
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
            return "admin/registerform2";
        }
    }

    @RequestMapping(value = "/doRegister2.do")
    public String doRegister2(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String phone = null;
        String password = null;
        String mail = null;
        if (StringUtils.isNotBlank(request.getParameter("phone"))) {
            phone = request.getParameter("phone");
        }
        if (StringUtils.isNotBlank(request.getParameter("password"))) {
            password = request.getParameter("password");
        }
        if (StringUtils.isNotBlank(request.getParameter("mail"))) {
            mail = request.getParameter("mail");
        }

        Map<String, String> paraMap = new HashMap<String, String>();
        paraMap.put("phone", phone);
        paraMap.put("password", password);
        paraMap.put("mail", mail);
        UserInfo userInfo = new UserInfo();
        userInfo.setPhone(phone);
        userInfo.setPassword(password);
        userInfo.setMail(mail);
        request.getSession().setAttribute("userinfo", userInfo);

        String responseText = post("http://123.206.60.110:8080/smrz_webservice/rest/userinfo/register3", paraMap);
        if ("0000".equals(responseText)) {
            response.sendRedirect("showAuthenForm.do");
            return null;
            // return "admin/authen";
        } else {
            response.sendRedirect("showRegisterForm.do");
            return null;
            //return "admin/registerform2";
        }
    }

    @RequestMapping(value = "/showAuthenForm.do")
    public String doAuthen(HttpServletResponse response, HttpServletRequest request) {
        return "admin/authen";
    }

    @RequestMapping(value = "/doAuthen.do")
    public String doAuthen(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //request.setCharacterEncoding("utf-8");
        String realname = new String(request.getParameter("realname").getBytes("iso-8859-1"), "utf-8");
        String idnum = request.getParameter("idnum");
        String path1 = "/upload/andriod/" + (String) request.getSession().getAttribute("idcard_front");
        String path2 = "/upload/andriod/" + (String) request.getSession().getAttribute("idcard_back");
        String path3 = "/upload/andriod/" + (String) request.getSession().getAttribute("idcard_onhand");
        String phone = null;
        if (request.getSession().getAttribute("userinfo") == null) {
            response.sendRedirect("showAuthenForm.do");
            return null;
        }
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userinfo");
        phone = userInfo.getPhone();
        Map<String, String> paraMap = new HashMap<String, String>();
        paraMap.put("realname", realname);
        userInfo.setRealname(realname);
        paraMap.put("phone", phone);
        paraMap.put("idnum", idnum);
        userInfo.setIdnum(idnum);
        paraMap.put("path1", path1);
        paraMap.put("path2", path2);
        paraMap.put("path3", path3);
        request.getSession().setAttribute("userinfo", userInfo);
        String responseText = post("http://123.206.60.110/smrz_webservice/rest/userinfo/authen2", paraMap);
        System.out.println(realname);
        if ("5000".equals(responseText)) {
            //response.sendRedirect("showAuthenForm.do");
            return "admin/main2";
            // return "admin/authen";
        } else {
            response.sendRedirect("showAuthenForm.do");
            return null;
            //return "admin/registerform2";
        }
        // return null;
    }

//    @RequestMapping(value = "/getPhoneCode")
//    public String getPhoneCode(HttpServletRequest request, HttpServletResponse response){
//
//    }

    @RequestMapping(value = "/doLogin.do")
    public String doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String kaptcha = request.getParameter("kaptcha");
        String expected = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (!kaptcha.trim().equals(expected.trim())){
            return "/index";
        }
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
            String encodeUrl = URLEncoder.encode(str, "UTF-8");
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
            return "admin/main2";
        } else {
            return "/index";
        }
    }

    @RequestMapping(value = "/showEWM.do")
    public String showEWM() {
        return "erweima/erweima";
    }

    @RequestMapping(value = "/changePassword.do")
    public String showChangePasswordForm() {
        return "admin/changepwdform";
    }

    @RequestMapping(value = "/updatePassword.do")
    public void updatePassword(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        UserInfo userInfo = new UserInfo();
        userInfo = (UserInfo) request.getSession().getAttribute("userinfo");
        int tag = 0;
        if (userInfo == null) {
            map.put("success", false);
            map.put("errorMsg", "更新密码失败！");
        } else {
            String old_password = request.getParameter("old_password");
            if (!(old_password.equals(userInfo.getPassword()))) {
                map.put("success", false);
                map.put("errorMsg", "旧密码错误！");
                //return "admin/changepwdform";
            } else {
                String password = request.getParameter("password");
                userInfo.setPassword(password);
                userInfo.setUpdatetime(DateUtilZh.getFormattedDate(new Date()));
                int flag = this.userInfoService.updatePassword(userInfo);
                if (flag > 0) {
                    map.put("success", true);
                    map.put("errorMsg", "密码更新成功");
                    tag = 1;
                } else {
                    map.put("success", false);
                    map.put("errorMsg", "更新密码失败！");
                    //  return "admin/changepwdform";

                }
            }
        }
        Gson gson = new Gson();
        String str = gson.toJson(map);

        try {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(str);
        } catch (IOException e) {
            e.printStackTrace();
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

    @RequestMapping(value = "/getKaptchaImage.do")
    public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        System.out.println("******************验证码是: " + code + "******************");

        response.setDateHeader("Expires", 0);

        // Set standard HTTP/1.1 no-cache headers.
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");

        // Set standard HTTP/1.0 no-cache header.
        response.setHeader("Pragma", "no-cache");

        // return a jpeg
        response.setContentType("image/jpeg");

        // create the text for the image
        String capText = captchaProducer.createText();

        // store the text in the session
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

        // create the image with the text
        BufferedImage bi = captchaProducer.createImage(capText);
        ServletOutputStream out = response.getOutputStream();

        // write the data out
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
        return null;
    }

    @RequestMapping(value = "/getPhoneCode.do")
    public String getPhoneCode(HttpServletRequest request, HttpServletResponse response) {
        String phone = request.getParameter("phone");
        String url = "http://123.206.60.110:8080/smrz_webservice/rest/userinfo/phonecode";
        // http://123.206.60.110:8080/smrz_webservice/rest/userinfo/phonecode/18610522372
        String result = null;
        try {
            result = get(url, phone);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("msg", "success");
        map.put("phonecode", result);
        Gson gson = new Gson();
        String str = gson.toJson(map);
        response.setContentType("text/html;charset=UTF-8");
        try {
            response.getWriter().write(str);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/upload1.do", method = RequestMethod.POST)
    public void upload1(HttpServletRequest request, HttpServletResponse response) throws IOException {
        saveImgToFtp(request, response, "idcard_front");
    }

    @RequestMapping(value = "/upload2.do", method = RequestMethod.POST)
    public void upload2(HttpServletRequest request, HttpServletResponse response) throws IOException {
        saveImgToFtp(request, response, "idcard_back");
    }

    @RequestMapping(value = "/upload3.do", method = RequestMethod.POST)
    public void upload3(HttpServletRequest request, HttpServletResponse response) throws IOException {
        saveImgToFtp(request, response, "idcard_onhand");
    }

    @RequestMapping(value = "/getIdnum.do")
    public void getIdnum(HttpServletResponse response, HttpServletRequest request) {
        String idnum = request.getParameter("idnum");
        request.getSession().setAttribute("idnum", idnum);
    }

    @RequestMapping(value = "/getPhone.do")
    public String getPhone(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String> resultMap = new HashMap<String, String>();
        String phone = null;
        Gson gson = new Gson();
        if (StringUtils.isNotBlank(request.getParameter("phone"))) {
            phone = request.getParameter("phone");

            Map<String, String> paraMap = new HashMap<String, String>();
            paraMap.put("type", "phone");
            paraMap.put("code", phone);
            String info = gson.toJson(paraMap);

            //List<UserInfo> userInfoList = new ArrayList<UserInfo>();
            String userinfoResult = null;
            try {
                userinfoResult = get("http://123.206.60.110:8080/smrz_webservice/rest/userinfo/userinfo", info);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (StringUtils.isNotBlank(userinfoResult)){
                resultMap.put("msg", "1");//手机号已经注册
            }else {
                resultMap.put("msg", "2");//手机号码未注册
            }
        } else {
            resultMap.put("msg", "0");//手机号码为空;
        }

        //resultMap.put("msg", "1");

        String data = gson.toJson(resultMap);
        response.getWriter().write(data);
        return null;
    }

    public static String saveImgToFtp(HttpServletRequest request, HttpServletResponse response, String str) throws IOException {
        String idnum = (String) request.getSession().getAttribute("idnum");
        //初始化通用multipart解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        String resultStr = "";

        //判断请求中是否有文件上传
        if (!multipartResolver.isMultipart(request)) {
            //请求为空，直接返回
            return null;
        }

        //解析请求，将文件信息放到迭代器里
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
        Iterator<String> iter = multiRequest.getFileNames();

        //迭代文件，存放到某一路径里
        while (iter.hasNext()) {
            //取得上传文件
            MultipartFile file = multiRequest.getFile(iter.next());
            FTPClient ftpClient = new FTPClient();
            ftpClient.connect("123.206.60.110", 21);
            ftpClient.login("ccf", "ccf");
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
            ftpClient.changeWorkingDirectory("upload/andriod");
            ftpClient.enterLocalPassiveMode();
            if (null != file) {
                //取得当前上传文件的文件名称
                String myFileName = file.getOriginalFilename();
                String prefix = myFileName.substring(myFileName.lastIndexOf("."));

                ftpClient.storeFile(idnum + str + prefix, file.getInputStream());
                request.getSession().setAttribute(str, idnum + str + prefix);

            }
            break;
        }
        return resultStr;
    }

    public String getName(String myFileName) {
        //获取一个50以内的随机值
        Random ra = new Random();
        int raNum = ra.nextInt(100);
        //获取当前系统时间
        Long nowTime = System.currentTimeMillis();
        String resultName = nowTime + "" + raNum + myFileName;
        return resultName;

    }

    public String insertAttachInfo(String name, String path, MultipartFile file, String resultStr) {
        AttachmentEntity attachmentEntity = new AttachmentEntity();
        Long attachmentId = null;
        attachmentEntity.setAttachmentId(attachmentId);
        attachmentEntity.setAttachmentName(name);
        attachmentEntity.setAttachmentRealName(file.getOriginalFilename());
        attachmentEntity.setAttachmentPath(path);
        attachmentEntity.setAttachmentSize(file.getSize() + "");
        //  attachmentEntity.setCreateBy("admin");
        // attachmentEntity.setLastUpdateBy("admin");
        // attachmentService.addAttachmentInfo(attachmentEntity);
        resultStr += attachmentId + ",";
        return resultStr;
    }

    public static String post(String url, Map<String, String> paramsMap) {
        CloseableHttpClient client = HttpClients.createDefault();
        String responseText = "";
        CloseableHttpResponse response = null;
        try {
            HttpPost method = new HttpPost(url);
            if (paramsMap != null) {
                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
                for (Map.Entry<String, String> param : paramsMap.entrySet()) {
                    NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
                    paramList.add(pair);
                }
                method.setEntity(new UrlEncodedFormEntity(paramList, "UTF-8"));
            }
            response = client.execute(method);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                responseText = EntityUtils.toString(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return responseText;
    }


    public static String get(String url, String para) throws UnsupportedEncodingException {
        String uriAPI = url + "/" + URLEncoder.encode(para, "utf-8");
        //String result= "";
//    	HttpGet httpRequst = new HttpGet(URI uri);
//    	HttpGet httpRequst = new HttpGet(String uri);
//    	创建HttpGet或HttpPost对象，将要请求的URL通过构造方法传入HttpGet或HttpPost对象。
        CloseableHttpClient client = HttpClients.createDefault();
        String responseText = "";
        CloseableHttpResponse response = null;
        try {
            HttpGet method = new HttpGet(uriAPI);
//            if (paramsMap != null) {
//                List<NameValuePair> paramList = new ArrayList<NameValuePair>();
//                for (Map.Entry<String, String> param : paramsMap.entrySet()) {
//                    NameValuePair pair = new BasicNameValuePair(param.getKey(), param.getValue());
//                    paramList.add(pair);
//                }
//                method.setEntity(new UrlEncodedFormEntity(paramList, "UTF-8"));
//            }

            response = client.execute(method);
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                responseText = EntityUtils.toString(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return responseText;
    }

//    public File getFile() {
//        return file;
//    }
//
//    public void setFile(File file) {
//        this.file = file;
//    }
}
