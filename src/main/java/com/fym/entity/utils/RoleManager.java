package com.fym.entity.utils;

import com.fym.utils.component.CalcTools;

public class RoleManager {
    private int roleId;
    private String role_name;
    private char isSys;
    private char available;
    private String delPermissionsStr;

    private int[] delPermissions;
    private int[] addPermissions;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public char getIsSys() {
        return isSys;
    }

    public void setIsSys(char isSys) {
        this.isSys = isSys;
    }

    public char getAvailable() {
        return available;
    }

    public void setAvailable(char available) {
        this.available = available;
    }

    public int[] getDelPermissions() {
        return delPermissions;
    }

    public String getDelPermissionsStr() {
        return delPermissionsStr;
    }

    public void setDelPermissions(int[] delPermissions) {
        this.delPermissions = delPermissions;
        this.delPermissionsStr = CalcTools.arrayToString(delPermissions,",");
    }

    public int[] getAddPermissions() {
        return addPermissions;
    }

    public void setAddPermissions(int[] addPermissions) {
        this.addPermissions = addPermissions;
    }
}
