package com.fym.dao.system;

import com.fym.utils.data.HashPageData;

import java.util.List;

public interface CountNumDao {

    void addItem(HashPageData hashPageData);

    List<HashPageData> getAllItems();
}
