package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.TenantDao;
import com.renhouse.pojo.Tenant;

public class TenantDaoImpl extends BaseDao implements TenantDao {

    @Override
    public Tenant queryTenantByTenantName(String tenantName) {
        String sql = "select `id`,`tenantName`,`tenantPassword`,`landlord` from t_tenant where tenantName = ?";
        return queryForOne(Tenant.class, sql, tenantName);
    }

    @Override
    public Tenant queryTenantByTenantNameAndPassword(String tenantName, String tenantPassword) {
        String sql = "select `id`,`tenantName`,`tenantPassword`,`landlord` from t_tenant where tenantName = ? and tenantPassword =?";
        return queryForOne(Tenant.class, sql, tenantName,tenantPassword);
    }

    @Override
    public int saveTenant(Tenant tenant) {
        String sql = "insert into t_tenant(`tenantName`,`tenantPassword`,`landlord`) values(?,?,?)";
        return update(sql,tenant.getTenantName(),tenant.getTenantName(),tenant.getLandlord());
    }
}
