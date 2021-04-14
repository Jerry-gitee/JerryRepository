package com.jie.mapper;

import com.jie.pojo.ParkingRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ParkingRecordMapper {
    int saveParkingRecor(ParkingRecord parkingRecord);
    Integer getCountByUserIdAndCar_numberLike(@Param("userId") String userId, @Param("car_number")String car_number);
    List<ParkingRecord> getItemsByUserIdAndCar_numberLike(@Param("begin")int begin, @Param("userId")String userId, @Param("car_number")String car_number,@Param("size") Integer size);
}
