package com.renhouse.junit;

import com.renhouse.dao.TenantDao;
import com.renhouse.dao.impl.TenantDaoImpl;
import com.renhouse.pojo.Tenant;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

import static org.junit.Assert.*;

public class TenantDaoImplTest {


    @Test
    public void queryTenantByTenantName() {
        TenantDao tenantDao = new TenantDaoImpl();
        System.out.println(tenantDao.queryTenantByTenantName("abcd123a"));
    }

    @Test
    public void queryTenantByTenantNameAndPassword() {
        TenantDao tenantDao = new TenantDaoImpl();
        System.out.println(tenantDao.queryTenantByTenantNameAndPassword("abcd123a","aaaa"));
    }

    @Test
    public void addTenant() {
        TenantDao tenantDao = new TenantDaoImpl();
        String tenantName = "哈哈租客";
        String password = "whs";
        String landlord = "我是房东";
        Tenant tenant = new Tenant(null,tenantName,password,landlord);
        tenantDao.addTenant(tenant);
    }

    @Test
    public void deleteTenantById() {
        TenantDao tenantDao = new TenantDaoImpl();
        System.out.println(tenantDao.deleteTenantById(2));
    }

    @Test
    public void updateTenant() {
        TenantDao tenantDao = new TenantDaoImpl();
        String tenantName = "憨憨租客";
        String password = "woshihanhan";
        String landlord = "憨憨房东";
        Tenant tenant = new Tenant(4,tenantName,password,landlord);
        tenantDao.updateTenant(tenant);
    }

    @Test
    public void queryTenantById() {
        TenantDao tenantDao = new TenantDaoImpl();
        System.out.println(tenantDao.queryTenantById(4));
    }

    @Test
    public void queryTenants() {
        TenantDao tenantDao = new TenantDaoImpl();
        List<Tenant> tenants = tenantDao.queryTenants();
        for(Tenant tenant:tenants){
            System.out.println(tenant);
        }
    }
}
