package com.jie.service;

import com.jie.pojo.Carport;
import com.jie.pojo.Page;

public interface CarportService {
    //****************************增删改*****************************//
    int updateCarport(Carport carport);
    int addCarport(Carport carport);
    int deleteCarport( Integer id);

    //****************************查*****************************//
    Carport queryCarportById(Integer id);
    Carport queryCarportByCarport( String carport);

    //****************************分页*****************************//
    Page<Carport> getPageByCarportAndAreaLike(int pageNo, String carport, String area);
}
