package com.fym.dao.system;


import com.fym.entity.FastDFSEntity;
import com.fym.entity.utils.FastDFSFile;
import com.fym.entity.utils.PageEntity;

import java.util.List;

public interface FileManagerDao {

    void addFile(FastDFSFile file);
    void deleteFile(Object fileId);

    FastDFSFile getFile(Object fileId);
    List<FastDFSEntity> getAllFiles(PageEntity pageEntity);
}
