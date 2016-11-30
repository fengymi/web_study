package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.entity.User;
import com.fym.service.course.CourseService;
import com.fym.service.course.LanguageService;
import com.fym.utils.component.Constant;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/course")
public class SystemCourseController extends BaseController{
    @Resource
    private CourseService courseService;

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("course/course_list");
        mv.addObject("title","全部课程");
        return mv;
    }
    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(new PageInfo<>(courseService.getAllCourseList(getPage())));
    }
}
