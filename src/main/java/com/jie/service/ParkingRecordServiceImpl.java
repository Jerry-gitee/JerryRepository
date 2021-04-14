package com.jie.service;

import com.jie.mapper.ParkingRecordMapper;
import com.jie.pojo.Page;
import com.jie.pojo.ParkingRecord;
import com.jie.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ParkingRecordServiceImpl
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/10 0010 20:06
 * @Version 1.0
 **/
@Service
public class ParkingRecordServiceImpl implements ParkingRecordService {
    @Autowired
    private ParkingRecordMapper parkingRecordMapper;

    public int saveParkingRecor(ParkingRecord parkingRecord) {
        return parkingRecordMapper.saveParkingRecor(parkingRecord);
    }

    public Page<ParkingRecord> getPageByUserIdAndCar_numberLike(int pageNo, String userId, String car_number) {
        Integer count = parkingRecordMapper.getCountByUserIdAndCar_numberLike(userId, car_number);
         pageNo = PageUtils.IllegalpageNoHandle(pageNo, count);
        int begin = PageUtils.getBegin(pageNo);
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getItemsByUserIdAndCar_numberLike(begin, userId, car_number, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo,count,parkingRecords);
    }
}
