package com.fym.controller.file;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.FileManagerService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/file/manager")
public class FileManagerController extends BaseController {

    @Resource
    private FileManagerService fileManagerService;

    @RequestMapping("/list")
    public ModelAndView fileManager(){
        ModelAndView mv = new ModelAndView("system/file_list");
        mv.addObject("title","文件管理");
       return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(new PageInfo<>(fileManagerService.getAllFiles(getPage())));
    }

    @RequestMapping(value = "/delete/${fileId}",method = RequestMethod.POST)
    @ResponseBody
    public int deleteFile(@PathVariable Object fileId){
        return fileManagerService.deleteFile(fileId);
    }

    @RequestMapping(value = "/delete/files",method = RequestMethod.POST)
    @ResponseBody
    public int deleteFiles(String id){
        String fileIds[];
        if(id!=null&&!"".equals(id)){
            fileIds = id.split(",");
        }else {
            return -1;
        }
        return fileManagerService.deleteFiles(fileIds);
    }


}
