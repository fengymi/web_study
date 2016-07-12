package com.fym.utils.data;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

/**
 * 有序的page data 类
 */
public class TreePageData extends TreeMap {
    private Map map;
    private HttpServletRequest request;

    public TreePageData(){
        map = new TreeMap<>();
    }
    public TreePageData(HttpServletRequest request){
        this.request = request;
        Map<String,String[]> params = request.getParameterMap();
        map = new TreeMap<>();

        Set<String> keys = params.keySet();
        for (String key : keys) {
            String[] value = params.get(key);
            if(value==null){
                map.put(key,null);
            }else{
                StringBuilder val = new StringBuilder();
                for (String s : value) {
                    val.append(s).append(",");
                }
                String valStr = val.toString();
                map.put(key,(valStr.substring(0,valStr.length()-1)));
            }
        }
    }
}
