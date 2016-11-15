package com.fym.service.system;

import com.fym.dao.system.FileManagerDao;
import com.fym.entity.utils.FastDFSFile;
import com.fym.utils.component.FileManager;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class FileManagerService {
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
        if(result != 0){
            return result;
        }
        fileManagerDao.deleteFile(fileId);
        return result;
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
