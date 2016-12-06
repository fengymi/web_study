package com.fym.controller.admin;


import com.fym.service.user.UserCountService;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private UserCountService userCountService;


    @RequestMapping("/home")
    public String home(){
        return "admin/home";
    }
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("admin/index");
        List<HashPageData> history = userCountService.getAll();
        String xAxis = "";
        String visitorNum= "";
        String userNum= "";
        String connectionNum= "";
        for (int i=0;i<history.size();i++) {
            HashPageData data = history.get(i);
            xAxis += "'"+data.getString("create_time")+"'";
            visitorNum += data.getString("visitor_num");
            userNum += data.getString("user_num");
            connectionNum += data.getString("connection_num");
            if(i!=history.size()-1){
                xAxis += ",";
                visitorNum += ",";
                userNum += ",";
                connectionNum += ",";
            }
        }
        mv.addObject("xAxis",xAxis);
        mv.addObject("visitorNum",visitorNum);
        mv.addObject("userNum",userNum);
        mv.addObject("connectionNum",connectionNum);
        return mv;
    }

    @RequestMapping("/get_info")
    @ResponseBody
    public float[] getInfo(){
        float[] systemInfo = new float[60];
        for (int i = 0; i < systemInfo.length; i++) {
            systemInfo[i] = new Random().nextFloat()*100;
        }
        return systemInfo;
    }
}
