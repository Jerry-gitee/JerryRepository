package com.jie.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jie.pojo.Page;
import com.jie.pojo.User;
import com.jie.service.UserService;
import com.jie.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.math.BigDecimal;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/6 0006 15:42
 * @Version 1.0
 **/
@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"sUser"})
public class UserController {
    @Autowired
    private UserService userService;

    //修改用户
    @RequestMapping("/userUpdate")
    @ResponseBody
    public String userUpdate(User user, Model model){
        userService.updateUser(user);
        model.addAttribute("sUser",user);
        String url="pages/loginAndRegister/index.jsp";
        return Json.toJson(url);
    }

    //用户充值
    @RequestMapping("/userRecharge")
    @ResponseBody
   public String userRecharge(String recharge_amount,int id,Model model){
        //通过id找到用户
        User user = userService.queryByUserId(id);
        //将余额加上用户充值的金额
        BigDecimal balance = user.getBalance().add(new BigDecimal(recharge_amount));
        user.setBalance(balance);
        //修改用户
        userService.updateUserBalance(user);
        //用户改变session域中的值也要改变
        model.addAttribute("sUser",user);
        String url="pages/loginAndRegister/index.jsp";
        return Json.toJson(url);

   }

   //跳转到管理用户界面
   @RequestMapping("/toManagementUserPage")
   public String toManagementUserPage(Integer pageNo,String userName,Model model ){
        //默认起始页为1；
        if (pageNo==null){
            pageNo=1;
        }
        if ("null".equals(userName)){//后面设置url时，会出现这种情况。
            userName=null;
        }
        //通过名字模糊查询出一页数据
       Page<User> page = userService.getPageByUserNameLike(pageNo, userName);
       //设置page的跳转地址
       page.setUrl("user/toManagementUserPage?userName=" + userName);//此处null值经过jsp页面变为“null”
        //设置到请求域中
       model.addAttribute("page",page);
       return "user/ManagementUser.jsp";
   }

   //添加用户
    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(User user){
        userService.addUser(user);
        String url="user/toManagementUserPage?pageNo=10240000";
        return Json.toJson(url) ;
    }

    //跳转到管理员修改用户界面
    @RequestMapping("/toadminUpdateUserPage")
    public String toadminUpdateUserPage(int id,int pageNo,Model model){
        User user = userService.queryByUserId(id);
        model.addAttribute("user",user);
        model.addAttribute("pageNo",pageNo);
        return "user/adminUpdateUser.jsp";
    }
    //管理员修改用户
    @RequestMapping("/adminUpdate")
    @ResponseBody
    public String adminUpdate(User user,int pageNo){
        userService.updateUser(user);
        String url="user/toManagementUserPage?pageNo="+pageNo;
        return Json.toJson(url);
    }

    //删除用户
    @RequestMapping("/deleteUser")
    public String deleteUser(int id,int pageNo){
        userService.deleteUserById(id);
        return  "../user/toManagementUserPage?pageNo="+pageNo;
    }

    //跳转到充值界面
    @RequestMapping("/toRechargePage")
    public String atoRechargePage(int id,int pageNo,Model model){
        //为了前面的adminRecharge可以拿到这几个参数，
        model.addAttribute("id",id);
        model.addAttribute("pageNo",pageNo);
        return "user/recharge.jsp";
    }
    //管理员给用户充值
    @RequestMapping("/adminRecharge")
    @ResponseBody
    public String adminRecharge(String recharge_amount,int id,int pageNo){
        //通过id找到用户
        User user = userService.queryByUserId(id);
        //将余额加上用户充值的金额
        BigDecimal balance = user.getBalance().add(new BigDecimal(recharge_amount));
        user.setBalance(balance);
        //修改用户+

        userService.updateUserBalance(user);
        String url="user/toManagementUserPage?pageNo="+pageNo;
        return Json.toJson(url);
    }

}
