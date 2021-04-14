package com.jie.service;

import com.jie.pojo.Admin;
import com.jie.pojo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {

    //****************************增删改*****************************//

    int updateAdmin(Admin admin);
    int addAdmin(Admin admin);
    int deleteAdminByid(Integer id);

    //****************************查*****************************//

    Admin queryByNameAndPassword(String adminName, String adminPassword);
    Admin queryByAdminid(Integer id);
    Admin queryByAdminName(String adminName);

    //****************************分页*****************************//

    Page<Admin> getpageByAdminNameLike(int pageNo, String AdminName);


}
