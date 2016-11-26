package com.fym.controller.common;

import com.fym.controller.BaseController;
import com.fym.entity.utils.PageEntity;
import com.fym.service.course.CourseService;
import com.fym.service.system.FileManagerService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/common")
public class CommonController extends BaseController{
    @Resource
    private FileManagerService fileManagerService;
    @Resource
    private CourseService courseService;

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

    @RequestMapping(value = "/course_list")
    public ModelAndView courseList(){
        ModelAndView mv = new ModelAndView("home/course_list");
        mv.addObject("courses",courseService.getAllCourse(new PageEntity().setNotPage(true)));
        return mv;
    }
}
