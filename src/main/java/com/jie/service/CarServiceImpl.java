package com.jie.service;

import com.jie.mapper.CarMapper;
import com.jie.pojo.Car;
import com.jie.pojo.Page;
import com.jie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CarServiceImpl
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/7 0007 22:32
 * @Version 1.0
 **/
@Service
public class CarServiceImpl implements CarService {
    @Autowired
    private CarMapper carMapper;

    //****************************增删改*****************************//

    public int addCar(Car car) {
        return carMapper.addCar(car);
    }

    public int updateCar(Car car) {
        return carMapper.updateCar(car);
    }

    public int deleteCar(int carId) {
        return carMapper.deleteCar(carId);
    }

    //****************************查*****************************//

    public Car queryCarByUserId(int user_id) {
        return carMapper.queryCarByUserId(user_id);
    }

    public Car queryCarByCarId(int car_id) {
        return carMapper.queryCarByCarId(car_id);
    }

    //****************************分页*****************************//

    public Page<Car> getPageByUserIdAndCarNumberLike(int pageNo,String user_id, String car_number) {
        Integer count = carMapper.getCountByUserIdAndCarNumberLike(user_id,car_number);
        //非法数据处理
        pageNo=PageUtils.IllegalpageNoHandle(pageNo,count);
        int begin = PageUtils.getBegin(pageNo);
        List<Car> cars = carMapper.getItemsByUserIdAndCarNumberLike(begin, user_id, car_number, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo,count,cars);
    }
}
