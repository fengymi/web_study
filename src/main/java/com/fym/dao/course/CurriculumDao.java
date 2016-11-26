package com.fym.dao.course;


import com.fym.entity.CurriculumEntity;

public interface CurriculumDao {

    int add(CurriculumEntity curriculum);

    int update(CurriculumEntity curriculum);

    int delete(Integer curriculumId);

}
