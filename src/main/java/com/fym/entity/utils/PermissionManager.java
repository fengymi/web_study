package com.fym.entity.utils;

import com.fym.utils.component.CalcTools;

public class PermissionManager {
    private int permissionId;
    private int menuId;
    private String permissionName;
    private String url;
    private String available;
    private String delRolesStr;

    private int[] delRoles;
    private int[] addRoles;

    public String getDelRolesStr() {
        return delRolesStr;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public int[] getDelRoles() {
        return delRoles;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public void setDelRoles(int[] delRoles) {
        this.delRoles = delRoles;
        this.delRolesStr = CalcTools.arrayToString(delRoles,",");
    }

    public int[] getAddRoles() {
        return addRoles;
    }

    public void setAddRoles(int[] addRoles) {
        this.addRoles = addRoles;
    }
}
