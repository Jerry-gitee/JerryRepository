package com.jie.controller;

import com.jie.pojo.Car;
import com.jie.pojo.Carport;
import com.jie.pojo.Page;
import com.jie.pojo.User;
import com.jie.service.CarService;
import com.jie.service.UserService;
import com.jie.utils.CarStatus;
import com.jie.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @ClassName CarController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/7 0007 22:50
 * @Version 1.0
 **/
@Controller
@RequestMapping("/car")
public class CarController {
    @Autowired
    private CarService carService;

    //跳转到managementCar.jsp页面
    @RequestMapping("/toManagementCarPage")
    public String toManagementCarPage(Integer userId, Model model){
        Car car = carService.queryCarByUserId(userId);
        model.addAttribute("car",car);
        return "car/managementCar.jsp";
    }

    //添加和修改车辆
    @RequestMapping("/addAndUpdateCar")
    public String addAndUpdateCar(@RequestParam("car_imgeFile") MultipartFile car_imgeFile,Car car){
        String car_imge=car.getCar_imge();
        //****************************图片上传*****************************//
        if (!car_imgeFile.isEmpty()) {
            String storePath = "D:\\javalab\\MyIDEAJavaSpringMVC\\smmcar\\web\\pages\\static\\images";//存放我们上传的文件路径
//            String storePath = "/www/server/tomcat/webapps/smmcar/pages/static/images";
            String fileName = car_imgeFile.getOriginalFilename();

            File filepath = new File(storePath, fileName);

            if (!filepath.getParentFile().exists()) {

                filepath.getParentFile().mkdirs();//如果目录不存在，创建目录

            }

            try {
                car_imgeFile.transferTo(new File(storePath + File.separator + fileName));//把文件写入目标文件地址

            } catch (Exception e) {

                e.printStackTrace();
            }
            car_imge="pages\\static\\images\\"+fileName;

        }
        //****************************结束*****************************//
        car.setCar_imge(car_imge);
        if (car.getCar_id()!=0){
            carService.updateCar(car);
        }else {
            car.setCar_status(CarStatus.NO_PARKING.getDes());
            carService.addCar(car);
        }
        return "../car/toManagementCarPage?userId="+car.getUser_id();
    }

    //跳转到修改车俩页面
    @RequestMapping("/toUpdateCarPage")
    public String toUpdateCarPage(int car_id,Model model){
        Car car = carService.queryCarByCarId(car_id);
        model.addAttribute("car",car);
        return "car/updateCar.jsp";
    }

    //删除车辆
    @RequestMapping("/deleteCar")
    public String deleteCar(Integer car_id, Integer user_id ){
        carService.deleteCar(car_id);
        return "../car/toManagementCarPage?userId="+user_id;
    }

    @RequestMapping("/toAdminLookCarPage")
    public String toAdminLookCarPage(Integer pageNo,String user_id,String car_number,Model model ){
        //****************************数据处理*****************************//
        //默认起始页为1；
        if (pageNo==null){
            pageNo=1;
        }
        if ("null".equals(user_id)){//后面设置url时，会出现这种情况。
          user_id=null;
        }
        if ("null".equals(car_number)){//后面设置url时，会出现这种情况。
            car_number=null;
        }
        //****************************结束*****************************//

        //通过名字模糊查询出一页数据
        Page<Car> page = carService.getPageByUserIdAndCarNumberLike(pageNo, user_id,car_number);
        //设置page的跳转地址
        page.setUrl("car/toAdminLookCarPage?user_id="+user_id+"&car_number="+car_number);//此处null值经过jsp页面变为“null”
        //设置到请求域中
        model.addAttribute("page",page);
        return "car/adminLookCar.jsp";
    }

    //删除和修改车位的前提条件
    @RequestMapping("/delUpdPrecondition")
    @ResponseBody
    public String delUpdPrecondition(Integer car_id){
        Car car = carService.queryCarByCarId(car_id);
      if (CarStatus.PARKING.getDes().equals(car.getCar_status())){
          return Json.toJson("isParking");
      } else{
          return Json.toJson("ok");
      }
    }
}
