package com.jie.controller;

import com.jie.pojo.Admin;
import com.jie.pojo.Page;
import com.jie.service.AdminService;
import com.jie.utils.Json;
import com.jie.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName AdminController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/5 0005 12:24
 * @Version 1.0
 **/
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    //跳转到管理管理员界面
    @RequestMapping("/toManagementAdminPage")
    public String toManagementAdminPage(Integer pageNo, String adminName, Model model ){
        //默认起始页为1；
        if (pageNo==null){
            pageNo=1;
        }
        if ("null".equals(adminName)){//后面设置url时，会出现这种情况。
            adminName=null;
        }
        //通过名字模糊查询出一页数据
        Page<Admin> page = adminService.getpageByAdminNameLike(pageNo, adminName);
        //设置page的跳转地址
        page.setUrl("admin/toManagementAdminPage?adminName=" + adminName);//此处null值经过jsp页面变为“null”
        //设置到请求域中
        model.addAttribute("page",page);
        return "admin/ManagementAdmin.jsp";
    }

    //判断管理员名字是否存在
    @RequestMapping("/existsName")
    @ResponseBody
    public  List<Object> ajaxExistsName(String name){
        boolean existsName=false;
        Admin admin= adminService.queryByAdminName(name);
        if (admin!=null){
            existsName=true;
        }
        List list=new ArrayList<Object>();
        list.add(existsName);
        return list;
    }

    //添加用户
    @RequestMapping("/addAdmin")
    @ResponseBody
    public String addAdmin(Admin admin){
        adminService.addAdmin(admin);
        String url="admin/toManagementAdminPage?pageNo=10240000";
        return Json.toJson(url) ;
    }

    //跳转到修改管理员页面
    @RequestMapping("/toUpdateAdminPage")
    public String toUpdateAdminPage(Integer id,int pageNo,Model model){
        Admin admin = adminService.queryByAdminid(id);
        model.addAttribute("admin",admin);
        model.addAttribute("pageNo",pageNo);
        return "admin/updateAdmin.jsp";
    }

    //修改管理员
    @RequestMapping("/upadteAdmin")
    @ResponseBody
    public String upadteAdmin(Admin admin,int pageNo,Integer id,String adminOldPwd){
        String url="false";
        Admin admin1 = adminService.queryByAdminid(id);
        boolean verify = PasswordUtil.verify(adminOldPwd, admin1.getAdminPassword());
        if (verify){
            adminService.updateAdmin(admin);
            url="admin/toManagementAdminPage?pageNo="+pageNo;
        }

        return Json.toJson(url);
    }

    //删除管理员
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(Integer id,int pageNo){
        adminService.deleteAdminByid(id);
        return "../admin/toManagementAdminPage?pageNo="+pageNo;
    }
}
