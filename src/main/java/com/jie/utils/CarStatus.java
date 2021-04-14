package com.jie.utils;

public enum CarStatus {
    PARKING("已停车"),
    NO_PARKING("未停车");
    private String Des;

    CarStatus(String des) {
        Des = des;
    }

    public String getDes() {
        return Des;
    }


}
