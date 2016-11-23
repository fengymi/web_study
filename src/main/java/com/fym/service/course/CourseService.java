package com.fym.service.course;

import com.fym.dao.course.CourseDao;
import com.fym.entity.CourseEntity;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CourseService {

    @Resource
    private CourseDao courseDao;

    /**
     * 发布一个课程
     * @param courseInfo 课程信息
     * @return 课程信息
     */
    public HashPageData addCourse(HashPageData courseInfo){
        courseDao.addCourse(courseInfo);
        return courseInfo;
    }

    public CourseEntity getCourse(Object courseId){
        return courseDao.getCourse(courseId);
    }
}
