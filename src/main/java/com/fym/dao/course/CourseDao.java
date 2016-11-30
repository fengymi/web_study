package com.fym.dao.course;

import com.fym.entity.CourseEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface CourseDao {

    void addCourse(HashPageData courseInfo);

    void updateCourse(HashPageData courseInfo);

    void deleteCourse(Object course_id);

    CourseEntity getCourse(Object course_id);

    List<CourseEntity> getAll(PageEntity pageEntity);

    List<CourseEntity> getAllList(PageEntity pageEntity);

    List<CourseEntity> getHots();
}
