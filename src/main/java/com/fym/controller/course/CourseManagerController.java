package com.fym.controller.course;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.entity.CourseEntity;
import com.fym.service.course.CourseService;
import com.fym.service.course.LanguageService;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

/**
 *课程管理
 */
@Controller
@RequestMapping("/course_manager")
public class CourseManagerController extends BaseController{
    @Resource
    private CourseService courseService;
    @Resource
    private LanguageService languageService;

    @RequestMapping(value = "/publish",method = RequestMethod.GET)
    public ModelAndView publish(){
        ModelAndView mv = new ModelAndView("course/publish");
        mv.addObject("title","发布课程");
        mv.addObject("language",languageService.getAll());
        return mv;
    }

    @RequestMapping(value = "/info/{course_id}",method = RequestMethod.GET)
    public ModelAndView addItem(@PathVariable Object course_id){
        ModelAndView mv = new ModelAndView("course/course_item");
        mv.addObject("title","课程详细信息");
        CourseEntity courseEntity = courseService.getCourse(course_id);
        mv.addObject("course",courseEntity);
        return mv;
    }

    @RequestMapping(value = "/publish",method = RequestMethod.POST)
    public ModelAndView publishCourse(RedirectAttributes redirectAttributes ){
        HashPageData courseInfo = new HashPageData(getRequest());
        ModelAndView mv = new ModelAndView();
        if(courseInfo.get("course_name")==null){
            mv.setViewName("redirect:/course_manager/publish");
            redirectAttributes.addAttribute("message","课程名不能为空");
            return mv;
        }
        courseService.addCourse(courseInfo);
        mv.setViewName("redirect:/course_manager/add/"+courseInfo.get("course_id"));
        return mv;
    }
}
