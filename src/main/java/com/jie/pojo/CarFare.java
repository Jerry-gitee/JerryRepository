package com.jie.pojo;

import java.math.BigDecimal;

/**
 * @ClassName carFare
 * @Description TODO
 * @Author 李杰杰
 * @Date2020/12/17 0017 18:56
 * @Version 1.0
 **/

public class CarFare {
private int id;
private BigDecimal price;

    public CarFare() {
    }

    public CarFare(int id, BigDecimal price) {
        this.id = id;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CarFare{" +
                "id=" + id +
                ", price=" + price +
                '}';
    }
}
