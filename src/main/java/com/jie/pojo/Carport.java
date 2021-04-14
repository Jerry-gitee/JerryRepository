package com.jie.pojo;

import com.jie.utils.CarStatus;

/**
 * @ClassName Carpart
 * @Description TODO
 * @Author 李杰杰
 * @Date2020/12/17 0017 14:56
 * @Version 1.0
 **/

public class Carport {
    private Integer id;
    private String area;//区域
    private String carport;//车位号
    private String status= CarStatus.NO_PARKING.getDes();//车位状态
    private String car_number;//车牌号
    private String in_date;//入场时间

    public Carport() {
    }

    public Carport(Integer id, String area, String carport, String status, String car_number, String in_date) {
        this.id = id;
        this.area = area;
        this.carport = carport;
        this.status = status;
        this.car_number = car_number;
        this.in_date = in_date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCarport() {
        return carport;
    }

    public void setCarport(String carport) {
        this.carport = carport;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCar_number() {
        return car_number;
    }

    public void setCar_number(String car_number) {
        this.car_number = car_number;
    }

    public String getIn_date() {
        return in_date;
    }

    public void setIn_date(String in_date) {
        this.in_date = in_date;
    }

    @Override
    public String toString() {
        return "Carport{" +
                "id=" + id +
                ", area='" + area + '\'' +
                ", carport='" + carport + '\'' +
                ", status='" + status + '\'' +
                ", car_number='" + car_number + '\'' +
                ", in_date='" + in_date + '\'' +
                '}';
    }

}
