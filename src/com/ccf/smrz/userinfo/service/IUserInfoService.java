package com.ccf.smrz.userinfo.service;

import com.ccf.smrz.base.service.IService;
import com.ccf.smrz.servieclient.base.LoginRequestBean;
import com.ccf.smrz.servieclient.base.RegisterRequestBean;
import com.ccf.smrz.userinfo.domain.UserInfo;

/**
 * Created by dell on 2016/4/29.
 */
public interface IUserInfoService extends IService {
    public String doLogin(LoginRequestBean loginRequestBean);
    public String doRegister(RegisterRequestBean registerRequestBean);
    public int updatePassword(UserInfo userInfo);

}
