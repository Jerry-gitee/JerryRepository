package com.jie.service;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.jie.mapper.ParkingRecordMapper;
import com.jie.pojo.Page;
import com.jie.pojo.ParkingRecord;
import com.jie.utils.PageUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
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

    @Override
    public int saveParkingRecor(ParkingRecord parkingRecord) {
        return parkingRecordMapper.saveParkingRecor(parkingRecord);
    }

    @Override
    public Page<ParkingRecord> getPageByUserIdAndCar_numberLike(int pageNo, String userId, String car_number) {
        Integer count = parkingRecordMapper.getCountByUserIdAndCar_numberLike(userId, car_number);
        pageNo = PageUtils.IllegalpageNoHandle(pageNo, count);
        int begin = PageUtils.getBegin(pageNo);
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getItemsByUserIdAndCar_numberLike(begin, userId,
                car_number, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo, count, parkingRecords);
    }

    @Override
    public void getParkingRecordByUserid(Integer userId, HttpServletResponse response) throws IOException {
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getParkingRecordByUserid(userId);

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("停车缴费记录", "缴费记录"),
                ParkingRecord.class, parkingRecords);

        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode("停车缴费记录.xls", "UTF-8"));
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        outputStream.close();
        workbook.close();
    }

    @Override
    public List<ParkingRecord> getParkingRecordByUserid2(Integer userid) {
        return parkingRecordMapper.getParkingRecordByUserid(userid);
    }

}
