package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.TenantDao;
import com.renhouse.pojo.Tenant;

import java.util.List;

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
    public int addTenant(Tenant tenant) {
        String sql = "insert into t_tenant(`tenantName`,`tenantPassword`,`landlord`) values(?,?,?)";
        return update(sql,tenant.getTenantName(),tenant.getTenantPassword(),tenant.getLandlord());
    }

    @Override
    public int deleteTenantById(Integer id) {
        String sql = "delete from t_tenant where id = ?";
        return update(sql,id);
    }

    @Override
    public int updateTenant(Tenant tenant) {
        String sql = "update t_tenant set tenantName = ?,tenantPassword = ?,landlord = ? where id = ?";
        return update(sql,tenant.getTenantName(),tenant.getTenantPassword(),tenant.getLandlord(),tenant.getId());
    }

    @Override
    public Tenant queryTenantById(Integer id) {
        String sql = "select `id`,`tenantName`,`tenantPassword`,`landlord` from t_tenant where id = ?";
        return queryForOne(Tenant.class,sql,id);
    }

    @Override
    public List<Tenant> queryTenants() {
        String sql = "select `id`,`tenantName`,`tenantPassword`,`landlord` from t_tenant";
        return queryForList(Tenant.class,sql);
    }
/*
    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(id) from t_tenant";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Tenant> queryForPageItems(int begin, int pageSize) {
        String sql = "select select `id`,`tenantName`,`tenantPassword`,`landlord` from t_tenant limit ?,?";
        return queryForList(Tenant.class,sql,begin,pageSize);
    }*/
}