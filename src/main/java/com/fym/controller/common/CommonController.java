package com.fym.controller.common;

import com.fym.service.system.FileManagerService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/common")
public class CommonController {
    @Resource
    private FileManagerService fileManagerService;

    /**
     * 文件下载
     * @param filePath 文件id
     * @return 文件下载流
     */
    @RequestMapping(value = "/download")
    public ResponseEntity<byte[]> download(String filePath) {
        if(filePath==null) return null;
        return fileManagerService.downloadFile(filePath);
    }
}
