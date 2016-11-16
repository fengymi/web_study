package com.fym.utils.fastdfs;

import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.ProtoCommon;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * FastDFS连接池
 */
public class ConnectionPool {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private LinkedBlockingQueue<TrackerServer> idleConnectionPool = null;// 空闲的连接池
    private int minPoolSize;// 连接池最小连接数 10
    private int maxPoolSize;// 连接池最大连接数 30
    private volatile int nowPoolSize = 0;// 当前创建的连接数
    private long waitTimes;// 等待时间（单位：秒） 200
    private static final int COUNT = 1;// fastdfs客户端创建连接默认1次
    private String clientFile;
    /**
     * 连接池初始化
     * @param minPoolSize 最小连接数
     * @param maxPoolSize 最大连接数
     * @param waitTimes 等待时间(单位:秒)
     */
    public ConnectionPool(int minPoolSize, int maxPoolSize, long waitTimes,String clientFile) {
        String logId = UUID.randomUUID().toString();
        this.minPoolSize = minPoolSize;
        this.maxPoolSize = maxPoolSize;
        this.waitTimes = waitTimes;
        setClientFile(clientFile);//计算实际文件路径
        logger.debug("开始初始化线程池"+logId+":[最小连接数:"+this.minPoolSize+"]," +
                "[最大连接数:"+this.maxPoolSize+"],[等待时间:"+this.waitTimes+"(秒)]");
        initCool(logId);
        // 注册心跳
        HeartBeat beat = new HeartBeat(this);
        beat.beat();
    }

    private void initCool(String logId){
        if(initClientGlobal()){//初始化ClientGlobal
            // 初始化连接池
            idleConnectionPool = new LinkedBlockingQueue<>();
            // 往线程池中添加最小数量的线程
            for (int i = 0; i < minPoolSize; i++) {
                createTrackerServer(logId, COUNT);
            }
        }
    }

    /**
     * 创建TrackerServer,并放入空闲连接池
     */
    private void createTrackerServer(String logId, int flag) {
        TrackerServer trackerServer = null;
        try {
            TrackerClient trackerClient = new TrackerClient();
            trackerServer = trackerClient.getConnection();
            //进行5次
            while (trackerServer == null && flag < 5) {
                logger.info("[创建TrackerServer(createTrackerServer)][" + logId
                        + "][第" + flag + "次重建]");
                flag++;
                initClientGlobal();
                trackerServer = trackerClient.getConnection();
            }
            //检测tracker是否可用
            if(trackerServer!=null&& ProtoCommon.activeTest(trackerServer.getSocket())){
                idleConnectionPool.add(trackerServer);
                synchronized (this) {
                    nowPoolSize++;
                }
            }

        } catch (Exception e) {
            logger.error("[创建TrackerServer(createTrackerServer)][" + logId
                    + "][异常：{}]", e);
        } finally {
            if (trackerServer != null) {
                try {
                    trackerServer.close();
                } catch (Exception e) {
                    logger.error("[创建TrackerServer(createTrackerServer)--关闭trackerServer异常]["
                            + logId + "][异常：{}]", e);
                }
            }

        }
    }
    /**
     * 初始化ClientGlobal
     * @return 是否成功
     */
    private boolean initClientGlobal(){
        try {
            ClientGlobal.init(clientFile);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("ClientGlobal初始化失败");
            return false;
        }
        return true;
    }

    /**
     * 从连接池中获取一个TrackerServer
     * @param logId 标识
     * @return 返回一个TrackerServer
     */
    public TrackerServer checkout(String logId){
        logger.info("[获取空闲连接(checkout)][" + logId + "]");
        TrackerServer trackerServer = idleConnectionPool.poll();
        //如果线程池还没达到最大值时,继续创建
        if (trackerServer == null) {
            if (nowPoolSize < maxPoolSize) {
                createTrackerServer(logId, COUNT);
                try {
                    trackerServer = idleConnectionPool.poll(waitTimes,TimeUnit.SECONDS);
                } catch (Exception e) {
                    logger.error("[获取空闲连接(checkout)-error][" + logId
                            + "][error:获取连接超时:{}]",e);
                }
            }
            if (trackerServer == null) {
                logger.error("[获取空闲连接(checkout)-error][" + logId
                        + "][error:获取连接超时（" + waitTimes + "s）]");
            }
        }
        logger.info("[获取空闲连接(checkout)][" + logId + "][获取空闲连接成功]");
        return trackerServer;
    }

    /**
     * 是否某个trackerServer连接
     * @param trackerServer trackerServer
     * @param logId 标识
     */
    public void checkIn(TrackerServer trackerServer, String logId) {
        logger.debug("[释放当前连接(checkIn)][" + logId + "][prams:" + trackerServer+"]");
        if (trackerServer != null) {
            if (idleConnectionPool.size() < minPoolSize) {
                idleConnectionPool.add(trackerServer);
            } else {
                synchronized (this) {
                    if (nowPoolSize != 0) {
                        nowPoolSize--;
                    }
                }
            }
        }
    }

    /**
     * 删除不可用的连接，并把当前连接数减一（调用过程中trackerServer报异常，调用一般在finally中）
     * @param trackerServer trackerServer
     */
    public void drop(TrackerServer trackerServer, String logId) {
        logger.debug("[删除不可用连接方法(drop)][" + logId + "][prams:" + trackerServer+"]");
        if (trackerServer != null) {
            try {
                synchronized (this) {
                    if (nowPoolSize != 0) {
                        nowPoolSize--;
                    }
                }
                trackerServer.close();
            } catch (IOException e) {
                logger.info("[删除不可用连接方法(drop)--关闭trackerServer异常][" + logId
                        + "][异常：{}]", e);
            }
        }
    }

    private void setClientFile(String clientFile){
        String realPath;
        if(clientFile.contains("classpath:")){
            realPath = this.getClass().getResource("/").getPath()+clientFile.replace("classpath:","");
        }else {
            realPath = clientFile;
        }
        this.clientFile = realPath;
    }
    public LinkedBlockingQueue<TrackerServer> getIdleConnectionPool() {
        return idleConnectionPool;
    }
}













