package com.jie.pojo;

/**
 * @ClassName Admin
 * @Description 管理员有id，登录名，密码。
 * @Author 李杰杰
 * @Date2020/12/12 0012 20:20
 * @Version 1.0
 **/

public class Admin {
    private Integer id;
    private String adminName;
    private String adminPassword;

    public Admin() {
    }

    public Admin(Integer id, String adminName, String adminPassword) {
        this.id = id;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                '}';
    }
}
