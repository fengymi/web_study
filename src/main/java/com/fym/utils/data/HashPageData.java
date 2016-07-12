package com.fym.utils.data;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 哈希page data 类
 */
public class HashPageData extends HashMap {
    private Map map;
    private HttpServletRequest request;

    public HashPageData(){
        map = new HashMap<>();
    }
    public HashPageData(HttpServletRequest request){
        this.request = request;
        Map<String,String[]> params = request.getParameterMap();
        map = new HashMap<>();

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
