package com.jie.mapper;

import com.jie.pojo.Admin;
import com.jie.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    //****************************增删改*****************************//

    //增加管理员
    int addAdmin(Admin admin);

    //修改管理员
    int updateAdmin(Admin admin);

    //删除管理员
    int deleteAdminById(@Param("id") Integer id);

    //****************************查*****************************//

    //通过昵称和密码查找管理员
    Admin queryByNameAndPassword(@Param("adminName") String adminName, @Param("adminPassword") String adminPassword);

    //通过名字查找管理员
    Admin queryByAdminName(@Param("adminName") String adminName);

    //通过id查找管理员
    Admin queryByAdminid(@Param("id") Integer id);

    //****************************分页*****************************//

    //查找总行数
    int getCountByAdminNameLike(@Param("adminName") String adminName);

    //查找一个页面的数据
    List<Admin> getPageItemsByAdminNameLike(@Param("begin") int begin, @Param("adminName") String adminName, @Param("size") Integer size);
}
