package com.jie.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @ClassName Json
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/7 0007 11:17
 * @Version 1.0
 **/

public class Json {
public static String toJson(Object obj){
    ObjectMapper mapper = new ObjectMapper();
    String json =null;
    try {
        json = mapper.writeValueAsString(obj);
    } catch (JsonProcessingException e) {
        e.printStackTrace();
    }
    return json;
}
}
