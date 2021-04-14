package com.jie.service;

import com.jie.pojo.Page;
import com.jie.pojo.ParkingRecord;

import java.util.List;

public interface ParkingRecordService {
    int saveParkingRecor(ParkingRecord parkingRecord);
    Page<ParkingRecord> getPageByUserIdAndCar_numberLike(int pageNo, String userId, String car_number);
}
