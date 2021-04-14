package com.jie.service;

import com.jie.pojo.Car;
import com.jie.pojo.Page;

public interface CarService {

    //****************************增删改*****************************//
    int addCar(Car car);
    int updateCar(Car car);
    int deleteCar(int carId);

    //****************************查*****************************//

    Car queryCarByUserId(int user_id);
    Car queryCarByCarId(int car_id);

    //****************************分页*****************************//

    Page<Car> getPageByUserIdAndCarNumberLike(int pageNo, String user_id, String car_number);
}
