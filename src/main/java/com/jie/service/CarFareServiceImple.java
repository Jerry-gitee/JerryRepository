package com.jie.service;

import com.jie.mapper.CarFareMapper;
import com.jie.pojo.CarFare;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * @ClassName CarFareServiceImple
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/10 0010 17:23
 * @Version 1.0
 **/
@Service
public class CarFareServiceImple implements CarFareService {
    @Autowired
    private CarFareMapper carFareMapper;
    public CarFare queryCarFareById(Integer id) {
        return carFareMapper.queryCarFareById(id);
    }

    public int updateCarFare(BigDecimal price) {
        return carFareMapper.updateCarFare(price);
    }
}
