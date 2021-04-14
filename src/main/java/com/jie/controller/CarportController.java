package com.jie.controller;

import com.jie.pojo.Car;
import com.jie.pojo.Carport;
import com.jie.pojo.Page;
import com.jie.service.CarService;
import com.jie.service.CarportService;
import com.jie.utils.CarStatus;
import com.jie.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName CarportController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/9 0009 19:58
 * @Version 1.0
 **/
@Controller
@RequestMapping("/carport")
public class CarportController {
    @Autowired
    private CarportService carportService;
    @Autowired
    private CarService carService;

    @RequestMapping("/toCarportPage")
public String toCarportPage(Integer pageNo, String carport, String area, Model model, HttpSession session){
        //****************************数据处理*****************************//
        //默认起始页为1；
        if (pageNo==null){
            pageNo=1;
        }
        if ("null".equals(carport)){//后面设置url时，会出现这种情况。
            carport=null;
        }
        if ("null".equals(area)){//后面设置url时，会出现这种情况。
            area=null;
        }
        //****************************结束*****************************//

        //通过名字模糊查询出一页数据
        Page<Carport> page = carportService.getPageByCarportAndAreaLike(pageNo, carport,area);
        //设置page的跳转地址
        page.setUrl("carport/toCarportPage?carport="+carport+"&area="+area);//此处null值经过jsp页面变为“null”
        //设置到请求域中
        model.addAttribute("page",page);
        String type = (String)session.getAttribute("type");
        if ("user".equals(type)){
            return "carport/userLookCarport.jsp";
        }else {
           return "carport/managementCarport.jsp";
        }

}
@RequestMapping("/toUpdateCarportPage")
public String toUpdateCarportPage(Integer pageNo,Integer id,Model model){
        if (pageNo==null){
            pageNo=1;
        }
        model.addAttribute("pageNo",pageNo);
        if (id!=null){
            Carport carport = carportService.queryCarportById(id);
            model.addAttribute("carport", carport);
        }
        return "carport/updateCarport.jsp";
}

@RequestMapping("/updateCarport")
@ResponseBody
public String updateCarport(Integer pageNo,Carport carport){
        if (carport.getId()!=null){
            carportService.updateCarport(carport);
        }else {
            carportService.addCarport(carport);
        }
    String url="carport/toCarportPage?pageNo="+pageNo;
    return Json.toJson(url);
}

@RequestMapping("/deltetCarport")
public String deltetCarport(Integer pageNo,Integer id){
        carportService.deleteCarport(id);
        return "redirect:../carport/toCarportPage?pageNo="+pageNo;
}
@ResponseBody
@RequestMapping("/toPark")
public String toPark(Integer pageNo,Integer id,Integer userId){
    Car car = carService.queryCarByUserId(userId);

   //判断是否有车，和车的状态是否是已停车
    if (car==null){
        return Json.toJson("noCar");
    }
    if (CarStatus.PARKING.getDes().equals(car.getCar_status())){
        return Json.toJson("isParking");
    }

    //修改车位状态
    Carport carport = carportService.queryCarportById(id);
    carport.setStatus(CarStatus.PARKING.getDes());
    carport.setCar_number(car.getCar_number());
    //出场时间，并把它设置到req域中
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    String in_date = dateFormat.format(date);
    carport.setIn_date(in_date);
    carportService.updateCarport(carport);

    //修改车的状态
    car.setCar_status(CarStatus.PARKING.getDes());
    car.setCarport(carport.getCarport());
    carService.updateCar(car);

    String url="carport/toCarportPage?pageNo="+pageNo;
    return Json.toJson(url);
}

//删除和修改车位的前提条件
    @RequestMapping("/delUpdPrecondition")
    @ResponseBody
public String delUpdPrecondition(Integer id){
        Carport carport = carportService.queryCarportById(id);
        if (CarStatus.PARKING.getDes().equals(carport.getStatus())){
            return Json.toJson("no");
        }else {
            return Json.toJson("ok");
        }

}
}
