package com.jie.utils;

import com.jie.pojo.Page;
import com.jie.pojo.User;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * @ClassName PageUtils
 * @Description TODO
 * @Author 李杰杰
 * @Date2021/1/7 0007 12:22
 * @Version 1.0
 **/

public class PageUtils {

    //分页
    public static <T> Page<T> getPage(int pageNo,Integer count,List<T> list) {
        Page<T> page = new Page<T>();
        //设置总行数
        Integer pageTotalCount =count ;
        page.setPageTotalCount(pageTotalCount);

        //设置总页数
        page.setPageTotal(PageUtils.getpageTotal(count));

        //设置起始页，及begin
        page.setPageNo(pageNo);

        //设置items
        List<T> items = list;
        page.setItems(items);

        return page;
    }
    //获取总的页数
public static Integer getpageTotal(int count){
    Integer pageTotal = count / Page.PAGE_SIZE;
    //如果不能整除，总页面加一
    if (count % Page.PAGE_SIZE > 0) {
        pageTotal += 1;
    }
    return pageTotal;
}
    //获得分页的起始页
public static int getBegin(int pageNo){

    return (pageNo - 1) * Page.PAGE_SIZE;
}

//非法数据处理
public static Integer IllegalpageNoHandle(int pageNo,int count){
    Integer pageTotal = PageUtils.getpageTotal(count);
    if (pageNo>pageTotal){
        pageNo=pageTotal;
    }
    if (pageNo<1){
        pageNo=1;
    }
    return pageNo;
}

}
