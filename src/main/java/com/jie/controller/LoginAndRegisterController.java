package com.jie.controller;

import com.jie.pojo.Admin;
import com.jie.pojo.User;
import com.jie.service.AdminService;
import com.jie.service.UserService;
import com.jie.utils.Json;
import com.jie.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName LoginAndRegisterController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/5 0005 19:39
 * @Version 1.0
 **/
@Controller
@SessionAttributes(value = {"sAdmin", "sUser", "type"})
@RequestMapping("/loginAndRegister")
public class LoginAndRegisterController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    //跳转到登入页面
    @RequestMapping("/toLoginPage")
    public String toLoginPage() {
        return "loginAndRegister/login.jsp";
    }

    //判断用户名是否存在
    @RequestMapping("/existsName")
    @ResponseBody
    public List<Object> ajaxExistsName(String name) {
        boolean existsName = false;
        User user = userService.queryByUsername(name);
        if (user != null) {
            existsName = true;
        }
        List list = new ArrayList<Object>();
        list.add(existsName);
        return list;
    }
    /**
     *判断用户密码是否正确
     */
    @RequestMapping("/ajaxVerifyPassword")
    @ResponseBody
    public List<Object> ajaxVerifyPassword(String name,String password) {
        boolean verifyPassword = false;
        User user = userService.queryByUsername(name);
        boolean verify = PasswordUtil.verify(password, user.getUserPassword());
        if (verify) {
            verifyPassword = true;
        }
        List list = new ArrayList<Object>();
        list.add(verifyPassword);
        return list;
    }


    /**
     * 功能描述 :登入操作
     *
     * @param name     账号
     * @param password 密码
     * @param action   标识，判断是用户还是管理员
     * @param model
     * @return java.lang.String
     **/
    @RequestMapping("/login")
    @ResponseBody
    public String login(String name, String password, String action, Model model) {
        String url=null;
        if ("userLogin".equals(action)) {
            User user = userService.queryByUsernameAndPassword(name, password);
            if (user == null) {
               url= "false";
                return Json.toJson(url);
            }
            model.addAttribute("sUser", user);
            model.addAttribute("type", "user");

        } else {
            Admin admin = adminService.queryByNameAndPassword(name, password);
            if (admin == null) {
                url= "false";
                return Json.toJson(url);
            }
            model.addAttribute("sAdmin", admin);
            model.addAttribute("type", "admin");
        }
        url="pages/loginAndRegister/index.jsp";
        return Json.toJson(url);
    }

    //退出操作
    @RequestMapping("/loginOut")
    public String loginOut(SessionStatus status) {
        // 清除当前处理器通过@SessionAttribute注册的session属性
        status.setComplete();
        return "loginAndRegister/login.jsp";
    }

    @RequestMapping("/register")
    public String register(User user) {

        userService.addUser(user);
        return "../loginAndRegister/toLoginPage";
    }

}
