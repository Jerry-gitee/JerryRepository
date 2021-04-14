package com.jie.mapper;

import com.jie.pojo.Car;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarMapper {
    //****************************增删改*****************************//

    //添加车辆
    int addCar(Car car);

    //修改车辆
    int updateCar(Car car);

    //删除车辆
    int deleteCar(@Param("car_id") int car_id);

    //****************************查*****************************//

    //通过用户id查找车辆
    Car queryCarByUserId(@Param("user_id")Integer user_id);

    //通过车辆id查找车辆
    Car queryCarByCarId(@Param("car_id")Integer car_id);

    //****************************分页*****************************//

    //查找总行数
    int getCountByUserIdAndCarNumberLike(@Param("user_id")String user_id, @Param("car_number")String car_number);


    //查找一个页面的数据
    List<Car> getItemsByUserIdAndCarNumberLike(@Param("begin")int begin, @Param("user_id")String user_id, @Param("car_number")String car_number, @Param("size") Integer size);

}
