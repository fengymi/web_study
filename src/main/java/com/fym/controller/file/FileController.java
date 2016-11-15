package com.fym.controller.file;

import com.fym.controller.BaseController;
import com.fym.entity.User;
import com.fym.entity.utils.FastDFSFile;
import com.fym.service.system.FileManagerService;
import com.fym.utils.component.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    @Resource
    private FileManagerService fileManagerService;

    @RequestMapping(value = "/upload",produces = "application/text;charset=UTF-8")
    @ResponseBody
    public boolean uploadFile(@RequestParam(value="file") MultipartFile attach)throws IOException {
        FastDFSFile file = new FastDFSFile();
        String [] fileInfo = getFileNameAndExt(attach.getOriginalFilename());
        file.setName(fileInfo[0]);
        file.setExt(fileInfo[1]);
        file.setContent(attach.getBytes());
        file.setLength(attach.getSize());
        file.setAuthor(((User)getSession().getAttribute(Constant.SESSION_USER)).getId());
        return fileManagerService.uploadFile(file);
    }

    /**
     * 文件下载
     * @param fileId 文件id
     * @return 文件下载流
     */
    @RequestMapping(value = "/download/{fileId}")
    public ResponseEntity<byte[]> download(@PathVariable Object fileId) {
        return fileManagerService.downloadFile(fileId);
    }


    /**
     * 获取文件名和格式
     * @param fileName 文件全名
     * @return [0]文件名 [1]格式
     */
    private String[] getFileNameAndExt(String fileName){
        String[] fileInfo = new String[2];
        if(fileName.contains(".")){
            int index = fileName.lastIndexOf('.');
            fileInfo[0] = fileName.substring(0,index);
            fileInfo[1] = fileName.substring(index+1);
        }
        return fileInfo;
    }

}
