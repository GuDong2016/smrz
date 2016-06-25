package com.ccf.smrz.userinfo.service.impl;

import com.ccf.smrz.servieclient.base.LoginRequestBean;
import com.ccf.smrz.servieclient.base.RegisterRequestBean;
import com.ccf.smrz.servieclient.base.SmrzService;
import com.ccf.smrz.servieclient.base.SmrzServiceService;
import com.ccf.smrz.userinfo.dao.IUserInfoDao;
import com.ccf.smrz.userinfo.domain.UserInfo;
import com.ccf.smrz.userinfo.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.namespace.QName;
import java.net.URL;

/**
 * Created by dell on 2016/4/29.
 */
@Service("userInfoService")
public class UserInfoService implements IUserInfoService {
    @Autowired
    IUserInfoDao userInfoDao;
    @Override
    public String doLogin(LoginRequestBean loginRequestBean) {
        String ret = null;
        try {
            URL url = new URL("http://123.206.60.110:8080/smrz_webservice/service/smrz?wsdl");
            //1.Qnameqname是qualified name 的简写
            //2.构成：由名字空间(namespace)前缀(prefix)以及冒号(:),还有一个元素名称构成
            //由发布的wsdl可知namespace为http://server.ws.platform.whaty.com/，
            QName qname = new QName("main.smart.llj.webservice", "SmrzServiceService");
            javax.xml.ws.Service myservice = javax.xml.ws.Service.create(url, qname);

            SmrzService service = new SmrzServiceService().getPort(SmrzService.class);
             ret = service.userLogin(loginRequestBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    @Override
    public String doRegister(RegisterRequestBean registerRequestBean) {
        String ret = null;
        try {
            URL url = new URL("http://123.206.60.110:8080/smrz_webservice/service/smrz?wsdl");
            //1.Qnameqname是qualified name 的简写
            //2.构成：由名字空间(namespace)前缀(prefix)以及冒号(:),还有一个元素名称构成
            //由发布的wsdl可知namespace为http://server.ws.platform.whaty.com/，
            QName qname = new QName("main.smart.llj.webservice", "SmrzServiceService");
            javax.xml.ws.Service myservice = javax.xml.ws.Service.create(url, qname);

            SmrzService service = new SmrzServiceService().getPort(SmrzService.class);
            ret = service.userRegister(registerRequestBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    @Override
    public int updatePassword(UserInfo userInfo) {
        return this.userInfoDao.updatePassword(userInfo);
    }
}
