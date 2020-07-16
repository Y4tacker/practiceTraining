package com.renhouse.dao;

import java.util.List;
import com.renhouse.pojo.Tenant;

public interface TenantDao {

    public Tenant queryTenantByTenantName(String tenantName);

    public List<Tenant> queryTenantByRealName(String realName);

    public int addTenant(Tenant tenant);

    public int deleteTenantById(Integer id);

    public int updateTenant(Tenant tenant);

    public Tenant queryTenantById(Integer id);

    public List<Tenant> queryTenants();

//    Integer queryForPageTotalCount();

//    List<Tenant> queryForPageItems(int begin, int pageSize);

}
