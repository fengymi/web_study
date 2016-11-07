package com.fym.entity.utils;

import com.fym.utils.data.HashPageData;

/**
 * 操作返回对象
 */
public class ReturnData {
    private int code;
    private String msg;
    private HashPageData data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashPageData getData() {
        return data;
    }

    public void setData(HashPageData data) {
        this.data = data;
    }
}
