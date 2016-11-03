package com.fym.utils.data;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
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
        map = new HashMap();
    }
    public HashPageData(HttpServletRequest request){
        this.request = request;
        Map<String,String[]> params = request.getParameterMap();
        map = new HashMap();

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
    @SuppressWarnings("unchecked")
    @Override
    public Object put(Object key, Object value) {
        return map.put(key, value);
    }

    @Override
    public Object get(Object key) {
        Object obj;
        if(map.get(key) instanceof Object[]) {
            Object[] arr = (Object[])map.get(key);
            obj = request == null ? arr:(request.getParameter((String)key) == null ? arr:arr[0]);
        } else {
            obj = map.get(key);
        }
        return obj;
    }

    public String getString(Object key) {
        Object obj = get(key);
        return obj==null?null:obj.toString();
    }

    @Override
    public Object remove(Object key) {
        return map.remove(key);
    }

    public void clear() {
        map.clear();
    }

    public boolean containsKey(Object key) {
        return map.containsKey(key);
    }

    public boolean containsValue(Object value) {
        return map.containsValue(value);
    }

    public Set entrySet() {
        return map.entrySet();
    }

    public boolean isEmpty() {
        return map.isEmpty();
    }

    public Set keySet() {
        return map.keySet();
    }

    @SuppressWarnings("unchecked")
    public void putAll(Map t) {
        map.putAll(t);
    }

    public int size() {
        return map.size();
    }

    public Collection values() {
        return map.values();
    }
}
