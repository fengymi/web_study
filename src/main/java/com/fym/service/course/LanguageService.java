package com.fym.service.course;

import com.fym.dao.course.LanguageDao;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LanguageService {
    @Resource
    private LanguageDao languageDao;

    public List<HashPageData> getAll(){
        return languageDao.getAll();
    }
}
