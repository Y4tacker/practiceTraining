package com.renhouse.pojo.vo;

/**
 * @ClassName RnetBill
 * @Description TODO
 * @Author 1TreeForest
 * @Date 2020/7/16 16:05
 * @Version 1.0
 */
public class RentBill {
    private String tenantName;
    private String houseName;
    private int monthlyRent;
    private String start;
    private String end;
    private int maintenance;

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public int getMonthlyRent() {
        return monthlyRent;
    }

    public void setMonthlyRent(int monthlyRent) {
        this.monthlyRent = monthlyRent;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public int getMaintenance() {
        return maintenance;
    }

    public void setMaintenance(int maintenance) {
        this.maintenance = maintenance;
    }

    @Override
    public String toString() {
        return "RentBill{" +
                "tenantName='" + tenantName + '\'' +
                ", houseName='" + houseName + '\'' +
                ", monthlyRent=" + monthlyRent +
                ", start='" + start + '\'' +
                ", end='" + end + '\'' +
                ", maintenance=" + maintenance +
                '}';
    }
}
