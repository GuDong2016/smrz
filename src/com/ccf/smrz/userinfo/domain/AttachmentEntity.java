package com.ccf.smrz.userinfo.domain;

/**
 * Created by dell on 2016/6/18.
 */
public class AttachmentEntity {
    /**  **/
    private static final long serialVersionUID = 1L;

    /**
     * 附件ID
     */
    private Long attachmentId;

    /**
     * 附件名称
     */
    private String attachmentName;

    /**
     * 附件路径
     */
    private String attachmentPath;

    /**
     * 附件原名
     */
    private String attachmentRealName;
    /**
     * 附件大小
     */
    private String attachmentSize;

    public Long getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Long attachmentId) {
        this.attachmentId = attachmentId;
    }

    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName;
    }

    public String getAttachmentPath() {
        return attachmentPath;
    }

    public void setAttachmentPath(String attachmentPath) {
        this.attachmentPath = attachmentPath;
    }

    public String getAttachmentRealName() {
        return attachmentRealName;
    }

    public void setAttachmentRealName(String attachmentRealName) {
        this.attachmentRealName = attachmentRealName;
    }

    public String getAttachmentSize() {
        return attachmentSize;
    }

    public void setAttachmentSize(String attachmentSize) {
        this.attachmentSize = attachmentSize;
    }

}


