package com.fym.entity;

import com.fym.utils.data.HashPageData;

import java.util.List;

public class Menu {
    private int menu_id;
    private String name;
    private String menu_icon;
    private String type;
    private List<HashPageData> urls;

    public int getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(int menu_id) {
        this.menu_id = menu_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMenu_icon() {
        return menu_icon;
    }

    public void setMenu_icon(String menu_icon) {
        this.menu_icon = menu_icon;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<HashPageData> getUrls() {
        return urls;
    }

    public void setUrls(List<HashPageData> urls) {
        this.urls = urls;
    }
}
