package com.fym.service.course;

import com.fym.dao.course.CurriculumDao;
import com.fym.entity.CurriculumEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CurriculumService {
    @Resource
    private CurriculumDao curriculumDao;

    public int edit(CurriculumEntity curriculum){
        if(curriculum.getCurriculum_id()!=null){
            return curriculumDao.update(curriculum);
        }

        return curriculumDao.add(curriculum);
    }

    public int delete(Integer id){
        return curriculumDao.delete(id);
    }
}
