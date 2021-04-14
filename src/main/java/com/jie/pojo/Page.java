package com.jie.pojo;

import java.util.List;

/**
 * @author lijiejie
 * @create 2020-12-03 16:51
 */

public class Page<T> {
    public static final Integer PAGE_SIZE=4;//页面大小，写为静态常量用类名调用。要改页面大小改此处就行
    private Integer pageNo;//起始页
    private Integer pageTotal;//总页数
    private Integer pageTotalCount;//总行数
    private List<T> items;//列表
    private String url;//给跳转地址


    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) { this.pageNo = pageNo; }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", pageTotal=" + pageTotal +
                ", pageTotalCount=" + pageTotalCount +
                ", items=" + items +
                ", url='" + url + '\'' +
                '}';
    }
}
