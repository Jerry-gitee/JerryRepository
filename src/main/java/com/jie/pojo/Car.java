package com.jie.pojo;

import com.jie.utils.CarStatus;

/**
 * @ClassName Car
 * @Description TODO
 * @Author 李杰杰
 * @Date2020/12/17 0017 10:46
 * @Version 1.0
 **/

public class Car {
    private int car_id;
    private Integer user_id;//用户id
    private String car_number;//车牌号
    private String car_brand;//车辆品牌
    private String car_status= CarStatus.NO_PARKING.getDes();//车辆状态,默认状态：未停车
    private String carport;//停车位
    private String car_imge;//车图片

    public Car() {
    }

    public Car(int car_id, Integer user_id, String car_number, String car_brand, String car_status, String carport, String car_imge) {
        this.car_id = car_id;
        this.user_id = user_id;
        this.car_number = car_number;
        this.car_brand = car_brand;
        this.car_status = car_status;
        this.carport = carport;
        this.car_imge = car_imge;
    }

    public int getCar_id() {
        return car_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getCar_number() {
        return car_number;
    }

    public void setCar_number(String car_number) {
        this.car_number = car_number;
    }

    public String getCar_brand() {
        return car_brand;
    }

    public void setCar_brand(String car_brand) {
        this.car_brand = car_brand;
    }

    public String getCar_status() {
        return car_status;
    }

    public void setCar_status(String car_status) {
        this.car_status = car_status;
    }

    public String getCarport() {
        return carport;
    }

    public void setCarport(String carport) {
        this.carport = carport;
    }

    public String getCar_imge() {
        return car_imge;
    }

    public void setCar_imge(String car_imge) {
        this.car_imge = car_imge;
    }

    @Override
    public String toString() {
        return "Car{" +
                "car_id=" + car_id +
                ", user_id=" + user_id +
                ", car_number='" + car_number + '\'' +
                ", car_brand='" + car_brand + '\'' +
                ", car_status='" + car_status + '\'' +
                ", carport='" + carport + '\'' +
                ", car_imge='" + car_imge + '\'' +
                '}';
    }
}
