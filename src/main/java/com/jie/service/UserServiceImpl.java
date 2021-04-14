package com.jie.service;

import com.jie.mapper.UserMapper;
import com.jie.pojo.Admin;
import com.jie.pojo.Carport;
import com.jie.pojo.Page;
import com.jie.pojo.User;
import com.jie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/5 0005 21:55
 * @Version 1.0
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    //****************************增删改*****************************//

    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    public int deleteUserById(Integer id) {
        return userMapper.deleteUserById(id);
    }

    //****************************查*****************************//

    public User queryByUserId(Integer id) {
        return userMapper.queryByUserId(id);
    }

    public User queryByUsername(String userName) {
        return userMapper.queryByUserName(userName);
    }

    public User queryByUsernameAndPassword(String userName, String password) {
        return userMapper.queryByNameAndPassword(userName, password);
    }

    //****************************分页*****************************//

    public Page<User> getPageByUserNameLike(int pageNo, String userName) {
        int count = userMapper.getCountByUserNameLike(userName);
        //非法数据处理
        pageNo=PageUtils.IllegalpageNoHandle(pageNo,count);
        int begin = PageUtils.getBegin(pageNo);
        List<User> users = userMapper.getItemsByUserNameLike(begin, userName, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo,count,users);
    }
}
