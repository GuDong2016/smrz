package com.ccf.smrz.base.domain;

import java.io.Serializable;

/**
 * Created by Grant on 15/9/28.
 */

public class BaseModel implements Serializable {
    private String id;
    private String ifuse;
    private String createtime;
    private String updatetime;


    public String nextStatus(String str)
    {
        if ("y".equals(str))
            return "r";
        else if ("n".equals(str))
            return "r";
        else if ("r".equals(str))
            return "n";
        else return str;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIfuse() {
        return ifuse;
    }

    public void setIfuse(String ifuse) {
        this.ifuse = ifuse;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }
}
