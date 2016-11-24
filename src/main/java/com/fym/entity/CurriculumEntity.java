package com.fym.entity;

public class CurriculumEntity {
    private Integer curriculum_id;
    private Integer c_id;
    private Integer curriculum_num;
    private String name;
    private String desc;
    private String video_url;
    private Integer video_id;

    public Integer getCurriculum_id() {
        return curriculum_id;
    }

    public void setCurriculum_id(Integer curriculum_id) {
        this.curriculum_id = curriculum_id;
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public Integer getCurriculum_num() {
        return curriculum_num;
    }

    public void setCurriculum_num(Integer curriculum_num) {
        this.curriculum_num = curriculum_num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
    }

    public Integer getVideo_id() {
        return video_id;
    }

    public void setVideo_id(Integer video_id) {
        this.video_id = video_id;
    }
}
