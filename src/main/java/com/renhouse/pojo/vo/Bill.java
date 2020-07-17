package com.renhouse.pojo.vo;

/**
 * @ClassName Bill
 * @Description Bill的vo
 * @Author 1TreeForest
 * @Date 2020/7/16 16:05
 * @Version 1.0
 */
public class Bill {
    private String tenant;
    private Integer monthRent;
    private String startTime;
    private String endTime;
    private String houseName;
    private Integer maintenanceFee;

    public Bill() {
    }

    public Bill(String tenant, Integer monthRent, String startTime, String endTime, String houseName, Integer maintenanceFee) {
        this.tenant = tenant;
        this.monthRent = monthRent;
        this.startTime = startTime;
        this.endTime = endTime;
        this.houseName = houseName;
        this.maintenanceFee = maintenanceFee;
    }

    public String getTenant() {
        return tenant;
    }

    public void setTenant(String tenant) {
        this.tenant = tenant;
    }

    public Integer getMonthRent() {
        return monthRent;
    }

    public void setMonthRent(Integer monthRent) {
        this.monthRent = monthRent;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public Integer getMaintenanceFee() {
        return maintenanceFee;
    }

    public void setMaintenanceFee(Integer maintenanceFee) {
        this.maintenanceFee = maintenanceFee;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "tenant='" + tenant + '\'' +
                ", monthRent=" + monthRent +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", houseName='" + houseName + '\'' +
                ", maintenanceFee=" + maintenanceFee +
                '}';
    }
}
