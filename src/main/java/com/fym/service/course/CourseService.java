package com.fym.service.course;

import com.fym.dao.course.CourseDao;
import com.fym.entity.CourseEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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
        if(page!=null&&!page.isNotPage())
            PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            courses = courseDao.getAll(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return courses;
    }
    /**
     * 获取前5个最新课程
     * @return 5个课程
     */
    public List<CourseEntity> getHots(){
        return courseDao.getHots();
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

    /**
     * 修改某个课程信息
     * @param courseInfo 课程信息参数
     */
    public void updateCourse(HashPageData courseInfo){
        courseDao.updateCourse(courseInfo);
    }

    public void deleteCourse(Integer id){
        courseDao.deleteCourse(id);
    }

    public CourseEntity getCourse(Object courseId){
        return courseDao.getCourse(courseId);
    }
}
