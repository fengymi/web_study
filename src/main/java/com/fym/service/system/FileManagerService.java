package com.fym.service.system;

import com.fym.dao.system.FileManagerDao;
import com.fym.entity.FastDFSEntity;
import com.fym.entity.utils.FastDFSFile;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import com.fym.utils.fastdfs.FileManager;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FileManagerService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private FileManager fileManager;
    @Resource
    private FileManagerDao fileManagerDao;

    /**
     * 删除文件
     * @param fileId 文件id
     * @return 删除结果 0为成功,其它均为失败
     */
    public int deleteFile(Object fileId){
        FastDFSFile file = fileManagerDao.getFile(fileId);
        if(file==null) return -1; //找不到该文件
        int result = fileManager.deleteFile(file.getGroup(),file.getRemote_name());
        if(result!=0&&result!=2){
            return result;
        }
        fileManagerDao.deleteFile(fileId);
        return result;
    }
    public int deleteFiles(String[] ids){
        for (String id : ids) {
            int result = deleteFile(id);
            if(result!=0&&result!=2){
                return -1;
            }
        }
        return 0;
    }

    /**
     * 得到所有的文件
     * @return 所有文件
     */
    public List<FastDFSEntity> getAllFiles(PageEntity page){
        List<FastDFSEntity> files = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            files = fileManagerDao.getAllFiles(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return files;
    }

    public boolean uploadFile(FastDFSFile file) {
        String[] fileInfo =fileManager.uploadFile(file,null);
        if(fileInfo==null||fileInfo.length!=2){
            return false;
        }
        file.setGroup(fileInfo[0]);
        file.setRemote_name(fileInfo[1]);
        fileManagerDao.addFile(file);
        return true;
    }

    public ResponseEntity<byte[]> downloadFile(Object fileId){
        FastDFSFile file = fileManagerDao.getFile(fileId);
        if(file==null) return null; //找不到该文件
        return fileManager.downloadFile(file);
    }
}
