package com.ccf.smrz.userinfo.dao;

import com.ccf.smrz.base.dao.IDao;
import com.ccf.smrz.userinfo.domain.UserInfo;
import org.springframework.stereotype.Repository;

/**
 * Created by dell on 2016/5/18.
 */
@Repository("userInfoDao")
public interface IUserInfoDao extends IDao {
    public int updatePassword(UserInfo userInfo);
}
