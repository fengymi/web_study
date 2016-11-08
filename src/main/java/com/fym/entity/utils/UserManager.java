package com.fym.entity.utils;

import com.fym.utils.component.CalcTools;

public class UserManager {
    private int userId;
    private String nickname;
    private String locked;
    private String delRolesStr;

    private int[] delRoles;
    private int[] addRoles;

    public String getLocked() {
        return locked;
    }

    public void setLocked(String locked) {
        this.locked = locked;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int[] getDelRoles() {
        return delRoles;
    }
    public String getDelRolesStr() {
        return delRolesStr;
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
