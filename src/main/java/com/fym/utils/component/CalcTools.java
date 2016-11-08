package com.fym.utils.component;

import com.fym.entity.Role;
import com.fym.utils.data.HashPageData;

import java.util.Iterator;

/**
 * 计算已选对象
 */
public class CalcTools {

    public static String getSelectedIds(Iterator<Role> permissionRole,HashPageData role ){
        String oldRolesId = "";
        while (permissionRole!=null&&permissionRole.hasNext()){
            Role pRole = permissionRole.next();
            if(pRole.getId().equals(Integer.parseInt(role.get("role_id").toString()))){
                role.put("isIn",true);
                oldRolesId += pRole.getId()+",";
                permissionRole.remove();
                break;
            }
        }
        return oldRolesId;
    }

    public static String arrayToString(int[] delIds,String type){
        if(delIds==null||delIds.length==0) return "";
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < delIds.length; i++) {
            stringBuilder.append(delIds[i]);
            if(i<delIds.length-1){
                stringBuilder.append(type);
            }
        }
        return stringBuilder.toString();
    }
}
