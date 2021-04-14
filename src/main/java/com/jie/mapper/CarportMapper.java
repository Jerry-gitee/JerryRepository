package com.jie.mapper;

import com.jie.pojo.Carport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarportMapper {

    //****************************增删改*****************************//
    int updateCarport(Carport carport);
    int addCarport(Carport carport);
    int deleteCarport(@Param("id") Integer id);

    //****************************查*****************************//
    Carport queryCarportById(@Param("id") Integer id);
    Carport queryCarportByCarport(@Param("carport") String carport);

    //****************************分页*****************************//
    Integer getCountByCarportAndAreaLike(@Param("carport") String carport, @Param("area")String area);
    List<Carport> getItemsByCarportAndAreaLike(@Param("begin")int begin, @Param("carport")String carport, @Param("area")String area, @Param("size") Integer size);
}
