package com.fym.entity.utils;

import com.fym.utils.data.HashPageData;

/**
 * 分页查询类
 */
public class PageEntity {
    private int pageNum;
    private int pageSize;
    //排序列
    private String sidx;
    //排序方式
    private String order;
    //不分页
    private boolean notPage;

    private HashPageData extend = new HashPageData();

    public boolean isNotPage() {
        return notPage;
    }

    public PageEntity setNotPage(boolean notPage) {
        this.notPage = notPage;
        return this;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum<=0?1:pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize<=0?10:pageSize;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) { //存在sql注入
        this.sidx = sidx;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = ("desc".equals(order))?"desc":"asc";
    }

    public PageEntity setExtend(Object key,Object value){
        extend.put(key,value);
        return this;
    }
    public Object getExtend(Object key){
        return extend.get(key);
    }
}
