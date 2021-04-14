package com.jie.service;

import com.jie.pojo.CarFare;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

public interface CarFareService {

    CarFare queryCarFareById( Integer id);

    int updateCarFare(BigDecimal price);
}
