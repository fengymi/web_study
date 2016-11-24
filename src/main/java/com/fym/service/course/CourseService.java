package com.fym.service.course;

import com.alibaba.fastjson.JSON;
import com.fym.dao.course.CourseDao;
import com.fym.entity.CourseEntity;
import com.fym.entity.FastDFSEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import static com.alibaba.fastjson.serializer.SerializerFeature.WriteMapNullValue;
import static com.alibaba.fastjson.serializer.SerializerFeature.WriteNullListAsEmpty;
import static com.alibaba.fastjson.serializer.SerializerFeature.WriteNullStringAsEmpty;

@Service
public class CourseService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private CourseDao courseDao;

    /**
     * 获取全部课程
     * @return 全部课程
     */
    public List<CourseEntity> getAllCourse(PageEntity page){
        List<CourseEntity> courses = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            courses = courseDao.getAll(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return courses;
    }

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
