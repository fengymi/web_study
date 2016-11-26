package com.fym.entity;

import java.util.List;

public class CourseEntity {
    private Integer course_id;
    private String course_name;
    private String course_author;
    private String language;
    private String img_url;
    private Integer img_id;
    private String course_desc;

    private User user;
    private List<CurriculumEntity> courseItems;

    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_author() {
        return course_author;
    }

    public void setCourse_author(String course_author) {
        this.course_author = course_author;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public Integer getImg_id() {
        return img_id;
    }

    public void setImg_id(Integer img_id) {
        this.img_id = img_id;
    }

    public String getCourse_desc() {
        return course_desc;
    }

    public void setCourse_desc(String course_desc) {
        this.course_desc = course_desc;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<CurriculumEntity> getCourseItems() {
        return courseItems;
    }

    public void setCourseItems(List<CurriculumEntity> courseItems) {
        this.courseItems = courseItems;
    }

}
