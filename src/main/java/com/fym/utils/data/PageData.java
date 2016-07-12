package com.fym.utils.data;


import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class PageData extends TreeMap implements Map{

    private static final long serialVersionUID = 4162636298848821795L;
    Map map = null;
    HttpServletRequest request;

    public PageData(HttpServletRequest request){
        this.request = request;
        Map properties = request.getParameterMap();
        Map returnMap = new TreeMap();
        Iterator entries = properties.entrySet().iterator();
        Map.Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Map.Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if(null == valueObj){
                value = "";
            }else if(valueObj instanceof String[]){
                String[] values = request.getParameterValues(name);
                for(int i=0;i<values.length;i++){
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length()-1);
            }else{
                value = request.getParameter(name);
            }
            returnMap.put(name, value);
        }
        map = returnMap;
    }

    public PageData() {
        map = new TreeMap();
    }


    public Object get(Object key,Object defaultResult) {
        Object obj = get(key);
        if(obj==null)
            obj = defaultResult;
        return obj;
    }
    public int getToInt(Object key,int defaultResult) {
        Object obj = get(key);
        int result = 0;
        if(obj==null) {
            result = defaultResult;
        }else{
            if(obj instanceof String){
                result = Integer.parseInt(obj.toString());
            }else {
                result = (int)obj;
            }
        }

        return result;
    }

    public String getString(Object key) {
        return (String)get(key);
    }

    @SuppressWarnings("unchecked")
    @Override
    public Object put(Object key, Object value) {
        return map.put(key, value);
    }

    @Override
    public Object get(Object key) {
        Object obj = null;
        if(map.get(key) instanceof Object[]) {
            Object[] arr = (Object[])map.get(key);
            obj = request == null ? arr:(request.getParameter((String)key) == null ? arr:arr[0]);
        } else {
            obj = map.get(key);
        }
        return obj;
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
