package com.jie.service;

import com.jie.pojo.Page;
import com.jie.pojo.ParkingRecord;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface ParkingRecordService {
    int saveParkingRecor(ParkingRecord parkingRecord);
    Page<ParkingRecord> getPageByUserIdAndCar_numberLike(int pageNo, String userId, String car_number);
    void getParkingRecordByUserid(Integer userId,HttpServletResponse response) throws IOException;

    List<ParkingRecord> getParkingRecordByUserid2(Integer userid);
}
