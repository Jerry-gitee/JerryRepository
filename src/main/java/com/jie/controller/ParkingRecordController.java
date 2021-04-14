package com.jie.controller;

import com.jie.pojo.*;
import com.jie.service.*;
import com.jie.utils.CarStatus;
import com.jie.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName ParkingRecordController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/10 0010 20:16
 * @Version 1.0
 **/
@RequestMapping("/parkingRecord")
@Controller
public class ParkingRecordController {
    @Autowired
    private ParkingRecordService parkingRecordService;
    @Autowired
    private CarFareService carFareService;
    @Autowired
    private CarportService carportService;
    @Autowired
    private UserService userService;
    @Autowired
    private CarService carService;
    @RequestMapping("/toParkRecordPage")
    public String toAdminLookParkRecordPage(String userId, String car_number, Integer pageNo, Model model, HttpSession session){

        //****************************数据处理*****************************//
        //默认起始页为1；
        if (pageNo==null){
            pageNo=1;
        }
        if ("null".equals(userId)){//后面设置url时，会出现这种情况。
            userId=null;
        }
        if ("null".equals(car_number)){//后面设置url时，会出现这种情况。
            car_number=null;
        }
        //****************************结束*****************************//
        Page<ParkingRecord> page = parkingRecordService.getPageByUserIdAndCar_numberLike(pageNo, userId, car_number);
        page.setUrl("parkingRecord/toParkRecordPage?userId="+userId+"&car_number="+car_number);//此处null值经过jsp页面变为“null”
        //设置到请求域中
        model.addAttribute("page",page);
        String type =(String) session.getAttribute("type");
        if ("user".equals(type)){
            return "parkRecord/userLookParkRecord.jsp";
        }else {
            return "parkRecord/adminLookParkRecord.jsp";
        }
    }
    @RequestMapping("/toPayPage")
    public String toPayPage(String carport,String car_number, HttpSession session,Model model){
        ParkingRecord parkingRecord = new ParkingRecord();
        parkingRecord.setCarport(carport);
        parkingRecord.setCar_number(car_number);
        //获取到停车收费标准,并设置
        CarFare carFare = carFareService.queryCarFareById(1);
        BigDecimal price = carFare.getPrice();
        parkingRecord.setPrice(price);
        //找到用户
        User user =(User) session.getAttribute("sUser");
        parkingRecord.setUserId(user.getId());

         //获取到停车位
        Carport carport1 = carportService.queryCarportByCarport(carport);
        //找到车辆入场时间,并设置
        String in_date = carport1.getIn_date();
        parkingRecord.setIn_date(in_date);
        //出场时间，并把它设置到req域中
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String out_date = dateFormat.format(date);
        parkingRecord.setOut_date(out_date);
        //计算停车时长，并把它设置到req域中
        long time = 0;
        try {
            time = dateFormat.parse(out_date).getTime() - dateFormat.parse(in_date).getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        long days = time / (1000 * 60 * 60 * 24);//得到相差天数
        long hours = (time - days * (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);//得到相差小时数
        Integer park_time = (int) (days*24+hours);
        parkingRecord.setPark_time(park_time);
        //计算停车费用，并把它设置到req域中
        BigDecimal total_fare = price.multiply(new BigDecimal(park_time));
        parkingRecord.setTotal_fare(total_fare);
        //将用户余额减去缴费金额,jsp页面，若金额小于0，提示用户先充值，大于0，提示用户是否继续缴费。
        BigDecimal balance = user.getBalance().subtract(total_fare);
        model.addAttribute("parkingRecord",parkingRecord);
        model.addAttribute("balance",balance);
        return "car_fare/pay.jsp";
    }
@RequestMapping("/parkingPay")
@ResponseBody
    public String parkingPay(ParkingRecord parkingRecord,BigDecimal balance,HttpSession session){
    //缴费。修改用户的余额
    User user =(User) session.getAttribute("sUser");
    user.setBalance(balance);
    userService.updateUser(user);
    //修改车位号和车辆状态
    Car car = carService.queryCarByUserId(user.getId());
    car.setCarport(null);
    car.setCar_status(CarStatus.NO_PARKING.getDes());
    carService.updateCar(car);
    //修改停车位的状态，车牌号，入场时间。
    Carport carport = carportService.queryCarportByCarport(parkingRecord.getCarport());
    carport.setStatus(CarStatus.NO_PARKING.getDes());
    carport.setCar_number(null);
    carport.setIn_date(null);
    carportService.updateCarport(carport);
    //保存停车记录。
    parkingRecordService.saveParkingRecor(parkingRecord);
     return Json.toJson("pages/loginAndRegister/index.jsp");
    }
}