package com.fym.entity.utils;

public class RoleManager {
    private int roleId;
    private String role_name;
    private char isSys;
    private char available;

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
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < delPermissions.length; i++) {
            stringBuilder.append(delPermissions[i]);
            if(delPermissions.length<i-1){
                stringBuilder.append(",");
            }
        }
        return stringBuilder.toString();
    }

    public void setDelPermissions(int[] delPermissions) {
        this.delPermissions = delPermissions;
    }

    public int[] getAddPermissions() {
        return addPermissions;
    }

    public void setAddPermissions(int[] addPermissions) {
        this.addPermissions = addPermissions;
    }
}
