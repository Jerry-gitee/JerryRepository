package com.jie.service;

import com.jie.mapper.CarportMapper;
import com.jie.pojo.Carport;
import com.jie.pojo.Page;
import com.jie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CarportServiceImpl
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/9 0009 18:11
 * @Version 1.0
 **/
@Service
public class CarportServiceImpl implements CarportService{
    @Autowired
    private CarportMapper carportMapper;

    //****************************增删改*****************************//
    public int updateCarport(Carport carport) {
        return carportMapper.updateCarport(carport);
    }

    public int addCarport(Carport carport) {
        return carportMapper.addCarport(carport);
    }

    public int deleteCarport(Integer id) {
        return carportMapper.deleteCarport(id);
    }

    //****************************查*****************************//
    public Carport queryCarportById(Integer id) {
        return carportMapper.queryCarportById(id);
    }

    public Carport queryCarportByCarport(String carport) {
        return carportMapper.queryCarportByCarport(carport);
    }

    //****************************分页*****************************//
    public Page<Carport> getPageByCarportAndAreaLike(int pageNo, String carport, String area) {
        Integer count = carportMapper.getCountByCarportAndAreaLike(carport, area);
        //非法数据处理
        pageNo=PageUtils.IllegalpageNoHandle(pageNo,count);
        int begin = PageUtils.getBegin(pageNo);
        List<Carport> carports = carportMapper.getItemsByCarportAndAreaLike(begin, carport, area, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo,count,carports);

    }
}
