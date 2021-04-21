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

import java.io.FileOutputStream;
import java.io.IOException;
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
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getItemsByUserIdAndCar_numberLike(begin, userId, car_number, Page.PAGE_SIZE);
        return PageUtils.getPage(pageNo, count, parkingRecords);
    }

    @Override
    public String getParkingRecordByUserid(Integer userId) {
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getParkingRecordByUserid(userId);

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("停车缴费记录", "缴费记录"),
                ParkingRecord.class, parkingRecords);

        FileOutputStream fos = null;
        try {

            fos = new FileOutputStream("C:/Users/Administrator/Desktop/停车记录.xls");
            //导出数据
            workbook.write(fos);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        return "ture";
    }

}
