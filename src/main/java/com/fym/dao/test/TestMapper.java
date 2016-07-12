package com.fym.dao.test;

import com.fym.utils.data.HashPageData;
import com.fym.utils.data.TreePageData;

import java.util.List;

/**
 */
public interface TestMapper {
    List<HashPageData> findAll();
    List<TreePageData> findAllTree();
}
