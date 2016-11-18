package com.fym.entity;

import java.sql.Timestamp;

public class FastDFSEntity {
    private String file_id; //文件id
    private String group;   //远程组名
    private String remote_name;//远程文件名

    private byte[] content; //文件内容
    private String name;    //文件名称
    private String ext;     //扩展名
    private long length;    //文件大小
    private String status;  //状态
    private Timestamp upload_time;    //上传时间
    private User author;    //上传者
    private User verity;   //审核者

    public String getFile_id() {
        return file_id;
    }

    public void setFile_id(String file_id) {
        this.file_id = file_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getRemote_name() {
        return remote_name;
    }

    public void setRemote_name(String remote_name) {
        this.remote_name = remote_name;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public long getLength() {
        return length;
    }

    public void setLength(long length) {
        this.length = length;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public User getVerity() {
        return verity;
    }

    public void setVerity(User verity) {
        this.verity = verity;
    }

    public Timestamp getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(Timestamp upload_time) {
        this.upload_time = upload_time;
    }
}
