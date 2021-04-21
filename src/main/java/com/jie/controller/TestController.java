package com.jie.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.jie.mapper.ParkingRecordMapper;
import com.jie.pojo.Page;
import com.jie.pojo.ParkingRecord;
import com.jie.service.ParkingRecordService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @author: liJieJie
 * @Date: 2021/04/18 18:23
 * @Description:
 */
@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private ParkingRecordMapper parkingRecordMapper;

    @RequestMapping("/poi")
    @ResponseBody
    public void poiTest() {
        //获取数据
        List<ParkingRecord> parkingRecords = parkingRecordMapper.getItemsByUserIdAndCar_numberLike(1, "13", "20201220", Page.PAGE_SIZE);
        //执行方法
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("导出测试",  "测试"),
                ParkingRecord.class, parkingRecords);
        //创建文件
        File savefile = new File("D:/excel/");
        if (!savefile.exists()) {
            savefile.mkdirs();
        }
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream("D:/excel/停车记录.xls");
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

    }
}
