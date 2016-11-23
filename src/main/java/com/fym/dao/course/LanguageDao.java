package com.fym.dao.course;


import com.fym.utils.data.HashPageData;

import java.util.List;

public interface LanguageDao {

    List<HashPageData> getAll();

    void add(HashPageData data);
    void delete(Object id);

}
