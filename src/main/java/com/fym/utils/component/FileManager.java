package com.fym.utils.component;


import com.fym.entity.utils.FastDFSFile;
import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.IOException;

/**
 * FastDFS文件管理类
 */
public class FileManager {
    private Logger logger = LoggerFactory.getLogger(FileManager.class);

    private StorageClient storageClient;

    public FileManager(){
        this("config/fastdfs-client.conf");
    }

    public FileManager(String clientFilePath){
        String classPath = this.getClass().getResource("/").getPath();
        try {
            ClientGlobal.init(classPath+clientFilePath);
            TrackerClient trackerClient = new TrackerClient();
            TrackerServer trackerServer = trackerClient.getConnection();
            storageClient = new StorageClient(trackerServer, null);
        }catch (MyException my){
            logger.error("fastdfs文件初始化失败:"+my.getMessage());
        }catch (IOException io){
            logger.error(io.getMessage());
        }
    }

    /**
     * 上传文件
     * @param file 需要上传的文件
     * @param valuePairs 其它文件参数
     * @return [0]组名,[1]文件名
     */
    public String[] uploadFile(FastDFSFile file, NameValuePair[] valuePairs) {
        String[] uploadResults = null;
        try {
            uploadResults = storageClient.upload_file(file.getContent(),file.getExt(), valuePairs);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return uploadResults;
    }

    /**
     * 删除服务器上的文件
     * @param groupName 文件组名
     * @param remoteFileName 服务器上文件名
     * @return 0为成功,其它均为失败
     */
    public int deleteFile(String groupName,String remoteFileName){
        int result = 0;
        try {
            result = storageClient.delete_file(groupName, remoteFileName);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return result;
    }

    /**
     * 文件下载
     * @param file 需要下载的文件
     * @return 文件下载流
     */
    public ResponseEntity<byte[]> downloadFile(FastDFSFile file) {
        byte[] content = null;
        HttpHeaders headers = new HttpHeaders();
        try {
            content = storageClient.download_file(file.getGroup(), file.getRemote_name());
            headers.setContentDispositionFormData("attachment",  new String((file.getName()+"."+file.getExt()).getBytes("UTF-8"),"iso-8859-1"));
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return new ResponseEntity<>(content, headers, HttpStatus.CREATED);
    }
}
