package com.fym;


import org.csource.common.NameValuePair;
import org.csource.fastdfs.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;

public class Test {

    public static void main(String[] args)throws Exception {
        String classPath = Test.class.getResource("/").getPath();

        ClientGlobal.init(classPath+"config/fastdfs-client.conf");
        // 3、创建一个TrackerClient对象。
        TrackerClient trackerClient = new TrackerClient();
        // 4、创建一个TrackerServer对象。
        TrackerServer trackerServer = trackerClient.getConnection();
        // 5、声明一个StorageServer对象，null。
        StorageServer storageServer = null;
        // 6、获得StorageClient对象。
        StorageClient storageClient = new StorageClient(trackerServer,  storageServer);
        String groupName = "group1";
        String remoteFileName = "M00/00/00/cxxD0Vgq1vuAfnTwAABkQO1bdCE891.png";
        System.out.println(storageClient.delete_file(groupName, remoteFileName));
        // 7、直接调用StorageClient对象方法上传文件即可。
//        NameValuePair[] metaList = new NameValuePair[3];
////        metaList[0] = new NameValuePair("fileName", "test");
////        metaList[1] = new NameValuePair("fileExtName", "jpg");
////        metaList[2] = new NameValuePair("fileLength", String.valueOf(1234));
//        String[] strings = storageClient.upload_file(classPath+"test/background.png", "png", metaList);
//        for (String string : strings) {
//            System.out.println(string);
//        }
//        byte[] b = storageClient.download_file("group1","M00/00/00/cxxD0Vgqna-AeqghAAJPKDqsz08110.png");
//        File file = new File("/home/fengymi/桌面/test.png");
//        FileOutputStream fileOutputStream = new FileOutputStream(file);
//        fileOutputStream.write(b);
//        fileOutputStream.flush();
//        fileOutputStream.close();
    }
}
