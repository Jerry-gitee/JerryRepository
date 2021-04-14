package com.jie.pojo;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;

/**
 * @ClassName user
 * @Description
 * @Author 李杰杰
 * @Date2020/12/12 0012 16:00
 * @Version 1.0
 **/
public class User {
private Integer id;
private String userName;
private String userPassword;
private String tel;//电话
private BigDecimal balance=new BigDecimal(0);//余额；默认为0元。注BigDecimal类似于Double，但它更加精确。

    public User() {
    }

    public User(Integer id, String userName, String userPassword, String tel, BigDecimal balance) {
        this.id = id;
        this.userName = userName;
        this.userPassword = userPassword;
        this.tel = tel;
        this.balance = balance;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", tel='" + tel + '\'' +
                ", balance=" + balance +
                '}';
    }
}
