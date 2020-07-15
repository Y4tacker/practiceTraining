package com.renhouse.dao;

import com.renhouse.pojo.Tenant;

public interface TenantDao {


    /**
     * 根据租客用户名查询租客信息
     * @param tenantName 租客用户名
     * @return 如果返回null，说明没有这个租客，反之亦然
     */
    public Tenant queryTenantByTenantName(String tenantName);

    /**
     * 根据租客用户名和密码查询租客信息
     * @param tenantName
     * @param tenantPassword
     * @return 如果返回null，说明没有这个租客，反之亦然
     */
    public Tenant queryTenantByTenantNameAndPassword(String tenantName,String tenantPassword);

    /**
     * 保存租客信息
     * @param tenant
     * @return 返回-1表示操作失败，其他是sql语句影响的行数
     */
    public int saveTenant(Tenant tenant);

}
