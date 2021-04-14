package com.jie.controller;

import com.jie.pojo.CarFare;
import com.jie.service.CarFareService;
import com.jie.utils.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

/**
 * @ClassName CarFareController
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/10 0010 17:25
 * @Version 1.0
 **/
@Controller
@RequestMapping("/carFare")
public class CarFareController {
    @Autowired
    private CarFareService carFareService;

    @RequestMapping("/toCarFarePage")
    public String toCarFarePage(Model model, HttpSession session){
        Integer id=1;
        CarFare carFare = carFareService.queryCarFareById(id);
        model.addAttribute("carFare",carFare);
        String type =(String) session.getAttribute("type");
        if ("user".equals(type)){
            return "car_fare/lookCarFare.jsp";
        }else {
            return "car_fare/updateCarFare.jsp";
        }
    }
    @RequestMapping("/updateCarFare")
    @ResponseBody
    public String updateCarFare(BigDecimal price){
        carFareService.updateCarFare(price);
        return Json.toJson("ok");
    }
}
