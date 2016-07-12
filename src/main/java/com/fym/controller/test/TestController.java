package com.fym.controller.test;

import com.fym.controller.BaseController;
import com.fym.service.test.TestService;
import com.fym.utils.data.HashPageData;
import com.fym.utils.data.TreePageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 测试controller
 */
@Controller
@RequestMapping("/test")
public class TestController extends BaseController {
    @Resource
    private TestService testService;

    @RequestMapping(value = "/test", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object test(){
        System.out.println(new TreePageData(getRequest()));
        System.out.println(new HashPageData(getRequest()));

        testService.test();
        return getBasePath();
    }
}
