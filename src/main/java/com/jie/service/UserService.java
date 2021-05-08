package com.jie.service;

import com.jie.pojo.Page;
import com.jie.pojo.User;

import java.util.List;

public interface UserService {

    //****************************增删改*****************************//

    int addUser(User user);
    int updateUser(User user);
     int updateUserBalance(User user);
    int deleteUserById(Integer id);

    //****************************查*****************************//

    User queryByUserId(Integer id);
    User queryByUsername(String userName);
    User queryByUsernameAndPassword(String userName, String password);

    //****************************分页*****************************//

   Page<User> getPageByUserNameLike(int pageNo, String userName);
}
