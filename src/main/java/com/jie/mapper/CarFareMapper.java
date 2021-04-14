package com.jie.mapper;

import com.jie.pojo.CarFare;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

public interface CarFareMapper {

    CarFare queryCarFareById(@Param("id") Integer id);
    int updateCarFare(@Param("price") BigDecimal price);
}
