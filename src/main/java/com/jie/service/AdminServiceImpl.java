package com.jie.service;

import com.jie.mapper.AdminMapper;
import com.jie.pojo.Admin;
import com.jie.pojo.Page;
import com.jie.pojo.User;
import com.jie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName AdminService
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/5 0005 12:18
 * @Version 1.0
 **/
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    //****************************增删改*****************************//

    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }

    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    public int deleteAdminByid(Integer id) {
        return adminMapper.deleteAdminById(id);
    }

    //****************************查*****************************//

    public Admin queryByNameAndPassword(String adminName, String adminPassword) {
        return adminMapper.queryByNameAndPassword(adminName,adminPassword);
    }

    public Admin queryByAdminid(Integer id) {
        return adminMapper.queryByAdminid(id);
    }

    public Admin queryByAdminName(String adminName) {
        return adminMapper.queryByAdminName(adminName);
    }

    //****************************分页*****************************//

    public Page<Admin> getpageByAdminNameLike(int pageNo, String AdminName) {
        int count = adminMapper.getCountByAdminNameLike(AdminName);
        //非法数据处理
        pageNo=PageUtils.IllegalpageNoHandle(pageNo,count);
        int begin = PageUtils.getBegin(pageNo);
        List<Admin> admins = adminMapper.getPageItemsByAdminNameLike(begin, AdminName, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo,count,admins);
    }
}
