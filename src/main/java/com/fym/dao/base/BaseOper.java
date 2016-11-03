package com.fym.dao.base;

import com.fym.utils.data.HashPageData;

/**
 * 数据操作接口
 */
public interface BaseOper {
    void add(HashPageData data);
    void delete(HashPageData data);
    void update(HashPageData data);
}
