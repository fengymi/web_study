package com.fym.entity.utils;

import com.fym.utils.data.HashPageData;

/**
 * 编辑操作
 */
public class OperEntity {
    private String oper;

    private HashPageData data;

    public String getOper() {
        return oper;
    }

    public void setOper(String oper) {
        this.oper = oper;
    }

    public HashPageData getData() {
        return data;
    }

    public void setData(HashPageData data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "OperEntity{" +
                "oper='" + oper + '\'' +
                ", data=" + data +
                '}';
    }
}
