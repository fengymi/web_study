package com.fym.controller.file;

import com.fym.controller.BaseController;
import com.fym.service.system.FileManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
       return mv;
    }


}
