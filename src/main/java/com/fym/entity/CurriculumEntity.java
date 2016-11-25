package com.fym.entity;

public class CurriculumEntity {
    private Integer curriculum_id;
    private Integer c_id;
    private Integer curriculum_num;
    private String name;
    private String desc;
    private String video_url;
    private Integer video_id;
    private String resource_url;
    private Integer resource_id;

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

    public String getResource_url() {
        return resource_url;
    }

    public void setResource_url(String resource_url) {
        this.resource_url = resource_url;
    }

    public Integer getResource_id() {
        return resource_id;
    }

    public void setResource_id(Integer resource_id) {
        this.resource_id = resource_id;
    }
}
