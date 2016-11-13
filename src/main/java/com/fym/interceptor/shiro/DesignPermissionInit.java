package com.fym.interceptor.shiro;

import com.fym.dao.system.SystemPermissionDao;
import com.fym.service.system.SystemPermissionService;
import com.fym.utils.component.SpringBeanGetter;
import com.fym.utils.data.HashPageData;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DesignPermissionInit extends PermissionInit {

    @Resource
    private SystemPermissionService systemPermissionService;

    @Override
    public Map<String, String> initOtherPermission() {
        List<HashPageData> permissions = systemPermissionService.getSystemPermission(null);
        Map<String,String> permissionMap = new HashMap<>();
        if (permissions!=null){
            for (HashPageData permission : permissions) {
                permissionMap.put(
                        "/"+(permission.getString("url").replaceAll("[^/]*$","*")),
                        permission.getString("permission_name")+":[*]");
            }
        }
        return permissionMap;
    }
}
