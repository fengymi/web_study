package com.fym.controller.index;

import com.fym.context.SessionManager;
import com.fym.controller.BaseController;
import com.fym.dao.system.SystemUserRoleDao;
import com.fym.entity.User;
import com.fym.entity.utils.UserManager;
import com.fym.service.user.UserService;
import com.fym.utils.component.Constant;
import com.fym.utils.component.MD5Util;
import com.fym.utils.data.HashPageData;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
    @Resource
    private SessionManager sessionManager;
    @Resource
    private UserService userService;
    @Resource
    private SystemUserRoleDao systemUserRoleDao;

    @RequestMapping("")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("title","在线学习");
        return mv;
    }

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String admin(){
        return "admin/login";
    }

    @RequestMapping(value = "/admin",method = RequestMethod.POST)
    public ModelAndView adminAuth(){
        String username = getRequest().getParameter("username");
        String password = MD5Util.MD5(getRequest().getParameter("password"));
        ModelAndView mv = new ModelAndView("redirect:/admin/home");
        String msg = loginVerify(username,password);
        if(msg==null){
//            getSession().setAttribute();
            return mv;
        }
        mv.addObject("message",msg);
        mv.setViewName("admin/login");
        return mv;
    }
    /**
     * 获取系统用户情况
     * @return 用户数
     */
    @RequestMapping(value = "/get_user_num",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getUserNum(){
        HashPageData pageData = new HashPageData();
        pageData.put("visitorNum",sessionManager.getVisitorNum());
        pageData.put("userNum",sessionManager.getUserNum());
        pageData.put("connectionNum",sessionManager.getConnectionNum());
        return pageData;
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "user/login";
    }
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView loginAuth(String username,String password){
        ModelAndView mv = new ModelAndView("redirect:/index");
        String msg = loginVerify(username,MD5Util.MD5(password));
        if(msg==null){
            return mv;
        }
        mv.addObject("message",msg);
        mv.setViewName("user/login");
        return mv;
    }
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public ModelAndView register(){
        ModelAndView mv = new ModelAndView("user/login");
        mv.addObject("register","1");
        return mv;
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public ModelAndView registerUser(String username,String password){
        ModelAndView mv = new ModelAndView("user/login");
        if(username==null||password==null){
            mv.addObject("register","1");
            mv.addObject("message","信息不能为空");
            return mv;
        }
        if(userService.findUserByUsername(username)!=null){
            mv.addObject("register","1");
            mv.addObject("message","用户已存在");
            return mv;
        }
        HashPageData userInfo = new HashPageData();
        userInfo.put("username",username);
        userInfo.put("nickname",username);
        userInfo.put("password",MD5Util.MD5(password));
        userInfo.put("locked",0);
        userService.registerUser(userInfo);
        UserManager userManager = new UserManager();
        userManager.setUserId(Integer.parseInt(userInfo.getString("userId")));
        userManager.setAddRoles(new int[]{3});
        systemUserRoleDao.addRoleForUser(userManager);
        SecurityUtils.getSubject().getSession().setAttribute(Constant.SESSION_USER,userService.findUserByUsername(username));
        mv.setViewName("redirect:/index");
        return mv;
    }


    @RequestMapping(value="/logout",method=RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes ){
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        SecurityUtils.getSubject().logout();
        getSession().removeAttribute(Constant.SESSION_USER);
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/index";
    }

    /**
     * 用户登录验证
     * @param username 用户名
     * @param password 密码
     * @return 验证信息
     */
    private String loginVerify(String username,String password){
        String msg = null;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try{
            subject.login(token);
            subject.isAuthenticated();
        } catch (IncorrectCredentialsException e) {
            msg = "登录密码错误";
            getSession().removeAttribute(Constant.SESSION_USER);
        } catch (UnknownAccountException e) {
            msg = "帐号不存在";
        } catch (LockedAccountException e) {
            msg = "帐号已被锁定";
        }
        subject.getSession();
        return msg;
    }
}
