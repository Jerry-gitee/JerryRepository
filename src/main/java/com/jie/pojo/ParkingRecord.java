package com.jie.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelIgnore;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @ClassName ParkingTime
 * @Description TODO
 * @Author 李杰杰
 * @Date2020/12/18 0018 21:23
 * @Version 1.0
 **/
@ExcelTarget("parkingRecord")
public class ParkingRecord implements Serializable {
    @ExcelIgnore
    private Integer id;
    @Excel(name = "用户id")
    private Integer userId;
    /**
     *车牌号
     */
    @Excel(name = "车牌号")
    private String car_number;
    /**
     *入场时间
     */
    @Excel(name = "入场时间",exportFormat = "yyyy-MM-dd HH:mm:ss", width = 20)
    private String in_date;
    /**
     *出场时间
     */
    @Excel(name = "出场时间",exportFormat = "yyyy-MM-dd HH:mm:ss", width = 20)
    private String out_date;

    /**
     *收费标准
     */
    @Excel(name = "收费标准")
    private BigDecimal price;
    /**
     *停车时长
     */
    @Excel(name = "停车时长")
    private Integer park_time;
    /**
     *总的费用
     */
    @Excel(name = "总的费用")
    private BigDecimal total_fare;
    /**
     *停车位
     */
    @Excel(name = "停车位")
    private String carport;

    public ParkingRecord() {
    }

    public ParkingRecord(Integer id, Integer userId, String car_number, String in_date, String out_date, BigDecimal price, Integer park_time, BigDecimal total_fare, String carport) {
        this.id = id;
        this.userId = userId;
        this.car_number = car_number;
        this.in_date = in_date;
        this.out_date = out_date;
        this.price = price;
        this.park_time = park_time;
        this.total_fare = total_fare;
        this.carport = carport;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public String getOut_date() {
        return out_date;
    }

    public void setOut_date(String out_date) {
        this.out_date = out_date;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getPark_time() {
        return park_time;
    }

    public void setPark_time(Integer park_time) {
        this.park_time = park_time;
    }

    public BigDecimal getTotal_fare() {
        return total_fare;
    }

    public void setTotal_fare(BigDecimal total_fare) {
        this.total_fare = total_fare;
    }

    public String getCarport() {
        return carport;
    }

    public void setCarport(String carport) {
        this.carport = carport;
    }

    @Override
    public String toString() {
        return "ParkingRecord{" +
                "id=" + id +
                ", userId=" + userId +
                ", car_number='" + car_number + '\'' +
                ", in_date='" + in_date + '\'' +
                ", out_date='" + out_date + '\'' +
                ", price=" + price +
                ", park_time=" + park_time +
                ", total_fare=" + total_fare +
                ", carport='" + carport + '\'' +
                '}';
    }
}
