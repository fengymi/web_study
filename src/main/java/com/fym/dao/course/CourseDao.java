package com.fym.dao.course;

import com.fym.entity.CourseEntity;
import com.fym.utils.data.HashPageData;

public interface CourseDao {

    void addCourse(HashPageData courseInfo);

    void deleteCourse(Object course_id);

    CourseEntity getCourse(Object course_id);
}
