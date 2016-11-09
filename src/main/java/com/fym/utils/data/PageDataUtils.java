package com.fym.utils.data;

import java.util.List;

public class PageDataUtils {

    private HashPageData pageData;
    public PageDataUtils(HashPageData pageData){
        this.pageData = pageData;
    }

    public Integer getToInt(String key){
        Object o = pageData.get(key);
        if(o!=null){
            return Integer.parseInt(o+"");
        }
        return null;
    }
    public List<String> getToList(String key){
        Object o = pageData.get(key);
        if(o!=null){
            return (List<String>)o;
        }
        return null;
    }

}
