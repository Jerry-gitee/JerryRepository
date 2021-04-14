package com.jie.mapper;

import com.jie.pojo.Page;
import com.jie.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    //****************************增删改*****************************//

    //增加用户
    int  addUser(User user);

    //修改用户
    int updateUser(User user);

    //通过id删除用户
    int deleteUserById(@Param("id") Integer id);

    //****************************查*****************************//

    //通过用户id查找用户
    User queryByUserId(@Param("id") Integer id);

    //通过用户名和密码查找用户
    User queryByNameAndPassword(@Param("userName") String userName, @Param("userPassword") String userPassword);

    //通过用户名查找用户
    User queryByUserName(@Param("userName") String userName);

    //****************************分页*****************************//

    //查找总行数
    int getCountByUserNameLike(@Param("userName") String userName);

    //查找一个页面的数据
    List<User> getItemsByUserNameLike(@Param("begin") int begin , @Param("userName") String userName, @Param("size") Integer size);
}
