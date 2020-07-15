package com.renhouse.pojo;

public class Tenant {
    private Integer id;
    private String tenantName;
    private String tenantPassword;
    private String landlord;

    public Tenant() {
    }

    public Tenant(Integer id, String tenantName, String password, String landlord) {
        this.id = id;
        this.tenantName = tenantName;
        this.tenantPassword = password;
        this.landlord = landlord;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getTenantPassword() {
        return tenantPassword;
    }

    public void setTenantPassword(String tenantPassword) {
        this.tenantPassword = tenantPassword;
    }

    public String getLandlord() {
        return landlord;
    }

    public void setLandlord(String landlord) {
        this.landlord = landlord;
    }

    @Override
    public String toString() {
        return "Tenant{" +
                "id=" + id +
                ", tenantName='" + tenantName + '\'' +
                ", tenantPassword='" + tenantPassword + '\'' +
                ", landlord='" + landlord + '\'' +
                '}';
    }
}
