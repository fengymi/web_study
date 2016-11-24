package com.fym.utils.fastdfs;


import com.alibaba.fastjson.JSON;
import com.fym.entity.utils.FastDFSFile;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.util.UUID;

/**
 * FastDFS文件管理类
 */
public class FileManager {
    private Logger logger = LoggerFactory.getLogger(FileManager.class);
    /** 连接池 */
    private ConnectionPool connectionPool = null;
    /** 连接池默认最小连接数 */
    private int minPoolSize = 10;
    /** 连接池默认最大连接数 */
    private int maxPoolSize = 30;
    /** 默认等待时间（单位：秒） */
    private long waitTimes = 200;
    private String clientFile = "classpath:config/fastdfs-client.conf";

    public void init(){
        connectionPool = new ConnectionPool(minPoolSize, maxPoolSize, waitTimes,clientFile);
    }

    /**
     * 上传文件
     * @param file 需要上传的文件
     * @param valuePairs 其它文件参数
     * @return [0]组名,[1]文件名
     */
    public String[] uploadFile(FastDFSFile file, NameValuePair[] valuePairs) {
        String[] uploadResults = null;
        String logId = UUID.randomUUID().toString();
        TrackerServer trackerServer = null;
        try {
            //获取TrackerServer连接
            trackerServer = connectionPool.checkout(logId);
            StorageClient1 storageClient = new StorageClient1(trackerServer,null);
            uploadResults = storageClient.upload_file(file.getContent(),file.getExt(), valuePairs);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        } finally {
            //释放TrackerServer连接
            connectionPool.checkIn(trackerServer, logId);
        }

        System.out.println(JSON.toJSONString(uploadResults));
        return uploadResults;
    }

    /**
     * 删除服务器上的文件
     * @param groupName 文件组名
     * @param remoteFileName 服务器上文件名
     * @return 0为成功,2为文件不存在,其它均为失败
     */
    public int deleteFile(String groupName,String remoteFileName){
        int result = 0;
        String logId = UUID.randomUUID().toString();
        TrackerServer trackerServer = null;
        try {
            //获取TrackerServer连接
            trackerServer = connectionPool.checkout(logId);
            StorageClient1 storageClient = new StorageClient1(trackerServer,null);
            result = storageClient.delete_file(groupName, remoteFileName);
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            //释放TrackerServer连接
            connectionPool.checkIn(trackerServer, logId);
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
        String logId = UUID.randomUUID().toString();
        TrackerServer trackerServer = null;

        try {
            //获取TrackerServer连接
            trackerServer = connectionPool.checkout(logId);
            StorageClient1 storageClient = new StorageClient1(trackerServer,null);
            content = storageClient.download_file(file.getGroup(), file.getRemote_name());
            String fileInfo;
            if(file.getName()==null){
                fileInfo = System.currentTimeMillis()+"";
            }else {
                fileInfo = new String((file.getName()+"."+file.getExt()).getBytes("UTF-8"),"iso-8859-1");
            }
            headers.setContentDispositionFormData("attachment",  fileInfo);
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        } catch (Exception e) {
            logger.error(e.getMessage());
        } finally {
            //释放TrackerServer连接
            connectionPool.checkIn(trackerServer, logId);
        }
        return new ResponseEntity<>(content, headers, HttpStatus.CREATED);
    }


    public void setMinPoolSize(int minPoolSize) {
        this.minPoolSize = minPoolSize;
    }

    public void setMaxPoolSize(int maxPoolSize) {
        this.maxPoolSize = maxPoolSize;
    }

    public void setWaitTimes(long waitTimes) {
        this.waitTimes = waitTimes;
    }

    public void setClientFile(String clientFile) {
        this.clientFile = clientFile;
    }
}
